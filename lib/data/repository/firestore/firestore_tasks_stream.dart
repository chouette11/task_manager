import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/types/task.dart';

final tasksStreamProvider = StreamProvider<List<TaskData>>((ref) async* {
  final googleUser = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://www.googleapis.com/auth/calendar',
  ]);
  // setCalendar(googleUser);
  final collection = FirebaseFirestore.instance.collection('tasks');
  final token = await FirebaseMessaging.instance.getToken();
  final stream = collection.where('id', isEqualTo: token!).limit(2).snapshots();

  yield* stream.map((event) => event.docs.map((e) => TaskData(e)).toList());
});