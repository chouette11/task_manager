import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:task_manager/components/firestore.dart';
import 'package:task_manager/types/task.dart';

Future<void> setCalendar(GoogleSignIn googleSignIn, int type) async {
  try {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    print('---------- サインイン>');
    print(googleSignInAccount.toString());

    // リクエストから、認証情報を取得
    var client = GoogleHttpClient(await googleSignInAccount!.authHeaders);
    var calendar = CalendarApi(client);

    String calendarId = "primary";

    final events = await calendar.events.list(calendarId); // googleカレンダーから取得
    Task? task = await getTaskFromFirestore('フクダ'); // Firestoreから取得

    int id = task!.taskData.length;
    List<Map<String, dynamic>> tasksData = task.taskData;
    events.items!.forEach((element) {
      if (element.created!.isAfter(task.pastTime)) {
        if (element.summary != null) { // 以前にFirestoreが読み込まれた時間とイベントが作成された時間を比較して追加
          tasksData.add(<String, dynamic> {
            'id': id,
            'task': element.summary!,
            'limit' : element.end!.dateTime,
          });
          id++;
        }
      }
    });
    setTasks(tasksData);
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