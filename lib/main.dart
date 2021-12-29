import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/calendar.dart';
import 'package:task_manager/firestore.dart';
import 'package:task_manager/google_signin_method.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_view.dart';

final itemsStreamProvider = StreamProvider<Task>((ref) {
  // users/{user.uid} ドキュメントのSnapshotを取得
  final collection = FirebaseFirestore.instance.collection('tasks');
  print(collection.snapshots().first);
  print(collection.doc('フクダ'));
  // データ（Map型）を取得
  final data = collection.doc('フクダ').get();

  final stream = collection.doc('フクダ').snapshots().map((event) => Task(event));

  return stream;
});

final taskProvider = FutureProvider((ref) async {
  final googleUser = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://www.googleapis.com/auth/calendar',
  ]);

  final tasks = await onEventButton(googleUser, 0);
  return tasks;
});

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: true,  // <- Debug の 表示を OFF
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  final googleUser = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://www.googleapis.com/auth/calendar',
  ]);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(title: Text("タスク一覧")),
      body: Column(
        children: [
          Container(
              height: 400,
              child: TaskView()),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: Text('Google認証'),
                onPressed: () => GoogleSignInMethod().googleSignIn(),
              ),
              RaisedButton(
                child: Text('Google認証ログアウト'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  print('サインアウトしました。');
                },
              ),
              Text('別のGoogleアカウントでログインしたい場合、一回ログアウトする必要がある。'),
              ElevatedButton(
                  onPressed: () async { setDebug(googleUser);},
                  child: Text("calendar")),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(GoogleSignInMethod().currentUser!.displayName);
        },
      ),
    );
  }
}
