import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/make_schedule/make_schedule_state.dart';
import 'package:task_manager/ui/xxx/xxx_state.dart';

final makeScheduleViewModelProvider =
    StateNotifierProvider.autoDispose<MakeScheduleViewModel, AsyncValue<MakeScheduleState>>(
  (ref) => MakeScheduleViewModel(ref: ref),
);

class MakeScheduleViewModel extends StateNotifier<AsyncValue<MakeScheduleState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  MakeScheduleViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  /// 通信、初期化処理
  Future<void> load() async {
    state = AsyncValue.data(
      MakeScheduleState(
        taskData: []
      )
    );
  }
}
