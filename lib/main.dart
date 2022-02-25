import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/types/task.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/ui/login/login_page.dart';
import 'package:task_manager/ui/top/top_page.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("バックグラウンドでメッセージを受け取りました");
}

final itemsStreamProvider = StreamProvider<Task>((ref) {
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

final checkStateProvider = StateProvider((ref) => false);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
  );
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.getToken().then((String? token) {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      users.doc('フクダ').set({
        'name': "ふくだ",
        'token': token,
      });
      print("$token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("フォアグラウンドでメッセージを受け取りました");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: 'launch_background',
              ),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/top',
          builder: (context, state) => const TopPage(),
        ),
      ],
    );

    return  MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}