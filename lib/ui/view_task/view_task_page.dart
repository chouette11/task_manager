import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/ui/top/components/task_card.dart';
import 'package:task_manager/ui/top/top_page.dart';
import 'package:task_manager/ui/view_task/view_task_view_model.dart';

class ViewTaskPage extends ConsumerWidget {
  const ViewTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(itemsStreamProvider);
    final state = ref.watch(viewTaskViewModelProvider);
    final viewModel = ref.watch(viewTaskViewModelProvider.notifier);
    return state.when(
      data: (data) {
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
              return Column(
                children: [
                  ListView(
                    children: tasks.reversed.toList(),
                  ),
                ],
              );
            },
            error: (error, _) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
