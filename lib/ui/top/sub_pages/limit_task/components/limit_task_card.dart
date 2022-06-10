import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/firestore/firestore_repository.impl.dart';
import 'package:task_manager/types/task.dart';


class LimitTaskCard extends ConsumerWidget {
  const LimitTaskCard({Key? key, required this.taskData}) : super(key: key);
  final Task taskData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreRepository = ref.read(firestoreRepositoryProvider);
    var now = DateTime.now();
    Duration diff = taskData.limit.difference(now);
    int days = diff.inDays;
    int hours = diff.inHours - (days * 24);
    int minutes = diff.inMinutes - (days * 24 * 60) - (hours * 60);
    String limit = "${days.toString()}日${hours.toString()}時間${minutes.toString()}分";
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "今日のタスク",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.restart_alt),
                        onPressed: (){},
                      )
                    ],
                  ),
                )
                
              ],
            ),

            Text(
              taskData.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),

            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                taskData.isLimit == true ?
                Text(
                  "残り時間 $limit",
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
