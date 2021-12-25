import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager/calendar.dart';
import 'package:task_manager/google_signin_method.dart';

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
  runApp(
    ProviderScope(child: MyApp()));
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
                  onPressed: () async { await onEventButton(googleUser, 0);},
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

class TaskView extends ConsumerStatefulWidget {
  TaskView({Key? key}) : super(key: key);

  @override
  TaskViewState createState() => TaskViewState();
}

class TaskViewState extends ConsumerState<TaskView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(taskProvider);
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskProvider);
    return Container(
      child: tasks.when(
          data: (list) => list!.isNotEmpty
          ? ListView(
            children: list,
          )
          : const Text('List is empty'),
          error: (error, _) => Text(error.toString()),
          loading: () => const CircularProgressIndicator())
    );
  }
}