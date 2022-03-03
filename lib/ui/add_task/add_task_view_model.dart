import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/add_task/add_task_state.dart';

final addTaskViewModelProvider =
StateNotifierProvider.autoDispose<AddTaskViewModel, AsyncValue<AddTaskState>>(
      (ref) => AddTaskViewModel(ref: ref),
);

class AddTaskViewModel extends StateNotifier<AsyncValue<AddTaskState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  AddTaskViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  /// 通信、初期化処理
  Future<void> load() async {
    final now = DateTime.now();
    state = AsyncValue.data(
      AddTaskState(
        task: "task",
        year: now.year,
        month: now.month - 1,
        day: now.day,
        hour: now.hour,
        minute: now.minute,
      ),
    );
  }

  /// 年
  void onChangedYear(String value) {
    state = AsyncValue.data(state.value!.copyWith(year: int.parse(value)));
  }

  /// 月
  void onChangedMonth(String value) {
    state = AsyncValue.data(state.value!.copyWith(month: int.parse(value)));
  }

  /// 日
  void onChangedDay(String value) {
    state = AsyncValue.data(state.value!.copyWith(day: int.parse(value)));
  }

  /// 時間
  void onChangedHour(String value) {
    state = AsyncValue.data(state.value!.copyWith(hour: int.parse(value)));
  }

  /// 分
  void onChangedMinute(String value) {
    state = AsyncValue.data(state.value!.copyWith(minute: int.parse(value)));
  }

  /// タスク
  void onChangedTask(String value) {
    state = AsyncValue.data(state.value!.copyWith(task: value));
  }

}
