import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/types/task.dart';

part 'make_schedule_state.freezed.dart';

@freezed
class MakeScheduleState with _$MakeScheduleState {
  const factory MakeScheduleState({
    @Default([]) List<Task> taskData,
  }) = _MakeScheduleState;
}
