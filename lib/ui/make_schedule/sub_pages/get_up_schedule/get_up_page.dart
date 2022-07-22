import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/make_schedule/sub_pages/get_up_schedule/get_up_view_model.dart';
import 'package:task_manager/ui/top/top_page.dart';

class GetUpPage extends ConsumerWidget {
  const GetUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getUpViewModelProvider);
    final viewModel = ref.watch(getUpViewModelProvider.notifier);
    return state.when(
      data: (data) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("何時に起きますか？"),
              GestureDetector(
                onTap: () => viewModel.timePicker(context),
                child: Text("${data.getUpTime?.format(context) ?? "00:00"}"),
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
