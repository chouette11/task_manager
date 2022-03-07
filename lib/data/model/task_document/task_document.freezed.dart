// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskDocument _$TaskDocumentFromJson(Map<String, dynamic> json) {
  return _TaskDocument.fromJson(json);
}

/// @nodoc
class _$TaskDocumentTearOff {
  const _$TaskDocumentTearOff();

  _TaskDocument call({required List<Map<String, dynamic>> taskData}) {
    return _TaskDocument(
      taskData: taskData,
    );
  }

  TaskDocument fromJson(Map<String, Object?> json) {
    return TaskDocument.fromJson(json);
  }
}

/// @nodoc
const $TaskDocument = _$TaskDocumentTearOff();

/// @nodoc
mixin _$TaskDocument {
  List<Map<String, dynamic>> get taskData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDocumentCopyWith<TaskDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDocumentCopyWith<$Res> {
  factory $TaskDocumentCopyWith(
          TaskDocument value, $Res Function(TaskDocument) then) =
      _$TaskDocumentCopyWithImpl<$Res>;
  $Res call({List<Map<String, dynamic>> taskData});
}

/// @nodoc
class _$TaskDocumentCopyWithImpl<$Res> implements $TaskDocumentCopyWith<$Res> {
  _$TaskDocumentCopyWithImpl(this._value, this._then);

  final TaskDocument _value;
  // ignore: unused_field
  final $Res Function(TaskDocument) _then;

  @override
  $Res call({
    Object? taskData = freezed,
  }) {
    return _then(_value.copyWith(
      taskData: taskData == freezed
          ? _value.taskData
          : taskData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$TaskDocumentCopyWith<$Res>
    implements $TaskDocumentCopyWith<$Res> {
  factory _$TaskDocumentCopyWith(
          _TaskDocument value, $Res Function(_TaskDocument) then) =
      __$TaskDocumentCopyWithImpl<$Res>;
  @override
  $Res call({List<Map<String, dynamic>> taskData});
}

/// @nodoc
class __$TaskDocumentCopyWithImpl<$Res> extends _$TaskDocumentCopyWithImpl<$Res>
    implements _$TaskDocumentCopyWith<$Res> {
  __$TaskDocumentCopyWithImpl(
      _TaskDocument _value, $Res Function(_TaskDocument) _then)
      : super(_value, (v) => _then(v as _TaskDocument));

  @override
  _TaskDocument get _value => super._value as _TaskDocument;

  @override
  $Res call({
    Object? taskData = freezed,
  }) {
    return _then(_TaskDocument(
      taskData: taskData == freezed
          ? _value.taskData
          : taskData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskDocument implements _TaskDocument {
  _$_TaskDocument({required this.taskData});

  factory _$_TaskDocument.fromJson(Map<String, dynamic> json) =>
      _$$_TaskDocumentFromJson(json);

  @override
  final List<Map<String, dynamic>> taskData;

  @override
  String toString() {
    return 'TaskDocument(taskData: $taskData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskDocument &&
            const DeepCollectionEquality().equals(other.taskData, taskData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(taskData));

  @JsonKey(ignore: true)
  @override
  _$TaskDocumentCopyWith<_TaskDocument> get copyWith =>
      __$TaskDocumentCopyWithImpl<_TaskDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskDocumentToJson(this);
  }
}

abstract class _TaskDocument implements TaskDocument {
  factory _TaskDocument({required List<Map<String, dynamic>> taskData}) =
      _$_TaskDocument;

  factory _TaskDocument.fromJson(Map<String, dynamic> json) =
      _$_TaskDocument.fromJson;

  @override
  List<Map<String, dynamic>> get taskData;
  @override
  @JsonKey(ignore: true)
  _$TaskDocumentCopyWith<_TaskDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
