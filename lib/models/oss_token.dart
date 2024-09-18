import 'package:json_annotation/json_annotation.dart';

part 'oss_token.g.dart';

@JsonSerializable()
class OssToken {
  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'msg')
  String msg;
  @JsonKey(name: 'data')
  Data data;

  OssToken(
    this.code,
    this.msg,
    this.data,
  );

  factory OssToken.fromJson(Map<String, dynamic> json) =>
      _$OssTokenFromJson(json);

  Map<String, dynamic> toJson() => _$OssTokenToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'signed_URL')
  String? signed_URL;

  Data(
    this.signed_URL,
  );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
