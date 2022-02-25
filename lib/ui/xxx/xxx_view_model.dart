
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/xxx/xxx_state.dart';

final xxxViewModelProvider =
    StateNotifierProvider.autoDispose<XXXViewModel, AsyncValue<XXXState>>(
  (ref) => XXXViewModel(ref: ref),
);

class XXXViewModel extends StateNotifier<AsyncValue<XXXState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  XXXViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  /// 通信、初期化処理
  Future<void> load() async {

  }
}
