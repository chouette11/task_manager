import 'package:flutter/material.dart';
import 'package:task_manager/ui/components/firestore.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key, required this.taskData}) : super(key: key);
  final Map<String, dynamic> taskData;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    Duration diff = taskData['limit'].difference(now);
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
                  taskData['task'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () => onCheck(
                    taskData['id'],
                    taskData['limit'],
                    taskData['noLimit'],
                    taskData['task'],
                  ),
                  icon: Icon(Icons.check_circle_outline),
                ),
              ],
            ),

            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                taskData['noLimit'] == false ?
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
