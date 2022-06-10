import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/ui/top/sub_pages/limit_task/task_limit_page.dart';

part 'top_state.freezed.dart';

@freezed
class TopState with _$TopState {
  const factory TopState({
    @Default(0) int pageIndex,
    @Default(TaskLimitPage()) Widget page,
  }) = _TopState;
}
