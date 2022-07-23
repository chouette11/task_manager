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
        pieData: {'その他': 24},
        pieColors: [Colors.grey],
        pieLegends: {'その他': Colors.grey},
      )
    );
  }

  void onChangeSliderValue(double value) {
    state = AsyncValue.data(state.value!.copyWith(currentSliderValue: value));
  }

  void onAddPieColor(String oriTaskName) {
    var tmpPieColors = List.of(state.value!.pieColors);
    tmpPieColors.insert(tmpPieColors.length - 1, state.value!.pieLegends[oriTaskName]!);
    state = AsyncValue.data(state.value!.copyWith(pieColors: tmpPieColors));
  }

  double timeToAngle(DateTime time) {
    double angle = 0;
    angle += time.hour * 15;
    angle += time.minute * 0.25;
    return angle;
  }

  void onAddPieLegends(String oriTaskName) {
    final colors = [
      Color.fromARGB(255, 255, 128, 128),
      Color.fromARGB(255, 204, 128, 255),
      Color.fromARGB(255, 128, 255, 211),
      Color.fromARGB(255, 170, 255, 128),
      Color.fromARGB(255, 128, 139, 255),
      Color.fromARGB(255, 255, 244, 128),
    ];

    var tmpPieLegends = state.value!.pieLegends;
    tmpPieLegends.containsKey(oriTaskName) ?
    null : tmpPieLegends.addAll({oriTaskName: colors[tmpPieLegends.length % 6]});
    state = AsyncValue.data(state.value!.copyWith(pieLegends: tmpPieLegends));
  }

  void onAddTaskToPieData(String taskName, {double? hours}) {
    final oriTaskName = taskName;
    double measureSum = 0;
    // pieDataの複製
    var tmpPieData = Map.of(state.value!.pieData);
    // その他の削除
    tmpPieData.remove('その他');
    // taskのMapかぶり排除
    tmpPieData.forEach((key, value) {
      if (key == taskName) {
        taskName += ' ';
      }
    });
    // Mapの宣言
    final taskMap = {
      // hoursがnullのときsliderValueがvalueとなる
      taskName: hours ?? state.value!.currentSliderValue,
    };
    // 新規タスクの追加
    tmpPieData.addAll(taskMap);
    // 現在のタスクの時間の合計
    tmpPieData.forEach((key, value) {
      measureSum += value;
    });
    // その他の追加
    tmpPieData.addAll({"その他": 24 - measureSum});

    // レジェンドの追加
    onAddPieLegends(oriTaskName);
    // 色の追加
    onAddPieColor(oriTaskName);
    state = AsyncValue.data(state.value!.copyWith(pieData: tmpPieData));
  }
}
