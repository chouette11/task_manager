// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'top_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TopStateTearOff {
  const _$TopStateTearOff();

  _TopState call(
      {String appName = "",
      String packageName = "",
      String version = "",
      String buildNumber = ""}) {
    return _TopState(
      appName: appName,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
    );
  }
}

/// @nodoc
const $TopState = _$TopStateTearOff();

/// @nodoc
mixin _$TopState {
  String get appName => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopStateCopyWith<TopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopStateCopyWith<$Res> {
  factory $TopStateCopyWith(TopState value, $Res Function(TopState) then) =
      _$TopStateCopyWithImpl<$Res>;
  $Res call(
      {String appName, String packageName, String version, String buildNumber});
}

/// @nodoc
class _$TopStateCopyWithImpl<$Res> implements $TopStateCopyWith<$Res> {
  _$TopStateCopyWithImpl(this._value, this._then);

  final TopState _value;
  // ignore: unused_field
  final $Res Function(TopState) _then;

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
abstract class _$TopStateCopyWith<$Res> implements $TopStateCopyWith<$Res> {
  factory _$TopStateCopyWith(_TopState value, $Res Function(_TopState) then) =
      __$TopStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String appName, String packageName, String version, String buildNumber});
}

/// @nodoc
class __$TopStateCopyWithImpl<$Res> extends _$TopStateCopyWithImpl<$Res>
    implements _$TopStateCopyWith<$Res> {
  __$TopStateCopyWithImpl(_TopState _value, $Res Function(_TopState) _then)
      : super(_value, (v) => _then(v as _TopState));

  @override
  _TopState get _value => super._value as _TopState;

  @override
  $Res call({
    Object? appName = freezed,
    Object? packageName = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
  }) {
    return _then(_TopState(
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

class _$_TopState implements _TopState {
  const _$_TopState(
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
    return 'TopState(appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopState &&
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
  _$TopStateCopyWith<_TopState> get copyWith =>
      __$TopStateCopyWithImpl<_TopState>(this, _$identity);
}

abstract class _TopState implements TopState {
  const factory _TopState(
      {String appName,
      String packageName,
      String version,
      String buildNumber}) = _$_TopState;

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
  _$TopStateCopyWith<_TopState> get copyWith =>
      throw _privateConstructorUsedError;
}
