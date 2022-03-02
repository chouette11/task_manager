import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_task_state.freezed.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState({
    @Default("") String task,
    @Default("") String year,
    @Default("") String month,
    @Default("") String day,
    @Default("") String hour,
    @Default("") String minute,
  }) = _AddTaskState;
}
