import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/task_row.dart';

class TaskView extends ConsumerStatefulWidget {
  TaskView({Key? key}) : super(key: key);

  @override
  TaskViewState createState() => TaskViewState();
}

class TaskViewState extends ConsumerState<TaskView> {
  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(itemsStreamProvider);
    print("これ");
    print(tasks);
    return Container(
        child: tasks.when(
            data: (items) {
              print(items);
              List<Widget> tasks = [];
              int num = 0;
              items.taskData.forEach((element) {
                print(element);
                tasks.add(TaskCard(taskData: element, num: num));
                num++;
              });
              return ListView(
                children: tasks.reversed.toList(),
              );
            },
            error: (error, _) => Text(error.toString()),
            loading: () => const CircularProgressIndicator())
    );
  }
}