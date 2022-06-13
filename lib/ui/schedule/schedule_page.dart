import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/schedule/components/schedule_box.dart';
import 'package:task_manager/ui/schedule/schedule_view_model.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scheduleViewModelProvider);
    final viewModel = ref.watch(scheduleViewModelProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          ScheduleBox()
        ],
      ),
    );
  }
}
