import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/types/task.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaSize = MediaQuery.of(context).size;
    var now = DateTime.now();
    Duration diff = task.limit.difference(now);
    int days = diff.inDays;
    int hours = diff.inHours - (days * 24);
    int minutes = diff.inMinutes - (days * 24 * 60) - (hours * 60);
    String limit = "${days.toString()}日${hours.toString()}時間${minutes.toString()}分";
    return Card(
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SizedBox(
                  width: mediaSize.width * 0.4,
                  child: Text(
                    task.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                task.isLimit == true ?
                Text(
                  "残り時間\n ""$limit",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ) : Container(),
              ],
            ),

            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}