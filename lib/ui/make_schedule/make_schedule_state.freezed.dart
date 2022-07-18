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

  _MakeScheduleState call(
      {List<Task> taskData = const [],
      double currentSliderValue = 0.5,
      Map<String, double> pieData = const {},
      List<Color> pieColors = const []}) {
    return _MakeScheduleState(
      taskData: taskData,
      currentSliderValue: currentSliderValue,
      pieData: pieData,
      pieColors: pieColors,
    );
  }
}

/// @nodoc
const $MakeScheduleState = _$MakeScheduleStateTearOff();

/// @nodoc
mixin _$MakeScheduleState {
  List<Task> get taskData => throw _privateConstructorUsedError;
  double get currentSliderValue => throw _privateConstructorUsedError;
  Map<String, double> get pieData => throw _privateConstructorUsedError;
  List<Color> get pieColors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MakeScheduleStateCopyWith<MakeScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakeScheduleStateCopyWith<$Res> {
  factory $MakeScheduleStateCopyWith(
          MakeScheduleState value, $Res Function(MakeScheduleState) then) =
      _$MakeScheduleStateCopyWithImpl<$Res>;
  $Res call(
      {List<Task> taskData,
      double currentSliderValue,
      Map<String, double> pieData,
      List<Color> pieColors});
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
    Object? currentSliderValue = freezed,
    Object? pieData = freezed,
    Object? pieColors = freezed,
  }) {
    return _then(_value.copyWith(
      taskData: taskData == freezed
          ? _value.taskData
          : taskData // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      currentSliderValue: currentSliderValue == freezed
          ? _value.currentSliderValue
          : currentSliderValue // ignore: cast_nullable_to_non_nullable
              as double,
      pieData: pieData == freezed
          ? _value.pieData
          : pieData // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      pieColors: pieColors == freezed
          ? _value.pieColors
          : pieColors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
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
  $Res call(
      {List<Task> taskData,
      double currentSliderValue,
      Map<String, double> pieData,
      List<Color> pieColors});
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
    Object? currentSliderValue = freezed,
    Object? pieData = freezed,
    Object? pieColors = freezed,
  }) {
    return _then(_MakeScheduleState(
      taskData: taskData == freezed
          ? _value.taskData
          : taskData // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      currentSliderValue: currentSliderValue == freezed
          ? _value.currentSliderValue
          : currentSliderValue // ignore: cast_nullable_to_non_nullable
              as double,
      pieData: pieData == freezed
          ? _value.pieData
          : pieData // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      pieColors: pieColors == freezed
          ? _value.pieColors
          : pieColors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
    ));
  }
}

/// @nodoc

class _$_MakeScheduleState implements _MakeScheduleState {
  const _$_MakeScheduleState(
      {this.taskData = const [],
      this.currentSliderValue = 0.5,
      this.pieData = const {},
      this.pieColors = const []});

  @JsonKey()
  @override
  final List<Task> taskData;
  @JsonKey()
  @override
  final double currentSliderValue;
  @JsonKey()
  @override
  final Map<String, double> pieData;
  @JsonKey()
  @override
  final List<Color> pieColors;

  @override
  String toString() {
    return 'MakeScheduleState(taskData: $taskData, currentSliderValue: $currentSliderValue, pieData: $pieData, pieColors: $pieColors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MakeScheduleState &&
            const DeepCollectionEquality().equals(other.taskData, taskData) &&
            const DeepCollectionEquality()
                .equals(other.currentSliderValue, currentSliderValue) &&
            const DeepCollectionEquality().equals(other.pieData, pieData) &&
            const DeepCollectionEquality().equals(other.pieColors, pieColors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskData),
      const DeepCollectionEquality().hash(currentSliderValue),
      const DeepCollectionEquality().hash(pieData),
      const DeepCollectionEquality().hash(pieColors));

  @JsonKey(ignore: true)
  @override
  _$MakeScheduleStateCopyWith<_MakeScheduleState> get copyWith =>
      __$MakeScheduleStateCopyWithImpl<_MakeScheduleState>(this, _$identity);
}

abstract class _MakeScheduleState implements MakeScheduleState {
  const factory _MakeScheduleState(
      {List<Task> taskData,
      double currentSliderValue,
      Map<String, double> pieData,
      List<Color> pieColors}) = _$_MakeScheduleState;

  @override
  List<Task> get taskData;
  @override
  double get currentSliderValue;
  @override
  Map<String, double> get pieData;
  @override
  List<Color> get pieColors;
  @override
  @JsonKey(ignore: true)
  _$MakeScheduleStateCopyWith<_MakeScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}
