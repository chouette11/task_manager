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
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text("タスクを入力してね"),

                    Column(
                      children: [
                        CustomTextFormField(
                          hintText: "年",
                          initialValue: data.year.toString(),
                          onChanged: viewModel.onChangedYear,
                          keyboardType: TextInputType.number,
                        ),

                        CustomTextFormField(
                          hintText: "月",
                          initialValue: data.month.toString(),
                          onChanged: viewModel.onChangedMonth,
                          keyboardType: TextInputType.number,
                        ),

                        CustomTextFormField(
                          hintText: "日",
                          initialValue: data.day.toString(),
                          onChanged: viewModel.onChangedDay,
                          keyboardType: TextInputType.number,
                        ),

                        CustomTextFormField(
                          hintText: "時",
                          initialValue: data.hour.toString(),
                          onChanged: viewModel.onChangedHour,
                          keyboardType: TextInputType.number,
                        ),

                        CustomTextFormField(
                          hintText: "分",
                          initialValue: data.minute.toString(),
                          onChanged: viewModel.onChangedMinute,
                          keyboardType: TextInputType.number,
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
                ),
              ),
            ),
          ),
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
