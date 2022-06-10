import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  Task(QueryDocumentSnapshot doc) {
    docId = doc.id;
    final data = doc.data() as Map<String, dynamic>;
    id = data['id'] as String;
    title = data['title'] as String;
    limit = data['limit'].toDate() as DateTime;
    isLimit = data['isLimit'] as bool;
  }
  var docId;
  var id;
  var title;
  var limit;
  var isLimit;
}