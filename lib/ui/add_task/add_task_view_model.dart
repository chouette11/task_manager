import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/data/repository/firestore/firestore_repository.impl.dart';
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

  late final firestoreRepository = _ref.read(firestoreRepositoryProvider);

  /// 通信、初期化処理
  Future<void> load() async {
    final now = DateTime.now();
    state = AsyncValue.data(
      AddTaskState(
        task: "task",
        year: now.year,
        month: now.month,
        day: now.day,
        hour: now.hour,
        minute: now.minute,
      ),
    );
  }

  /// 日時の追加 onAddDate
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

    if (state.value!.month > 12) {
      final month = state.value!.month - 12;
      state = AsyncValue.data(state.value!.copyWith(month: month));
    }
    if (state.value!.day > 31) {
      final day = state.value!.day - 31;
      state = AsyncValue.data(state.value!.copyWith(day: day));
    }
    if (state.value!.hour > 24) {
      final hour = state.value!.hour - 24;
      state = AsyncValue.data(state.value!.copyWith(hour: hour));
    }
    if (state.value!.minute > 60) {
      final minute = state.value!.minute - 60;
      state = AsyncValue.data(state.value!.copyWith(minute: minute));
    }

  }

  /// 年 onChanged
  void onChangedYear(String value) {
    if (int.parse(value) <= 1900) {
      value = DateTime.now().year.toString();
    }
    state = AsyncValue.data(state.value!.copyWith(year: int.parse(value)));
  }

  /// 月 onChanged
  void onChangedMonth(String value) {
    if (int.parse(value) > 12) {
      value = "12";
    }
    if (int.parse(value) <= 0) {
      value = "1";
    }
    state = AsyncValue.data(state.value!.copyWith(month: int.parse(value)));
  }

  /// 日 onChanged
  void onChangedDay(String value) {
    if (int.parse(value) > 31) {
      value = "31";
    }
    if (int.parse(value) <= 0) {
      value = "1";
    }
    state = AsyncValue.data(state.value!.copyWith(day: int.parse(value)));
  }

  /// 時間 onChanged
  void onChangedHour(String value) {
    if (int.parse(value) > 24) {
      value = "24";
    }
    if (int.parse(value) < 0) {
      value = "0";
    }
    state = AsyncValue.data(state.value!.copyWith(hour: int.parse(value)));
  }

  /// 分 onChanged
  void onChangedMinute(String value) {
    if (int.parse(value) > 60) {
      value = "60";
    }
    if (int.parse(value) < 0) {
      value = "0";
    }
    state = AsyncValue.data(state.value!.copyWith(minute: int.parse(value)));
  }

  /// タスク onChanged
  void onChangedTask(String value) {
    state = AsyncValue.data(state.value!.copyWith(task: value));
  }

  /// タスク onAdd
  Future<void> onAddTask(BuildContext context) async {
    final value = state.value!;
    final limit = DateTime(value.year, value.month, value.day, value.hour, value.minute);
    final Map<String, dynamic> taskData = {
      'id': 104,
      'limit': limit,
      'noLimit': value.isChecked,
      'task': value.task,
    };
    await firestoreRepository.addTask(task: taskData);
    context.push('/');
  }

  void onChecked(bool? value) {
    state = AsyncValue.data(state.value!.copyWith(isChecked: value!));
  }
}
