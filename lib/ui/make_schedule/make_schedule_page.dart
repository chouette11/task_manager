import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/top/top_page.dart';
import 'package:task_manager/ui/xxx/xxx_view_model.dart';

class MakeSchedulePage extends ConsumerWidget {
  const MakeSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(xxxViewModelProvider);
    final viewModel = ref.watch(xxxViewModelProvider.notifier);
    return state.when(
      data: (data) {
        return Scaffold();
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
