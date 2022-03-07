import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/components/layout/default.dart';
import 'package:task_manager/ui/top/top_state.dart';
import 'package:task_manager/ui/top/top_view_model.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(topViewModelProvider);
    final viewModel = ref.watch(topViewModelProvider.notifier);
    return DefaultLayout<TopState>(
        state: state,
        backgroundColor: Colors.black,
        builder: (data) => Column(),
    );
  }
}
