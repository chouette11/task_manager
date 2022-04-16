import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:task_manager/data/api/client.dart';

Future<List<Map<String, dynamic>>> getTaskFromCalendar(GoogleSignIn googleSignIn) async {
  try {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    // リクエストから、認証情報を取得
    var client = GoogleHttpClient(await googleSignInAccount!.authHeaders);
    var calendar = CalendarApi(client);

    String calendarId = "primary";
    var twoWeek = DateTime.now();
    twoWeek.add(Duration(days: 14));

    final events = await calendar.events.list(calendarId, singleEvents: true, timeMax: twoWeek); // googleカレンダーから取得

    List<Map<String, dynamic>> tasksData = [];
    events.items!.forEach((element) {
      // if (element.created!.isAfter(task.pastTime)) {
        if (element.summary != null) { // 以前にFirestoreが読み込まれた時間とイベントが作成された時間を比較して追加
          if (element.end!.date != null) {
            DateTime? date = element.end!.date;
            date!.add(Duration(days: -1));
            tasksData.add(<String, dynamic>{
              'id': 10,
              'task': element.summary! + " " + date.month.toString() + "月" + date.day.toString() + "日",
              'noLimit': false,
              'limit': date,
            });
          } else {
            tasksData.add(<String, dynamic>{
              'id': 10,
              'task': element.summary!,
              'noLimit': false,
              'limit': element.end!.dateTime,
            });
          }
        }
      // }
    });

    return tasksData;
  } catch (e) {
    print('エラー $e');
    List<Map<String, dynamic>> tasksData = [];
    return tasksData;
  }
}
