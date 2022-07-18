import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/make_schedule/components/pie_chart.dart';
import 'package:task_manager/ui/make_schedule/make_schedule_view_model.dart';
import 'package:task_manager/ui/top/top_page.dart';

import './components/task_card.dart';

class MakeSchedulePage extends ConsumerWidget {
  const MakeSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(makeScheduleViewModelProvider);
    final viewModel = ref.watch(makeScheduleViewModelProvider.notifier);
    final mediaSize = MediaQuery.of(context).size;
    return state.when(
      data: (data) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: PieChart(pieData: data.pieData),
              ),
              Container(
                width: mediaSize.width,
                height: 280,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: data.taskData.map((task) =>
                      GestureDetector(
                        onTap: () {
                          viewModel.onAddTaskToPieData(task.title);
                        },
                        child: TaskCard(task: task),
                      ),
                  ).toList(),
                ),
              ),
              Slider(
                value: data.currentSliderValue,
                max: 4,
                divisions: 8,
                label: "${data.currentSliderValue.toString()}" + "時間",
                onChanged: viewModel.onChangeSliderValue,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("休憩"),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("15分"),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("30分"),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("1時間"),
                  ),
                ],
              )
            ],
          ),
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
