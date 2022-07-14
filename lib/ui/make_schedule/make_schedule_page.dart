import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/make_schedule/make_schedule_view_model.dart';
import 'package:task_manager/ui/top/top_page.dart';

import './components/task_card.dart';

class MakeSchedulePage extends ConsumerWidget {
  const MakeSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(makeScheduleViewModelProvider);
    final viewModel = ref.watch(makeScheduleViewModelProvider.notifier);
    return state.when(
      data: (data) {
        return Scaffold(
          body: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                children: data.taskData.map((task) =>
                    GridTile(child: TaskCard(task: task))
                ).toList(),
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
