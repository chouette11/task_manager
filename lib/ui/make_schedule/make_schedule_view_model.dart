import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/data/repository/firestore/firestore_tasks_stream.dart';
import 'package:task_manager/ui/make_schedule/make_schedule_state.dart';

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
  late final taskData = _ref.watch(tasksStreamProvider);

  /// 通信、初期化処理
  Future<void> load() async {
    state = AsyncValue.data(
      MakeScheduleState(
        taskData: taskData.value!,
        pieData: {'寝る': 8, 'その他': 16},
        pieColors: [Colors.black12, Colors.grey]
      )
    );
  }

  void onChangeSliderValue(double value) {
    state = AsyncValue.data(state.value!.copyWith(currentSliderValue: value));
  }

  void onAddTaskToPieData(String task) {
    double measureSum = 0;
    // pieDataの複製
    var tmpPieData = Map.of(state.value!.pieData);
    // その他の削除
    tmpPieData.remove('その他');
    // Mapのtaskのかぶり排除
    tmpPieData.forEach((key, value) {
      if (key == task) {
        task += ' ';
      }
    });
    // Mapの宣言
    final taskMap = {
      task: state.value!.currentSliderValue,
    };
    // 新規タスクの追加
    tmpPieData.addAll(taskMap);
    // 現在のタスクの合計
    tmpPieData.forEach((key, value) {
      measureSum += value;
    });
    // その他の追加
    tmpPieData.addAll({"その他": 24 - measureSum});
    state = AsyncValue.data(state.value!.copyWith(pieData: tmpPieData));
  }
}
