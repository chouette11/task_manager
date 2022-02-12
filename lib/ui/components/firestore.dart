import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/types/task.dart';

Future setTasks(List<Map<String, dynamic>> taskData) async {
  try {
    var now = DateTime.now();
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    tasks.doc("フクダ")
        .set(<String, dynamic>{
      'pastTime': now,
      'taskData': taskData,
    },
      SetOptions(merge: false),
    );
  } catch (e) {
    print(e);
  }
}

Future onCheck(int id, DateTime limit, bool noLimit, String task) async {
  try {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    tasks.doc('フクダ').update({
        'taskData': FieldValue.arrayRemove([{
          'id': id,
          'limit': limit,
          'noLimit': noLimit,
          'task': task,
        }])
      });
    tasks.doc('フクダ').update({
      'doneTaskData': FieldValue.arrayUnion([{
        'id': id,
        'limit': limit,
        'task': task,
      }])
    });
  } catch(e) {

  }
}

Future onAdd(int id, DateTime limit, String task) async {
  try{
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    tasks.doc('フクダ').update({
      'taskData': FieldValue.arrayRemove([{
        'id': id,
        'limit': limit,
        'task': task,
      }])
    });
    tasks.doc('フクダ').update({
      'taskData': FieldValue.arrayUnion([{
        'id': id,
        'limit': limit.add(Duration(days: 1)),
        'task': task,
      }])
    });
  } catch(e) {

  }
}

Future<Task?> getTaskFromFirestore(String uid) async {
  try {
    final doc = await FirebaseFirestore.instance.collection('tasks').doc('フクダ').get();
    return Task(doc);
  } catch (e) {
    print(e);
    return null;
  }
}