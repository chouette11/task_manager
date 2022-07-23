import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.push('/get_up/:/make/:', extra: data.getUpTime),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "何時に起きますか？",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    initialDateTime: new DateTime.now(),
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    onDateTimeChanged: viewModel.changeDateTime,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (e, stackTrace) => TopPage(),
      loading: () => const TopPage(),
    );
  }
}
