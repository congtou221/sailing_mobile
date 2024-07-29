import 'package:json_annotation/json_annotation.dart';

part 'cache.g.dart';

@JsonSerializable()
class Cache {
  bool? enable; // 是否启用缓存
  int? maxAge; // 缓存的最长时间，单位（秒）
  int? maxCount; // 最大缓存数

  Cache();

  factory Cache.fromJson(Map<String, dynamic> json) => _$CacheFromJson(json);
  Map<String, dynamic> toJson() => _$CacheToJson(this);
}
