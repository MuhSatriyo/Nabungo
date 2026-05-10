// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InsightModel _$InsightModelFromJson(Map<String, dynamic> json) {
  return _InsightModel.fromJson(json);
}

/// @nodoc
mixin _$InsightModel {
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsightModelCopyWith<InsightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightModelCopyWith<$Res> {
  factory $InsightModelCopyWith(
          InsightModel value, $Res Function(InsightModel) then) =
      _$InsightModelCopyWithImpl<$Res, InsightModel>;
  @useResult
  $Res call({String type, String title, String message});
}

/// @nodoc
class _$InsightModelCopyWithImpl<$Res, $Val extends InsightModel>
    implements $InsightModelCopyWith<$Res> {
  _$InsightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsightModelImplCopyWith<$Res>
    implements $InsightModelCopyWith<$Res> {
  factory _$$InsightModelImplCopyWith(
          _$InsightModelImpl value, $Res Function(_$InsightModelImpl) then) =
      __$$InsightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String title, String message});
}

/// @nodoc
class __$$InsightModelImplCopyWithImpl<$Res>
    extends _$InsightModelCopyWithImpl<$Res, _$InsightModelImpl>
    implements _$$InsightModelImplCopyWith<$Res> {
  __$$InsightModelImplCopyWithImpl(
      _$InsightModelImpl _value, $Res Function(_$InsightModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$InsightModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightModelImpl implements _InsightModel {
  const _$InsightModelImpl(
      {required this.type, required this.title, required this.message});

  factory _$InsightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsightModelImplFromJson(json);

  @override
  final String type;
  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'InsightModel(type: $type, title: $title, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightModelImplCopyWith<_$InsightModelImpl> get copyWith =>
      __$$InsightModelImplCopyWithImpl<_$InsightModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightModelImplToJson(
      this,
    );
  }
}

abstract class _InsightModel implements InsightModel {
  const factory _InsightModel(
      {required final String type,
      required final String title,
      required final String message}) = _$InsightModelImpl;

  factory _InsightModel.fromJson(Map<String, dynamic> json) =
      _$InsightModelImpl.fromJson;

  @override
  String get type;
  @override
  String get title;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$InsightModelImplCopyWith<_$InsightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
