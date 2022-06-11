import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/schedule/schedule_state.dart';
import 'package:task_manager/ui/xxx/xxx_state.dart';

final scheduleViewModelProvider =
    StateNotifierProvider.autoDispose<ScheduleViewModel, AsyncValue<ScheduleState>>(
  (ref) => ScheduleViewModel(ref: ref),
);

class ScheduleViewModel extends StateNotifier<AsyncValue<ScheduleState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  ScheduleViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  /// 通信、初期化処理
  Future<void> load() async {

  }
}
