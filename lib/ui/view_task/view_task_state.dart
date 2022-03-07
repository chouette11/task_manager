import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_task_state.freezed.dart';

@freezed
class ViewTaskState with _$ViewTaskState {
  const factory ViewTaskState({
    @Default([]) List<Widget> before,
    @Default([]) List<Widget> after,
    @Default([]) List<Widget> no,
  }) = _ViewTaskState;
}
