import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:task_manager/calendar.dart';

Future editDiary(GoogleSignIn googleSignIn) async {
  try {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    print('---------- サインイン>');
    print(googleSignInAccount.toString());

    // リクエストから、認証情報を取得
    var client = GoogleHttpClient(await googleSignInAccount!.authHeaders);
    var calendar = CalendarApi(client);

    String calendarId = "primary";

    final events = await calendar.events.list(calendarId);
    print(events.items![4].summary);
    print("取得中です");
    List<String?> tasks = [];
    events.items!.forEach((element) {
      if (element.summary != null) {
        tasks.add(element.summary);
      }
    });

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