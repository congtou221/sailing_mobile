import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/widgets.dart';

import '../common/global.dart';

class Request {
  BuildContext? context;
  late Options _options;

  Request([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static Dio dio = new Dio(
    BaseOptions(baseUrl: 'http://service.sailingfor.com'),
  );

  static void init() {
// 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
        final client = HttpClient();

        // client.findProxy = (uri) {
        //   return 'PROXY 192.168.50.154:8888';
        // };

        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;

        return client;
      });
    }
  }

  //提交试卷照片
  Future<void> submitPaperPhotos({
    Map<String, dynamic>? queryParameters, //query参数，用于接收分页信息
    refresh = false,
  }) async {
    FormData formData = FormData.fromMap({
      "file1": File("./upload.txt"),
      "file2": File("./upload.txt"),
      // 支持文件数组上传
      "files": [
        File("./example/upload.txt"),
        File("./example/upload.txt"),
      ]
    });
    Response response = await dio.post<List>("/upload", data: formData);

    if (response.statusCode == HttpStatus.ok) {}
    // return r.data!.map((e) => Repo.fromJson(e)).toList();
  }
}
