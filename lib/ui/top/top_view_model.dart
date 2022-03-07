import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  }
}
