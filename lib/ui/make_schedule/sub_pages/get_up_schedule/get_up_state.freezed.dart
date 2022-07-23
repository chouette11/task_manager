// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GetUpStateTearOff {
  const _$GetUpStateTearOff();

  _GetUpState call({DateTime? getUpTime = null}) {
    return _GetUpState(
      getUpTime: getUpTime,
    );
  }
}

/// @nodoc
const $GetUpState = _$GetUpStateTearOff();

/// @nodoc
mixin _$GetUpState {
  DateTime? get getUpTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetUpStateCopyWith<GetUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUpStateCopyWith<$Res> {
  factory $GetUpStateCopyWith(
          GetUpState value, $Res Function(GetUpState) then) =
      _$GetUpStateCopyWithImpl<$Res>;
  $Res call({DateTime? getUpTime});
}

/// @nodoc
class _$GetUpStateCopyWithImpl<$Res> implements $GetUpStateCopyWith<$Res> {
  _$GetUpStateCopyWithImpl(this._value, this._then);

  final GetUpState _value;
  // ignore: unused_field
  final $Res Function(GetUpState) _then;

  @override
  $Res call({
    Object? getUpTime = freezed,
  }) {
    return _then(_value.copyWith(
      getUpTime: getUpTime == freezed
          ? _value.getUpTime
          : getUpTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$GetUpStateCopyWith<$Res> implements $GetUpStateCopyWith<$Res> {
  factory _$GetUpStateCopyWith(
          _GetUpState value, $Res Function(_GetUpState) then) =
      __$GetUpStateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime? getUpTime});
}

/// @nodoc
class __$GetUpStateCopyWithImpl<$Res> extends _$GetUpStateCopyWithImpl<$Res>
    implements _$GetUpStateCopyWith<$Res> {
  __$GetUpStateCopyWithImpl(
      _GetUpState _value, $Res Function(_GetUpState) _then)
      : super(_value, (v) => _then(v as _GetUpState));

  @override
  _GetUpState get _value => super._value as _GetUpState;

  @override
  $Res call({
    Object? getUpTime = freezed,
  }) {
    return _then(_GetUpState(
      getUpTime: getUpTime == freezed
          ? _value.getUpTime
          : getUpTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_GetUpState implements _GetUpState {
  const _$_GetUpState({this.getUpTime = null});

  @JsonKey()
  @override
  final DateTime? getUpTime;

  @override
  String toString() {
    return 'GetUpState(getUpTime: $getUpTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetUpState &&
            const DeepCollectionEquality().equals(other.getUpTime, getUpTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(getUpTime));

  @JsonKey(ignore: true)
  @override
  _$GetUpStateCopyWith<_GetUpState> get copyWith =>
      __$GetUpStateCopyWithImpl<_GetUpState>(this, _$identity);
}

abstract class _GetUpState implements GetUpState {
  const factory _GetUpState({DateTime? getUpTime}) = _$_GetUpState;

  @override
  DateTime? get getUpTime;
  @override
  @JsonKey(ignore: true)
  _$GetUpStateCopyWith<_GetUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
