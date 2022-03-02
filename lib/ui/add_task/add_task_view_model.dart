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
    state = AsyncValue.data(
      AddTaskState(
        task: "task",
      ),
    );
  }

  /// メールアドレス onChanged
  void onChangedTask(String value) {
    state = AsyncValue.data(state.value!.copyWith(task: value));
  }

}
