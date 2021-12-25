import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:task_manager/firestore.dart';
import 'package:task_manager/task.dart';

Future<List<Widget>?> onEventButton(GoogleSignIn googleSignIn, int type) async {
  try {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    print('---------- サインイン>');
    print(googleSignInAccount.toString());

    // リクエストから、認証情報を取得
    var client = GoogleHttpClient(await googleSignInAccount!.authHeaders);
    var calendar = CalendarApi(client);

    String calendarId = "primary";

    final events = await calendar.events.list(calendarId);
    Task? task = await getTaskFromFirestore('フクダ');

    List<Map<String, dynamic>> tasksData = task!.tasks;
    events.items!.forEach((element) {
      if (element.created!.isAfter(task.pastTime)) {
        if (element.summary != null) {
          tasksData.add(<String, dynamic>{
            'task': element.summary!,
            'isFinish': false,
          });
        }
      }
    });
    setTasks(tasksData);

    List<Widget> tasks = [];
    tasksData.forEach((element) {
      print(element);
      if (element['isFinish'] == false) {
        tasks.add(Text(element['task']));
      }
    });
    return tasks;
  } catch (e) {
    print('エラー $e');
  }
}

class GoogleHttpClient extends IOClient {
  Map<String, String> _headers;

  GoogleHttpClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(dynamic url, {Map<String, String>? headers}) =>
      super.head(url, headers: headers!..addAll(_headers));
}