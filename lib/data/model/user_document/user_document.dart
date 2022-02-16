import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_document.freezed.dart';
part 'user_document.g.dart';

@freezed
abstract class UserDocument with _$UserDocument {
  factory UserDocument({
    required String id,
    @Default("") String name,
    @Default("") String token,
  }) = _UserDocument;

  factory UserDocument.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    final json = {'id': doc.id, ...data!};
    return UserDocument.fromJson(json);
  }

  factory UserDocument.fromJson(Map<String, dynamic> json) =>
      _$UserDocumentFromJson(json);
}