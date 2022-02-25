

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/components/layout/default.dart';
import 'package:task_manager/ui/xxx/xxx_state.dart';
import 'package:task_manager/ui/xxx/xxx_view_model.dart';

class XXXPage extends ConsumerWidget {
  const XXXPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(xxxViewModelProvider);
    final viewModel = ref.watch(xxxViewModelProvider.notifier);
    return DefaultLayout<XXXState>(
        state: state,
        backgroundColor: Colors.black,
        builder: (data) => Column(),
    );
  }
}
