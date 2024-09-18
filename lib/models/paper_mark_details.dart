import 'package:json_annotation/json_annotation.dart';

part 'paper_mark_details.g.dart';

@JsonSerializable()
class PaperMarkDetails {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  Data data;

  PaperMarkDetails(
    this.code,
    this.msg,
    this.data,
  );

  factory PaperMarkDetails.fromJson(Map<String, dynamic> srcJson) =>
      _$PaperMarkDetailsFromJson(srcJson);
  Map<String, dynamic> toJson() => _$PaperMarkDetailsToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'result')
  int result;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'details')
  Details details;

  Data(
    this.result,
    this.msg,
    this.details,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: 'assess_id')
  int assessId;

  @JsonKey(name: 'paper_id')
  int paperId;

  @JsonKey(name: 'paper_title')
  String paperTitle;

  @JsonKey(name: 'assessee')
  Assessee assessee;

  @JsonKey(name: 'full_score')
  int fullScore;

  @JsonKey(name: 'score')
  int score;

  @JsonKey(name: 'types')
  List<Types> types;

  Details(
    this.assessId,
    this.paperId,
    this.paperTitle,
    this.assessee,
    this.fullScore,
    this.score,
    this.types,
  );

  factory Details.fromJson(Map<String, dynamic> srcJson) =>
      _$DetailsFromJson(srcJson);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class Assessee {
  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'avatar')
  String avatar;

  Assessee(
    this.uid,
    this.name,
    this.avatar,
  );

  factory Assessee.fromJson(Map<String, dynamic> srcJson) =>
      _$AssesseeFromJson(srcJson);
  Map<String, dynamic> toJson() => _$AssesseeToJson(this);
}

@JsonSerializable()
class Types {
  @JsonKey(name: 'question_type')
  int questionType;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'questions')
  List<Questions> questions;

  Types(
    this.questionType,
    this.title,
    this.questions,
  );

  factory Types.fromJson(Map<String, dynamic> srcJson) =>
      _$TypesFromJson(srcJson);
  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class Questions {
  @JsonKey(name: 'question_id')
  int questionId;

  @JsonKey(name: 'mark_status')
  int markStatus;

  @JsonKey(name: 'full_score')
  int fullScore;

  @JsonKey(name: 'score')
  int score;

  Questions(
    this.questionId,
    this.markStatus,
    this.fullScore,
    this.score,
  );

  factory Questions.fromJson(Map<String, dynamic> srcJson) =>
      _$QuestionsFromJson(srcJson);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}
