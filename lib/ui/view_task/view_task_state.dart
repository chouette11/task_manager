import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_task_state.freezed.dart';

@freezed
class ViewTaskState with _$ViewTaskState {
  const factory ViewTaskState({
    @Default(0) int tabIndex,
  }) = _ViewTaskState;
}
