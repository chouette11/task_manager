import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/make_schedule/components/pie_chart.dart';
import 'package:task_manager/ui/make_schedule/components/slider.dart';
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
                height: 320,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: data.taskData.map((task) =>
                      TaskCard(task: task)
                  ).toList(),
                ),
              ),
              CustomSlider()
            ],
          ),
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
