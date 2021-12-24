import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

Future<List<Widget>?> onEventButton(GoogleSignIn googleSignIn, int type) async {
  try {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    print('---------- サインイン>');
    print(googleSignInAccount.toString());

    // リクエストから、認証情報を取得
    var client = GoogleHttpClient(await googleSignInAccount!.authHeaders);
    var calendar = CalendarApi(client);

    String calendarId = "primary";
    Event event = Event();

    switch (type) {
      case 0:
        event.summary = "開始";
        break;
      case 1:
        event.summary = "終了";
        break;
      default:
        break;
    }

    EventDateTime start = EventDateTime();
    start.dateTime = DateTime.now();
    start.timeZone = "GMT+09:00";
    event.start = start;

    EventDateTime end = EventDateTime();
    end.timeZone = "GMT+09:00";
    end.dateTime = DateTime.now().add(Duration(days: 1));
    event.end = end;

    final events = await calendar.events.list(calendarId);
    print(events.items![4].summary);
    print("取得中です");
    List<Widget> tasks = [];
    events.items!.forEach((element) {
      if (element.summary != null) {
        tasks.add(Text(element.summary!));
      }
    });

    String id = events.items![0].id!;

    final book = await calendar.events.get(calendarId, id).then((value) {
      if (value.status == "confirmed") {
        print('イベントの追加に成功');
      } else {
        print("イベントの追加失敗");
      }
    });
    print(book);
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