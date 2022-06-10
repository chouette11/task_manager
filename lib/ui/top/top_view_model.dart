import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/top/sub_pages/limit_task/task_limit_page.dart';
import 'package:task_manager/ui/top/sub_pages/view_task/view_task_page.dart';
import 'package:task_manager/ui/top/top_state.dart';

final topViewModelProvider =
    StateNotifierProvider.autoDispose<TopViewModel, AsyncValue<TopState>>(
  (ref) => TopViewModel(ref: ref),
);

class TopViewModel extends StateNotifier<AsyncValue<TopState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  TopViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  /// 通信、初期化処理
  Future<void> load() async {
    state = AsyncValue.data(
      TopState(
        pageIndex: 0,
        page: TaskLimitPage(),
      ),
    );
  }

  void onChangedPage(int index) {
    state = AsyncValue.data(state.value!.copyWith(pageIndex: index));
    if (index == 0) {
      state = AsyncValue.data(state.value!.copyWith(page: TaskLimitPage()));
    } else {
      state = AsyncValue.data(state.value!.copyWith(page: ViewTaskPage()));
    }
  }
}
