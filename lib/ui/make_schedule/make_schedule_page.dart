import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/ui/make_schedule/components/pie_chart.dart';
import 'package:task_manager/ui/make_schedule/make_schedule_view_model.dart';
import 'package:task_manager/ui/top/top_page.dart';

import './components/task_card.dart';

class MakeSchedulePage extends ConsumerWidget {
  const MakeSchedulePage({Key? key, required this.getUpTime,}) : super(key: key);
  final DateTime getUpTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(makeScheduleViewModelProvider);
    final viewModel = ref.watch(makeScheduleViewModelProvider.notifier);
    return state.when(
      data: (data) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 16),
              child: Column(
                children: [
                  CustomPieChart(
                    pieData: data.pieData,
                    colors: data.pieColors,
                    legends: data.pieLegends,
                    initialAngle: viewModel.timeToAngle(getUpTime),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      children: data.taskData.map((task) =>
                          GestureDetector(
                            onTap: () => viewModel.onAddTaskToPieData(task.title),
                            child: TaskCard(task: task),
                          ),
                      ).toList(),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text("時間"),
                        ),
                        Expanded(
                          child: Slider(
                            value: data.currentSliderValue,
                            max: 4,
                            divisions: 8,
                            label: "${data.currentSliderValue.toString()}" + "時間",
                            onChanged: viewModel.onChangeSliderValue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 32,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("休憩"),
                          ElevatedButton(
                            onPressed: () => viewModel.onAddTaskToPieData('休憩', hours: 0.25),
                            child: Text("15分"),
                          ),
                          ElevatedButton(
                            onPressed: () => viewModel.onAddTaskToPieData('休憩', hours: 0.5),
                            child: Text("30分"),
                          ),
                          ElevatedButton(
                            onPressed: () => viewModel.onAddTaskToPieData('休憩', hours: 1),
                            child: Text("1時間"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.pop,
                          child: Text("戻る"),
                        ),
                        ElevatedButton(
                          onPressed: () => context.go('/'),
                          child: Text("就寝"),
                        ),
                      ],
                    ),
                  )
                ],
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
