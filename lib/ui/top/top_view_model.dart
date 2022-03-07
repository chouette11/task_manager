import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/top/sub_page/task_limit_page.dart';
import 'package:task_manager/ui/top/sub_page/task_view_page.dart';
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
        page: TaskLimitPage(1),
      ),
    );
  }

  void onChangedPage(int index) {
    state = AsyncValue.data(state.value!.copyWith(pageIndex: index));
    if (index < 3) {
      state = AsyncValue.data(state.value!.copyWith(page: TaskLimitPage((index + 1) * index + 1)));
    } else {
      state = AsyncValue.data(state.value!.copyWith(page: TaskViewPage()));
    }

  }
}
