import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/widgets.dart';
import 'package:sailing_mobile/models/oss_token.dart';

import '../common/global.dart';
import '../models/paper_mark_details.dart';

abstract class ResponseStatus {
  static const int success = 0;
  static const int loginStatusExpired = 1001;
  static const int badRequest = 4001;
  static const int internalServerError = 5001;
  static const int unknownError = 9999;
  static const int networkError = 9998;
}

class Request {
  BuildContext? context;
  late Options _options;

  Request([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static Dio dio = Dio(
    BaseOptions(baseUrl: 'http://service.sailingfor.com'),
  );

  static void init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
          // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
          print(options.baseUrl);
          options.queryParameters.putIfAbsent('subject_code', () => 2);
          options.queryParameters.putIfAbsent('period_code', () => 2);
          options.queryParameters.putIfAbsent('uid', () => 100050);
          options.queryParameters.putIfAbsent('sid', () => 100050);

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (response.statusCode == HttpStatus.ok) {
            switch (response.data['code']) {
              case ResponseStatus.success:
                return handler.next(response);
              case ResponseStatus.loginStatusExpired:
                throw response;
              default:
                throw response;
            }
          }

          throw response;
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
          print('Error: ${error.message}');
          return handler.next(error);
        },
      ),
    );
// 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    // if (!Global.isRelease) {
    //   dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
    //     final client = HttpClient();

    //     // client.findProxy = (uri) {
    //     //   return 'PROXY 192.168.50.154:8888';
    //     // };

    //     //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;

    //     return client;
    //   });
    // }
  }

  // 获取OSS上传临时凭证
  Future getOSSToken() async {
    return dio
        .post("/aliyun/oss/get_presigned_url_for_oss_upload")
        .then((resp) => OssToken.fromJson(resp.data));
  }

  Future getPaperMarkDetails(data) {
    return dio
        .post('/paper/assess/mark', data: data)
        .then((resp) => PaperMarkDetails.fromJson(resp.data));
  }
}

// 上传阿里云OSS
Future putToOSS(String url, File file) async {
  print('putToOSS: $file');
  return Dio(BaseOptions(headers: {
    'Content-Type': "application/zip",
  })).put(url, data: file.readAsBytesSync());
}
