import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_up_state.freezed.dart';

@freezed
class GetUpState with _$GetUpState {
  const factory GetUpState({
    @Default(null) DateTime? getUpTime,
  }) = _GetUpState;
}
