import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/setting/setting_state.dart';

final settingViewModelProvider =
    StateNotifierProvider.autoDispose<SettingViewModel, AsyncValue<SettingState>>(
  (ref) => SettingViewModel(ref: ref),
);

class SettingViewModel extends StateNotifier<AsyncValue<SettingState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  SettingViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  /// 通信、初期化処理
  Future<void> load() async {

  }
}
