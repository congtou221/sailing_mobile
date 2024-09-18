// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_mark_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaperMarkDetails _$PaperMarkDetailsFromJson(Map<String, dynamic> json) =>
    PaperMarkDetails(
      (json['code'] as num).toInt(),
      json['msg'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaperMarkDetailsToJson(PaperMarkDetails instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['result'] as num).toInt(),
      json['msg'] as String,
      Details.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'details': instance.details.toJson(),
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      (json['assess_id'] as num).toInt(),
      (json['paper_id'] as num).toInt(),
      json['paper_title'] as String,
      Assessee.fromJson(json['assessee'] as Map<String, dynamic>),
      (json['full_score'] as num).toInt(),
      (json['score'] as num).toInt(),
      (json['types'] as List<dynamic>)
          .map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'assess_id': instance.assessId,
      'paper_id': instance.paperId,
      'paper_title': instance.paperTitle,
      'assessee': instance.assessee.toJson(),
      'full_score': instance.fullScore,
      'score': instance.score,
      'types': instance.types.map((e) => e.toJson()).toList(),
    };

Assessee _$AssesseeFromJson(Map<String, dynamic> json) => Assessee(
      (json['uid'] as num).toInt(),
      json['name'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$AssesseeToJson(Assessee instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'avatar': instance.avatar,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      (json['question_type'] as num).toInt(),
      json['title'] as String,
      (json['questions'] as List<dynamic>)
          .map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'question_type': instance.questionType,
      'title': instance.title,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      (json['question_id'] as num).toInt(),
      (json['mark_status'] as num).toInt(),
      (json['full_score'] as num).toInt(),
      (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'question_id': instance.questionId,
      'mark_status': instance.markStatus,
      'full_score': instance.fullScore,
      'score': instance.score,
    };
