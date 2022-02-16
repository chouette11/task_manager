// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDocument _$UserDocumentFromJson(Map<String, dynamic> json) {
  return _UserDocument.fromJson(json);
}

/// @nodoc
class _$UserDocumentTearOff {
  const _$UserDocumentTearOff();

  _UserDocument call(
      {required String id, String name = "", String token = ""}) {
    return _UserDocument(
      id: id,
      name: name,
      token: token,
    );
  }

  UserDocument fromJson(Map<String, Object?> json) {
    return UserDocument.fromJson(json);
  }
}

/// @nodoc
const $UserDocument = _$UserDocumentTearOff();

/// @nodoc
mixin _$UserDocument {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDocumentCopyWith<UserDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDocumentCopyWith<$Res> {
  factory $UserDocumentCopyWith(
          UserDocument value, $Res Function(UserDocument) then) =
      _$UserDocumentCopyWithImpl<$Res>;
  $Res call({String id, String name, String token});
}

/// @nodoc
class _$UserDocumentCopyWithImpl<$Res> implements $UserDocumentCopyWith<$Res> {
  _$UserDocumentCopyWithImpl(this._value, this._then);

  final UserDocument _value;
  // ignore: unused_field
  final $Res Function(UserDocument) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserDocumentCopyWith<$Res>
    implements $UserDocumentCopyWith<$Res> {
  factory _$UserDocumentCopyWith(
          _UserDocument value, $Res Function(_UserDocument) then) =
      __$UserDocumentCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String token});
}

/// @nodoc
class __$UserDocumentCopyWithImpl<$Res> extends _$UserDocumentCopyWithImpl<$Res>
    implements _$UserDocumentCopyWith<$Res> {
  __$UserDocumentCopyWithImpl(
      _UserDocument _value, $Res Function(_UserDocument) _then)
      : super(_value, (v) => _then(v as _UserDocument));

  @override
  _UserDocument get _value => super._value as _UserDocument;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? token = freezed,
  }) {
    return _then(_UserDocument(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDocument implements _UserDocument {
  _$_UserDocument({required this.id, this.name = "", this.token = ""});

  factory _$_UserDocument.fromJson(Map<String, dynamic> json) =>
      _$$_UserDocumentFromJson(json);

  @override
  final String id;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String token;

  @override
  String toString() {
    return 'UserDocument(id: $id, name: $name, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDocument &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$UserDocumentCopyWith<_UserDocument> get copyWith =>
      __$UserDocumentCopyWithImpl<_UserDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDocumentToJson(this);
  }
}

abstract class _UserDocument implements UserDocument {
  factory _UserDocument({required String id, String name, String token}) =
      _$_UserDocument;

  factory _UserDocument.fromJson(Map<String, dynamic> json) =
      _$_UserDocument.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$UserDocumentCopyWith<_UserDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
