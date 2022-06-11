// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScheduleStateTearOff {
  const _$ScheduleStateTearOff();

  _ScheduleState call({String appName = ""}) {
    return _ScheduleState(
      appName: appName,
    );
  }
}

/// @nodoc
const $ScheduleState = _$ScheduleStateTearOff();

/// @nodoc
mixin _$ScheduleState {
  String get appName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleStateCopyWith<ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res>;
  $Res call({String appName});
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  final ScheduleState _value;
  // ignore: unused_field
  final $Res Function(ScheduleState) _then;

  @override
  $Res call({
    Object? appName = freezed,
  }) {
    return _then(_value.copyWith(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleStateCopyWith<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  factory _$ScheduleStateCopyWith(
          _ScheduleState value, $Res Function(_ScheduleState) then) =
      __$ScheduleStateCopyWithImpl<$Res>;
  @override
  $Res call({String appName});
}

/// @nodoc
class __$ScheduleStateCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res>
    implements _$ScheduleStateCopyWith<$Res> {
  __$ScheduleStateCopyWithImpl(
      _ScheduleState _value, $Res Function(_ScheduleState) _then)
      : super(_value, (v) => _then(v as _ScheduleState));

  @override
  _ScheduleState get _value => super._value as _ScheduleState;

  @override
  $Res call({
    Object? appName = freezed,
  }) {
    return _then(_ScheduleState(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ScheduleState implements _ScheduleState {
  const _$_ScheduleState({this.appName = ""});

  @JsonKey()
  @override
  final String appName;

  @override
  String toString() {
    return 'ScheduleState(appName: $appName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleState &&
            const DeepCollectionEquality().equals(other.appName, appName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(appName));

  @JsonKey(ignore: true)
  @override
  _$ScheduleStateCopyWith<_ScheduleState> get copyWith =>
      __$ScheduleStateCopyWithImpl<_ScheduleState>(this, _$identity);
}

abstract class _ScheduleState implements ScheduleState {
  const factory _ScheduleState({String appName}) = _$_ScheduleState;

  @override
  String get appName;
  @override
  @JsonKey(ignore: true)
  _$ScheduleStateCopyWith<_ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}
