import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/types/task.dart';

part 'make_schedule_state.freezed.dart';

@freezed
class MakeScheduleState with _$MakeScheduleState {
  const factory MakeScheduleState({
    @Default([]) List<Task> taskData,
    @Default(0.5) double currentSliderValue,
    @Default({}) Map<String, double> pieData,
    @Default({}) Map<String, Color> pieLegends,
    @Default([]) List<Color> pieColors,
  }) = _MakeScheduleState;
}
