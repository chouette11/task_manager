// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDocument _$$_UserDocumentFromJson(Map<String, dynamic> json) =>
    _$_UserDocument(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      token: json['token'] as String? ?? "",
    );

Map<String, dynamic> _$$_UserDocumentToJson(_$_UserDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'token': instance.token,
    };
