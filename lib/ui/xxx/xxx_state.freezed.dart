// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'xxx_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$XXXStateTearOff {
  const _$XXXStateTearOff();

  _XXXState call(
      {String appName = "",
      String packageName = "",
      String version = "",
      String buildNumber = ""}) {
    return _XXXState(
      appName: appName,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
    );
  }
}

/// @nodoc
const $XXXState = _$XXXStateTearOff();

/// @nodoc
mixin _$XXXState {
  String get appName => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $XXXStateCopyWith<XXXState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XXXStateCopyWith<$Res> {
  factory $XXXStateCopyWith(XXXState value, $Res Function(XXXState) then) =
      _$XXXStateCopyWithImpl<$Res>;
  $Res call(
      {String appName, String packageName, String version, String buildNumber});
}

/// @nodoc
class _$XXXStateCopyWithImpl<$Res> implements $XXXStateCopyWith<$Res> {
  _$XXXStateCopyWithImpl(this._value, this._then);

  final XXXState _value;
  // ignore: unused_field
  final $Res Function(XXXState) _then;

  @override
  $Res call({
    Object? appName = freezed,
    Object? packageName = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
  }) {
    return _then(_value.copyWith(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: packageName == freezed
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$XXXStateCopyWith<$Res> implements $XXXStateCopyWith<$Res> {
  factory _$XXXStateCopyWith(_XXXState value, $Res Function(_XXXState) then) =
      __$XXXStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String appName, String packageName, String version, String buildNumber});
}

/// @nodoc
class __$XXXStateCopyWithImpl<$Res> extends _$XXXStateCopyWithImpl<$Res>
    implements _$XXXStateCopyWith<$Res> {
  __$XXXStateCopyWithImpl(_XXXState _value, $Res Function(_XXXState) _then)
      : super(_value, (v) => _then(v as _XXXState));

  @override
  _XXXState get _value => super._value as _XXXState;

  @override
  $Res call({
    Object? appName = freezed,
    Object? packageName = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
  }) {
    return _then(_XXXState(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: packageName == freezed
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_XXXState implements _XXXState {
  const _$_XXXState(
      {this.appName = "",
      this.packageName = "",
      this.version = "",
      this.buildNumber = ""});

  @JsonKey()
  @override
  final String appName;
  @JsonKey()
  @override
  final String packageName;
  @JsonKey()
  @override
  final String version;
  @JsonKey()
  @override
  final String buildNumber;

  @override
  String toString() {
    return 'XXXState(appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _XXXState &&
            const DeepCollectionEquality().equals(other.appName, appName) &&
            const DeepCollectionEquality()
                .equals(other.packageName, packageName) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.buildNumber, buildNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(appName),
      const DeepCollectionEquality().hash(packageName),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(buildNumber));

  @JsonKey(ignore: true)
  @override
  _$XXXStateCopyWith<_XXXState> get copyWith =>
      __$XXXStateCopyWithImpl<_XXXState>(this, _$identity);
}

abstract class _XXXState implements XXXState {
  const factory _XXXState(
      {String appName,
      String packageName,
      String version,
      String buildNumber}) = _$_XXXState;

  @override
  String get appName;
  @override
  String get packageName;
  @override
  String get version;
  @override
  String get buildNumber;
  @override
  @JsonKey(ignore: true)
  _$XXXStateCopyWith<_XXXState> get copyWith =>
      throw _privateConstructorUsedError;
}
