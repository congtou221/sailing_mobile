// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oss_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OssToken _$OssTokenFromJson(Map<String, dynamic> json) => OssToken(
      (json['code'] as num).toInt(),
      json['msg'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OssTokenToJson(OssToken instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['signed_URL'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'signed_URL': instance.signed_URL,
    };
