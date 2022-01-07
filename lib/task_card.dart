import 'package:flutter/material.dart';
import 'package:task_manager/firestore.dart';

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
    return Container(
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
                      fontSize: 16
                  ),
                ),
                GestureDetector(
                  onTap: () => onCheck(taskData['id'], taskData['limit'], taskData['task']),
                  child: Icon(Icons.check_circle_outline),
                )
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

class NowTask extends StatelessWidget {
  const NowTask({Key? key, required this.taskData}) : super(key: key);
  final Map<String, dynamic> taskData;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    Duration diff = taskData['limit'].difference(now);
    int days = diff.inDays;
    int hours = diff.inHours - (days * 24);
    int minutes = diff.inMinutes - (days * 24 * 60) - (hours * 60);
    String limit = "${days.toString()}日${hours.toString()}時間${minutes.toString()}分";
    return Container(
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
                      fontSize: 32,
                  ),
                ),
                GestureDetector(
                  onTap: () => onCheck(taskData['id'], taskData['limit'], taskData['task']),
                  child: Icon(Icons.check_circle_outline),
                )
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
