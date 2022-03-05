import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/ui/add_task/add_task_view_model.dart';
import 'package:task_manager/ui/add_task/components/date_add_button.dart';
import 'package:task_manager/ui/add_task/components/date_text_box.dart';
import 'package:task_manager/ui/components/form/text_field.dart';
import 'package:task_manager/ui/top/top_page.dart';

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTaskPage> {
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addTaskViewModelProvider);
    final viewModel = ref.watch(addTaskViewModelProvider.notifier);

    return state.when(
      data: (data) {
        _yearController.text = data.year.toString();
        _monthController.text = data.month.toString();
        _dayController.text = data.day.toString();
        _hourController.text = data.hour.toString();
        _minuteController.text = data.minute.toString();

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
                        DateTextBox(
                          hintText: "年",
                          controller: _yearController,
                          buttons: [
                            AddDateButton(
                              title: "+1",
                              onPressed: () => viewModel.onAddDate(1, 0, 0, 0, 0),
                            ),
                          ],
                        ),

                        DateTextBox(
                          hintText: "月",
                          controller: _monthController,
                          buttons: [
                            AddDateButton(
                              title: "+1",
                              onPressed: () => viewModel.onAddDate(0, 1, 0, 0, 0),
                            ),
                            AddDateButton(
                              title: "+2",
                              onPressed: () => viewModel.onAddDate(0, 2, 0, 0, 0),
                            ),
                          ],
                        ),

                        DateTextBox(
                          hintText: "日",
                          controller: _dayController,
                          buttons: [
                            AddDateButton(
                              title: "+1",
                              onPressed: () => viewModel.onAddDate(0, 0, 1, 0, 0),
                            ),
                            AddDateButton(
                              title: "+3",
                              onPressed: () => viewModel.onAddDate(0, 0, 3, 0, 0),
                            ),
                            AddDateButton(
                              title: "+7",
                              onPressed: () => viewModel.onAddDate(0, 0, 7, 0, 0),
                            ),
                          ],
                        ),

                        DateTextBox(
                          hintText: "時",
                          controller: _hourController,
                          buttons: [
                            AddDateButton(
                              title: "+1",
                              onPressed: () => viewModel.onAddDate(0, 0, 0, 1, 0),
                            ),
                            AddDateButton(
                              title: "+3",
                              onPressed: () => viewModel.onAddDate(0, 0, 0, 3, 0),
                            ),
                            AddDateButton(
                              title: "+6",
                              onPressed: () => viewModel.onAddDate(0, 0, 0, 6, 0),
                            ),
                          ],
                        ),

                        DateTextBox(
                          hintText: "分",
                          controller: _minuteController,
                          buttons: [
                            AddDateButton(
                              title: "+5",
                              onPressed: () => viewModel.onAddDate(0, 0, 0, 0, 5),
                            ),
                            AddDateButton(
                              title: "+20",
                              onPressed: () => viewModel.onAddDate(0, 0, 0, 0, 20),
                            ),
                            AddDateButton(
                              title: "+30",
                              onPressed: () => viewModel.onAddDate(0, 0, 0, 0, 30),
                            ),
                          ],
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
