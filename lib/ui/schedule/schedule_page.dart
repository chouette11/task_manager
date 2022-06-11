import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/schedule/schedule_view_model.dart';
import 'package:task_manager/ui/top/top_page.dart';
import 'package:task_manager/ui/xxx/xxx_view_model.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scheduleViewModelProvider);
    final viewModel = ref.watch(scheduleViewModelProvider.notifier);
    return state.when(
      data: (data) {
        return Scaffold();
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
