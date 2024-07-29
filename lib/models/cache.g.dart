// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cache _$CacheFromJson(Map<String, dynamic> json) => Cache()
  ..enable = json['enable'] as bool?
  ..maxAge = (json['maxAge'] as num?)?.toInt()
  ..maxCount = (json['maxCount'] as num?)?.toInt();

Map<String, dynamic> _$CacheToJson(Cache instance) => <String, dynamic>{
      'enable': instance.enable,
      'maxAge': instance.maxAge,
      'maxCount': instance.maxCount,
    };
