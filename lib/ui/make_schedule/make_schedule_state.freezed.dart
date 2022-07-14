// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'make_schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MakeScheduleStateTearOff {
  const _$MakeScheduleStateTearOff();

  _MakeScheduleState call({List<Task> taskData = const []}) {
    return _MakeScheduleState(
      taskData: taskData,
    );
  }
}

/// @nodoc
const $MakeScheduleState = _$MakeScheduleStateTearOff();

/// @nodoc
mixin _$MakeScheduleState {
  List<Task> get taskData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MakeScheduleStateCopyWith<MakeScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakeScheduleStateCopyWith<$Res> {
  factory $MakeScheduleStateCopyWith(
          MakeScheduleState value, $Res Function(MakeScheduleState) then) =
      _$MakeScheduleStateCopyWithImpl<$Res>;
  $Res call({List<Task> taskData});
}

/// @nodoc
class _$MakeScheduleStateCopyWithImpl<$Res>
    implements $MakeScheduleStateCopyWith<$Res> {
  _$MakeScheduleStateCopyWithImpl(this._value, this._then);

  final MakeScheduleState _value;
  // ignore: unused_field
  final $Res Function(MakeScheduleState) _then;

  @override
  $Res call({
    Object? taskData = freezed,
  }) {
    return _then(_value.copyWith(
      taskData: taskData == freezed
          ? _value.taskData
          : taskData // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
abstract class _$MakeScheduleStateCopyWith<$Res>
    implements $MakeScheduleStateCopyWith<$Res> {
  factory _$MakeScheduleStateCopyWith(
          _MakeScheduleState value, $Res Function(_MakeScheduleState) then) =
      __$MakeScheduleStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Task> taskData});
}

/// @nodoc
class __$MakeScheduleStateCopyWithImpl<$Res>
    extends _$MakeScheduleStateCopyWithImpl<$Res>
    implements _$MakeScheduleStateCopyWith<$Res> {
  __$MakeScheduleStateCopyWithImpl(
      _MakeScheduleState _value, $Res Function(_MakeScheduleState) _then)
      : super(_value, (v) => _then(v as _MakeScheduleState));

  @override
  _MakeScheduleState get _value => super._value as _MakeScheduleState;

  @override
  $Res call({
    Object? taskData = freezed,
  }) {
    return _then(_MakeScheduleState(
      taskData: taskData == freezed
          ? _value.taskData
          : taskData // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_MakeScheduleState implements _MakeScheduleState {
  const _$_MakeScheduleState({this.taskData = const []});

  @JsonKey()
  @override
  final List<Task> taskData;

  @override
  String toString() {
    return 'MakeScheduleState(taskData: $taskData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MakeScheduleState &&
            const DeepCollectionEquality().equals(other.taskData, taskData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(taskData));

  @JsonKey(ignore: true)
  @override
  _$MakeScheduleStateCopyWith<_MakeScheduleState> get copyWith =>
      __$MakeScheduleStateCopyWithImpl<_MakeScheduleState>(this, _$identity);
}

abstract class _MakeScheduleState implements MakeScheduleState {
  const factory _MakeScheduleState({List<Task> taskData}) =
      _$_MakeScheduleState;

  @override
  List<Task> get taskData;
  @override
  @JsonKey(ignore: true)
  _$MakeScheduleStateCopyWith<_MakeScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}
