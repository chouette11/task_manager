import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/ui/make_schedule/sub_pages/get_up_schedule/get_up_state.dart';

final getUpViewModelProvider =
    StateNotifierProvider.autoDispose<GetUpViewModel, AsyncValue<GetUpState>>(
  (ref) => GetUpViewModel(ref: ref),
);

class GetUpViewModel extends StateNotifier<AsyncValue<GetUpState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  GetUpViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  /// 通信、初期化処理
  Future<void> load() async {
    state = AsyncValue.data(
      GetUpState(
        getUpTime: null,
      ),
    );
  }

  Future<void> timePicker(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 15),
    );
    state = AsyncValue.data(state.value!.copyWith(getUpTime: newTime));
  }
}
