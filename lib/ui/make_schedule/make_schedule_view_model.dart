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
        pieData: [{"domain": "寝る", "measure": 8}, {"domain": "その他", "measure": 16},],
      )
    );
  }

  void onChangeSliderValue(double value) {
    state = AsyncValue.data(state.value!.copyWith(currentSliderValue: value));
  }

  void onAddTaskToPieData(String task) {
    final taskMap = {
      "domain": task,
      "measure": state.value!.currentSliderValue
    };
    double measureSum = 0;
    // pieDataの複製
    var tmpPieData = List.of(state.value!.pieData);
    // その他の削除
    tmpPieData.removeLast();
    // 新規タスクの追加
    tmpPieData.add(taskMap);
    // 現在のタスクの合計
    tmpPieData.forEach((e) {
      measureSum += e['measure'];
    });
    // その他の追加
    tmpPieData.add({"domain": "その他", "measure": 24 - measureSum});
    state = AsyncValue.data(state.value!.copyWith(pieData: tmpPieData));
  }
}
