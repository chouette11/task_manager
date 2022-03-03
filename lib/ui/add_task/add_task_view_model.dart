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

  /// onAddDate
  void onAddDate(int year, int month, int day, int hour, int minute) {
    state = AsyncValue.data(
      AddTaskState(
        task: state.value!.task,
        year: state.value!.year + year,
        month: state.value!.month + month,
        day: state.value!.day + day,
        hour: state.value!.hour + hour,
        minute: state.value!.minute + minute,
      ),
    );
  }

  /// 年 onChanged
  void onChangedYear(String value) {
    state = AsyncValue.data(state.value!.copyWith(year: int.parse(value)));
  }

  /// 月 onChanged
  void onChangedMonth(String value) {
    state = AsyncValue.data(state.value!.copyWith(month: int.parse(value)));
  }

  /// 日 onChanged
  void onChangedDay(String value) {
    state = AsyncValue.data(state.value!.copyWith(day: int.parse(value)));
  }

  /// 時間 onChanged
  void onChangedHour(String value) {
    state = AsyncValue.data(state.value!.copyWith(hour: int.parse(value)));
  }

  /// 分 onChanged
  void onChangedMinute(String value) {
    state = AsyncValue.data(state.value!.copyWith(minute: int.parse(value)));
  }

  /// タスク onChanged
  void onChangedTask(String value) {
    state = AsyncValue.data(state.value!.copyWith(task: value));
  }

}
