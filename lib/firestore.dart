import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/task.dart';

Future setTasks(List<Map<String, dynamic>> tasks) async {
  try {
    var now = DateTime.now();
    CollectionReference diaries = FirebaseFirestore.instance.collection('tasks');
    return diaries
        .doc("フクダ")
        .set(<String, dynamic>{
      'tasks': tasks,
      'pastTime': now,
    },
      SetOptions(merge: false),
    );
  } catch (e) {
    print(e);
  }
}

Future onCheck(int id, DateTime limit, String task) async {
  try {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    tasks.doc('フクダ').update({
        'taskData': FieldValue.arrayRemove([{
          'id': id,
          'limit': limit,
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

Future<void> setDebug(GoogleSignIn googleSignIn) async {
  try {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    print('---------- サインイン>');
    print(googleSignInAccount.toString());

    // リクエストから、認証情報を取得
    var client = GoogleHttpClient(await googleSignInAccount!.authHeaders);
    var calendar = CalendarApi(client);

    String calendarId = "primary";
    print("aa");

    final events = await calendar.events.list(calendarId);
    print("aa");

    int id = 0;
    List<Map<String, dynamic>> tasksData = [];
    print("aa");
    events.items!.forEach((element) {
      // if (element.created!.isAfter(task.pastTime)) {
      if (element.summary != null) {
        tasksData.add(<String, dynamic>{
          'id': id,
          'task': element.summary!,
          'limit': element.end!.dateTime,
        });
        id++;
      }
      // }
    });
    setTasks(tasksData);
  } catch(e) {
    print(e);
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