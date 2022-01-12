import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/types/task.dart';

final itemsStreamProvider = StreamProvider<Task>((ref) {
  // users/{user.uid} ドキュメントのSnapshotを取得
  final collection = FirebaseFirestore.instance.collection('tasks');
  print(collection.snapshots().first);
  print(collection.doc('フクダ'));
  // データ（Map型）を取得

  final stream = collection.doc('フクダ').snapshots();

  return stream.map((event) => Task(event));
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
      home: Scaffold(
        appBar: AppBar(title: Text("タスク一覧")),
        body: TodayTask(),
      ),
    );
  }
}