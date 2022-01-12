import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart' show AndroidNotificationDetails, NotificationDetails;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/calendar.dart';
import 'package:task_manager/firestore.dart';
import 'package:task_manager/google_signin_method.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_view.dart';
import 'package:task_manager/your_task.dart';

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
        body: MyFirestorePage(),
      ),
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
    return Column(
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
    );
  }
}

class MyFirestorePage extends StatefulWidget {
  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}
class _MyFirestorePageState extends State<MyFirestorePage> {
  // プッシュ通知用
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((token) {
      print("$token");
      print("aaaa");
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("フォアグラウンドでメッセージを受け取りました");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // フォアグラウンドで通知を受け取った場合、通知を作成して表示する

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Push通知テスト"),
        )
    );
  }
}