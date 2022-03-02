import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/ui/add_task/add_task_view_model.dart';
import 'package:task_manager/ui/components/form/text_field.dart';
import 'package:task_manager/ui/components/layout/default.dart';
import 'package:task_manager/ui/top/top_page.dart';

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addTaskViewModelProvider);
    final viewModel = ref.watch(addTaskViewModelProvider.notifier);

    return state.when(
      data: (data) {
        return Column(
          children: [
            Text("タスクを入力してね"),

            Row(
              children: [
                CustomTextFormField(
                  hintText: "年",
                  initialValue: data.task,
                  onChanged: viewModel.onChangedTask,
                  keyboardType: TextInputType.emailAddress,
                ),

              ],
            ),

            CustomTextFormField(
              hintText: "タスク",
              initialValue: data.task,
              onChanged: viewModel.onChangedTask,
              keyboardType: TextInputType.emailAddress,
            ),

            ElevatedButton(
              onPressed: () => context.pop(),
              child: Text("OK"),
            ),
          ],
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
