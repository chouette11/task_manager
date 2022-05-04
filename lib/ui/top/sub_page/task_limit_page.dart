import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/firestore/firestore_tasks_stream.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/types/task.dart';

import '../components/now_task_card.dart';

class TaskLimitPage extends ConsumerStatefulWidget {
  const TaskLimitPage(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  OneDayTaskState createState() => OneDayTaskState();
}

class OneDayTaskState extends ConsumerState<TaskLimitPage> {
  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(tasksStreamProvider);
    final check = ref.watch(checkStateProvider.notifier);
    var now = DateTime.now();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 136,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "あなたの${widget.index}日間のタスクは",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            tasks.when(
              data: (items) {
                List<TaskData> todayTasks = [];
                items.forEach((element) {
                  Duration diff = element.limit.difference(now);
                  int days = diff.inDays;
                  int hours = diff.inHours - (days * 24);
                  int minutes = diff.inMinutes - (days * 24 * 60) - (hours * 60);
                  if (days >= 0 && days < widget.index && hours >= 0 && minutes >= 0) {
                    todayTasks.add(element);
                  } else if (element.isLimit == true && check.state == true) {
                    todayTasks.add(element);
                  }
                });

                if (todayTasks.length == 0) {
                  return Text("ありません");
                }
                int random = Random().nextInt(todayTasks.length);
                return NowTaskCard(taskData: todayTasks[random]);
              },
              error: (error, _) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
