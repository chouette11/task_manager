import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  Task(DocumentSnapshot doc) {
    taskId = doc.id;
    final data = doc.data() as Map<String, dynamic>;
    final _tasks = data['tasks'].cast<Map<String, dynamic>>()
    as List<Map<String, dynamic>>;
    tasks = _tasks.map((item) => <String, dynamic>{
      'task': item['task'] as String,
      'isFinish': item['isFinish'] as bool,
    }).toList();
    pastTime = data['pastTime'].toDate();
  }
  var taskId;
  var tasks;
  var pastTime;
}
