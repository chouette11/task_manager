import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/top/sub_pages/view_task/view_task_state.dart';

final viewTaskViewModelProvider =
StateNotifierProvider.autoDispose<ViewTaskViewModel, AsyncValue<ViewTaskState>>(
      (ref) => ViewTaskViewModel(ref: ref),
);

class ViewTaskViewModel extends StateNotifier<AsyncValue<ViewTaskState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  ViewTaskViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  /// 通信、初期化処理
  Future<void> load() async {

  }
}
