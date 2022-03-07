import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_state.freezed.dart';

@freezed
class TopState with _$TopState {
  const factory TopState({
    @Default("") String appName,
    @Default("") String packageName,
    @Default("") String version,
    @Default("") String buildNumber,
  }) = _TopState;
}
