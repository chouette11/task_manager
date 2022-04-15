import 'package:flutter/material.dart';
import 'package:task_manager/types/task.dart';
import 'package:task_manager/ui/components/firestore.dart';

class NowTaskCard extends StatelessWidget {
  const NowTaskCard({Key? key, required this.taskData}) : super(key: key);
  final TaskData taskData;

  @override
  Widget build(BuildContext context) {
    String limit = "";
    if (taskData.isLimit == false) {
      var now = DateTime.now();
      Duration diff = taskData.limit.difference(now);
      int days = diff.inDays;
      int hours = diff.inHours - (days * 24);
      int minutes = diff.inMinutes - (days * 24 * 60) - (hours * 60);
      limit = "${days.toString()}日${hours.toString()}時間${minutes.toString()}分";
    }
    return Container(
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
                    fontSize: 32,
                  ),
                ),
                GestureDetector(
                  onTap: () => onCheck(taskData,),
                  child: Icon(Icons.check_circle_outline),
                ),
              ],
            ),
            Row(
              children: [
                Text(limit)
              ],
            )
          ],
        ),
      ),
    );
  }
}
