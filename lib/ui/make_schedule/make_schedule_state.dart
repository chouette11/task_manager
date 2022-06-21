import 'package:freezed_annotation/freezed_annotation.dart';

part 'make_schedule_state.freezed.dart';

@freezed
class MakeScheduleState with _$MakeScheduleState {
  const factory MakeScheduleState({
    @Default("") String appName,
    @Default("") String packageName,
    @Default("") String version,
    @Default("") String buildNumber,
  }) = _MakeScheduleState;
}
