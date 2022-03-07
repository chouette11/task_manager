import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/ui/top/components/task_card.dart';

class TaskViewPage extends ConsumerStatefulWidget {
  TaskViewPage({Key? key}) : super(key: key);

  @override
  TaskViewState createState() => TaskViewState();
}

class TaskViewState extends ConsumerState<TaskViewPage> {
  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(itemsStreamProvider);
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 136,
      child: tasks.when(
        data: (items) {
          List<Widget> tasks = [];
          items.taskData.forEach((element) {
            tasks.add(TaskCard(taskData: element));
          });
          return ListView(
            children: tasks.reversed.toList(),
          );
        },
        error: (error, _) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}