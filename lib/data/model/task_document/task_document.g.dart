// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskDocument _$$_TaskDocumentFromJson(Map<String, dynamic> json) =>
    _$_TaskDocument(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      token: json['token'] as String? ?? "",
    );

Map<String, dynamic> _$$_TaskDocumentToJson(_$_TaskDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'token': instance.token,
    };
