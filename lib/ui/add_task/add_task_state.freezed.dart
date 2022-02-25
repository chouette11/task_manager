// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddTaskStateTearOff {
  const _$AddTaskStateTearOff();

  _AddTaskState call({String task = ""}) {
    return _AddTaskState(
      task: task,
    );
  }
}

/// @nodoc
const $AddTaskState = _$AddTaskStateTearOff();

/// @nodoc
mixin _$AddTaskState {
  String get task => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTaskStateCopyWith<AddTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTaskStateCopyWith<$Res> {
  factory $AddTaskStateCopyWith(
          AddTaskState value, $Res Function(AddTaskState) then) =
      _$AddTaskStateCopyWithImpl<$Res>;
  $Res call({String task});
}

/// @nodoc
class _$AddTaskStateCopyWithImpl<$Res> implements $AddTaskStateCopyWith<$Res> {
  _$AddTaskStateCopyWithImpl(this._value, this._then);

  final AddTaskState _value;
  // ignore: unused_field
  final $Res Function(AddTaskState) _then;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_value.copyWith(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AddTaskStateCopyWith<$Res>
    implements $AddTaskStateCopyWith<$Res> {
  factory _$AddTaskStateCopyWith(
          _AddTaskState value, $Res Function(_AddTaskState) then) =
      __$AddTaskStateCopyWithImpl<$Res>;
  @override
  $Res call({String task});
}

/// @nodoc
class __$AddTaskStateCopyWithImpl<$Res> extends _$AddTaskStateCopyWithImpl<$Res>
    implements _$AddTaskStateCopyWith<$Res> {
  __$AddTaskStateCopyWithImpl(
      _AddTaskState _value, $Res Function(_AddTaskState) _then)
      : super(_value, (v) => _then(v as _AddTaskState));

  @override
  _AddTaskState get _value => super._value as _AddTaskState;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_AddTaskState(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddTaskState implements _AddTaskState {
  const _$_AddTaskState({this.task = ""});

  @JsonKey()
  @override
  final String task;

  @override
  String toString() {
    return 'AddTaskState(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddTaskState &&
            const DeepCollectionEquality().equals(other.task, task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(task));

  @JsonKey(ignore: true)
  @override
  _$AddTaskStateCopyWith<_AddTaskState> get copyWith =>
      __$AddTaskStateCopyWithImpl<_AddTaskState>(this, _$identity);
}

abstract class _AddTaskState implements AddTaskState {
  const factory _AddTaskState({String task}) = _$_AddTaskState;

  @override
  String get task;
  @override
  @JsonKey(ignore: true)
  _$AddTaskStateCopyWith<_AddTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
