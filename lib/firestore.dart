import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/task.dart';

Future editDiary(GoogleSignIn googleSignIn) async {
  try {
    var now = DateTime.now();
    CollectionReference diaries = FirebaseFirestore.instance.collection('tasks');
    return diaries
        .doc("フクダ")
        .set(<String, List<String?>>{
      'diaryData': tasks,
    },
      SetOptions(merge: true),
    );
  } catch (e) {
    print(e);
  }
}

// Future getDiary() async {
//   try {
//     final doc = await Collection.diaries.doc(user.uid).get();
//     diary = Diary(doc);
//     notifyListeners();
//   } catch (e) {
//     print(e);
//   }
// }

Future<Task?> getTaskFromFirestore(String uid) async {
  try {
    final doc = await FirebaseFirestore.instance.collection('tasks').doc('フクダ').get();
    return Task(doc);
  } catch (e) {
    print(e);
    return null;
  }
}

Future getTasks() async {

}