import 'package:json_annotation/json_annotation.dart';
import 'cache.dart';

part 'setting.g.dart';

@JsonSerializable()
class Setting {
  int? userid;
  String? username;
  String? theme;
  Cache? cache;

  Setting();

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);
  Map<String, dynamic> toJson() => _$SettingToJson(this);
}
