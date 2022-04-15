import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/types/task.dart';

import '../../../data/repository/firestore/firestore_repository.impl.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({Key? key, required this.taskData}) : super(key: key);
  final TaskData taskData;

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
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  taskData.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () => firestoreRepository.onCheck(taskData: taskData),
                  icon: Icon(Icons.check_circle_outline),
                ),
              ],
            ),

            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                taskData.isLimit == false ?
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
