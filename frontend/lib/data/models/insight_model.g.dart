// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsightModelImpl _$$InsightModelImplFromJson(Map<String, dynamic> json) =>
    _$InsightModelImpl(
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$InsightModelImplToJson(_$InsightModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
    };
