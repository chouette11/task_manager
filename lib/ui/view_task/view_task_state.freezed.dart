// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'view_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ViewTaskStateTearOff {
  const _$ViewTaskStateTearOff();

  _ViewTaskState call(
      {List<Widget> before = const [],
      List<Widget> after = const [],
      List<Widget> no = const []}) {
    return _ViewTaskState(
      before: before,
      after: after,
      no: no,
    );
  }
}

/// @nodoc
const $ViewTaskState = _$ViewTaskStateTearOff();

/// @nodoc
mixin _$ViewTaskState {
  List<Widget> get before => throw _privateConstructorUsedError;
  List<Widget> get after => throw _privateConstructorUsedError;
  List<Widget> get no => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewTaskStateCopyWith<ViewTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewTaskStateCopyWith<$Res> {
  factory $ViewTaskStateCopyWith(
          ViewTaskState value, $Res Function(ViewTaskState) then) =
      _$ViewTaskStateCopyWithImpl<$Res>;
  $Res call({List<Widget> before, List<Widget> after, List<Widget> no});
}

/// @nodoc
class _$ViewTaskStateCopyWithImpl<$Res>
    implements $ViewTaskStateCopyWith<$Res> {
  _$ViewTaskStateCopyWithImpl(this._value, this._then);

  final ViewTaskState _value;
  // ignore: unused_field
  final $Res Function(ViewTaskState) _then;

  @override
  $Res call({
    Object? before = freezed,
    Object? after = freezed,
    Object? no = freezed,
  }) {
    return _then(_value.copyWith(
      before: before == freezed
          ? _value.before
          : before // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      after: after == freezed
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      no: no == freezed
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc
abstract class _$ViewTaskStateCopyWith<$Res>
    implements $ViewTaskStateCopyWith<$Res> {
  factory _$ViewTaskStateCopyWith(
          _ViewTaskState value, $Res Function(_ViewTaskState) then) =
      __$ViewTaskStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Widget> before, List<Widget> after, List<Widget> no});
}

/// @nodoc
class __$ViewTaskStateCopyWithImpl<$Res>
    extends _$ViewTaskStateCopyWithImpl<$Res>
    implements _$ViewTaskStateCopyWith<$Res> {
  __$ViewTaskStateCopyWithImpl(
      _ViewTaskState _value, $Res Function(_ViewTaskState) _then)
      : super(_value, (v) => _then(v as _ViewTaskState));

  @override
  _ViewTaskState get _value => super._value as _ViewTaskState;

  @override
  $Res call({
    Object? before = freezed,
    Object? after = freezed,
    Object? no = freezed,
  }) {
    return _then(_ViewTaskState(
      before: before == freezed
          ? _value.before
          : before // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      after: after == freezed
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
      no: no == freezed
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc

class _$_ViewTaskState implements _ViewTaskState {
  const _$_ViewTaskState(
      {this.before = const [], this.after = const [], this.no = const []});

  @JsonKey()
  @override
  final List<Widget> before;
  @JsonKey()
  @override
  final List<Widget> after;
  @JsonKey()
  @override
  final List<Widget> no;

  @override
  String toString() {
    return 'ViewTaskState(before: $before, after: $after, no: $no)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewTaskState &&
            const DeepCollectionEquality().equals(other.before, before) &&
            const DeepCollectionEquality().equals(other.after, after) &&
            const DeepCollectionEquality().equals(other.no, no));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(before),
      const DeepCollectionEquality().hash(after),
      const DeepCollectionEquality().hash(no));

  @JsonKey(ignore: true)
  @override
  _$ViewTaskStateCopyWith<_ViewTaskState> get copyWith =>
      __$ViewTaskStateCopyWithImpl<_ViewTaskState>(this, _$identity);
}

abstract class _ViewTaskState implements ViewTaskState {
  const factory _ViewTaskState(
      {List<Widget> before,
      List<Widget> after,
      List<Widget> no}) = _$_ViewTaskState;

  @override
  List<Widget> get before;
  @override
  List<Widget> get after;
  @override
  List<Widget> get no;
  @override
  @JsonKey(ignore: true)
  _$ViewTaskStateCopyWith<_ViewTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
