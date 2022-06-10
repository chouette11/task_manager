import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/firestore/firestore_tasks_stream.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/types/task.dart';
import 'package:task_manager/ui/top/sub_pages/limit_task/components/circular_slider.dart';
import 'package:task_manager/ui/top/sub_pages/limit_task/components/control_button.dart';
import 'package:task_manager/ui/top/sub_pages/limit_task/components/limit_task_card.dart';


class TaskLimitPage extends ConsumerStatefulWidget {
  const TaskLimitPage({Key? key}) : super(key: key);

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
            tasks.when(
              data: (items) {
                List<Task> todayTasks = [];
                items.forEach((element) {
                  Duration diff = element.limit.difference(now);
                  int days = diff.inDays;
                  int hours = diff.inHours - (days * 24);
                  int minutes = diff.inMinutes - (days * 24 * 60) - (hours * 60);
                  if (days >= 0 && days < 1 && hours >= 0 && minutes >= 0) {
                    todayTasks.add(element);
                  } else if (element.isLimit == true && check.state == true) {
                    todayTasks.add(element);
                  }
                });
                int random = Random().nextInt(todayTasks.length);
                return Column(
                  children: [
                    LimitTaskCard(taskData: todayTasks[random]),

                    SizedBox(height: 32),

                    CircularSlider(),

                    SizedBox(height: 32),

                    ControlButtons(false)
                  ],
                );
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
