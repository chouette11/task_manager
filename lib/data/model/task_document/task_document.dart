import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_document.freezed.dart';
part 'task_document.g.dart';

@freezed
abstract class TaskDocument with _$TaskDocument {
  factory TaskDocument({
    required String id,
    @Default("") String name,
    @Default("") String token,
  }) = _TaskDocument;

  factory TaskDocument.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    final json = {'id': doc.id, ...data!};
    return TaskDocument.fromJson(json);
  }

  factory TaskDocument.fromJson(Map<String, dynamic> json) =>
      _$TaskDocumentFromJson(json);
}