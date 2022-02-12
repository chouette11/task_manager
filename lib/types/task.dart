import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  Task(DocumentSnapshot doc) {
    taskId = doc.id;
    print(doc.data());
    final data = doc.data() as Map<String, dynamic>;
    final _tasks = data['taskData'].cast<Map<String, dynamic>>()
    as List<Map<String, dynamic>>;
    taskData = _tasks.map((item) => <String, dynamic>{
      'id': item['id'] as int,
      'task': item['task'] as String,
      'limit' : item['limit'].toDate() as DateTime,
      'noLimit': item['noLimit'] as bool,
    }).toList();
    pastTime = data['pastTime'].toDate();
  }
  var taskId;
  var taskData;
  var pastTime;
}
