import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/types/task.dart';

final tasksStreamProvider = StreamProvider<Task>((ref) {
  final googleUser = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://www.googleapis.com/auth/calendar',
  ]);
  // setCalendar(googleUser);
  final collection = FirebaseFirestore.instance.collection('tasks');
  final stream = collection.doc('フクダ').snapshots();

  return stream.map((event) => Task(event));
});