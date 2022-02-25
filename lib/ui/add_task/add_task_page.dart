import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/add_task/add_task_state.dart';
import 'package:task_manager/ui/add_task/add_task_view_model.dart';
import 'package:task_manager/ui/components/layout/default.dart';

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(AddTaskViewModelProvider);
    final viewModel = ref.watch(AddTaskViewModelProvider.notifier);

    return DefaultLayout<AddTaskState>(
      state: state,
      backgroundColor: Colors.black,
      builder: (data) => Column(
        children: [

        ],
      ),
    );
  }
}
