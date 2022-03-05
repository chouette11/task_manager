import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_task_state.freezed.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState({
    @Default("") String task,
    @Default(0) int year,
    @Default(0) int month,
    @Default(0) int day,
    @Default(0) int hour,
    @Default(0) int minute,
  }) = _AddTaskState;
}
