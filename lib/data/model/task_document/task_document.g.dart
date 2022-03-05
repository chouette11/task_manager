// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskDocument _$$_TaskDocumentFromJson(Map<String, dynamic> json) =>
    _$_TaskDocument(
      taskData: (json['taskData'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_TaskDocumentToJson(_$_TaskDocument instance) =>
    <String, dynamic>{
      'taskData': instance.taskData,
    };
