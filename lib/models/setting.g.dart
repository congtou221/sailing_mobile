// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting()
  ..userid = (json['userid'] as num?)?.toInt()
  ..username = json['username'] as String?
  ..theme = json['theme'] as String?
  ..cache = json['cache'] == null
      ? null
      : Cache.fromJson(json['cache'] as Map<String, dynamic>);

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'userid': instance.userid,
      'username': instance.username,
      'theme': instance.theme,
      'cache': instance.cache?.toJson(),
    };
