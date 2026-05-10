// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) {
  return _ChallengeModel.fromJson(json);
}

/// @nodoc
mixin _$ChallengeModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  int get xpReward => throw _privateConstructorUsedError;
  int get daysRequired => throw _privateConstructorUsedError;
  String? get requirementType => throw _privateConstructorUsedError;
  String? get requirementValue => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeModelCopyWith<ChallengeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeModelCopyWith<$Res> {
  factory $ChallengeModelCopyWith(
          ChallengeModel value, $Res Function(ChallengeModel) then) =
      _$ChallengeModelCopyWithImpl<$Res, ChallengeModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      String? icon,
      String difficulty,
      int xpReward,
      int daysRequired,
      String? requirementType,
      String? requirementValue,
      bool isActive});
}

/// @nodoc
class _$ChallengeModelCopyWithImpl<$Res, $Val extends ChallengeModel>
    implements $ChallengeModelCopyWith<$Res> {
  _$ChallengeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? difficulty = null,
    Object? xpReward = null,
    Object? daysRequired = null,
    Object? requirementType = freezed,
    Object? requirementValue = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      xpReward: null == xpReward
          ? _value.xpReward
          : xpReward // ignore: cast_nullable_to_non_nullable
              as int,
      daysRequired: null == daysRequired
          ? _value.daysRequired
          : daysRequired // ignore: cast_nullable_to_non_nullable
              as int,
      requirementType: freezed == requirementType
          ? _value.requirementType
          : requirementType // ignore: cast_nullable_to_non_nullable
              as String?,
      requirementValue: freezed == requirementValue
          ? _value.requirementValue
          : requirementValue // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeModelImplCopyWith<$Res>
    implements $ChallengeModelCopyWith<$Res> {
  factory _$$ChallengeModelImplCopyWith(_$ChallengeModelImpl value,
          $Res Function(_$ChallengeModelImpl) then) =
      __$$ChallengeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      String? icon,
      String difficulty,
      int xpReward,
      int daysRequired,
      String? requirementType,
      String? requirementValue,
      bool isActive});
}

/// @nodoc
class __$$ChallengeModelImplCopyWithImpl<$Res>
    extends _$ChallengeModelCopyWithImpl<$Res, _$ChallengeModelImpl>
    implements _$$ChallengeModelImplCopyWith<$Res> {
  __$$ChallengeModelImplCopyWithImpl(
      _$ChallengeModelImpl _value, $Res Function(_$ChallengeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? difficulty = null,
    Object? xpReward = null,
    Object? daysRequired = null,
    Object? requirementType = freezed,
    Object? requirementValue = freezed,
    Object? isActive = null,
  }) {
    return _then(_$ChallengeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      xpReward: null == xpReward
          ? _value.xpReward
          : xpReward // ignore: cast_nullable_to_non_nullable
              as int,
      daysRequired: null == daysRequired
          ? _value.daysRequired
          : daysRequired // ignore: cast_nullable_to_non_nullable
              as int,
      requirementType: freezed == requirementType
          ? _value.requirementType
          : requirementType // ignore: cast_nullable_to_non_nullable
              as String?,
      requirementValue: freezed == requirementValue
          ? _value.requirementValue
          : requirementValue // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeModelImpl implements _ChallengeModel {
  const _$ChallengeModelImpl(
      {required this.id,
      required this.title,
      this.description,
      this.icon,
      required this.difficulty,
      this.xpReward = 50,
      this.daysRequired = 3,
      this.requirementType,
      this.requirementValue,
      this.isActive = true});

  factory _$ChallengeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? icon;
  @override
  final String difficulty;
  @override
  @JsonKey()
  final int xpReward;
  @override
  @JsonKey()
  final int daysRequired;
  @override
  final String? requirementType;
  @override
  final String? requirementValue;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'ChallengeModel(id: $id, title: $title, description: $description, icon: $icon, difficulty: $difficulty, xpReward: $xpReward, daysRequired: $daysRequired, requirementType: $requirementType, requirementValue: $requirementValue, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.xpReward, xpReward) ||
                other.xpReward == xpReward) &&
            (identical(other.daysRequired, daysRequired) ||
                other.daysRequired == daysRequired) &&
            (identical(other.requirementType, requirementType) ||
                other.requirementType == requirementType) &&
            (identical(other.requirementValue, requirementValue) ||
                other.requirementValue == requirementValue) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      icon,
      difficulty,
      xpReward,
      daysRequired,
      requirementType,
      requirementValue,
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeModelImplCopyWith<_$ChallengeModelImpl> get copyWith =>
      __$$ChallengeModelImplCopyWithImpl<_$ChallengeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeModelImplToJson(
      this,
    );
  }
}

abstract class _ChallengeModel implements ChallengeModel {
  const factory _ChallengeModel(
      {required final int id,
      required final String title,
      final String? description,
      final String? icon,
      required final String difficulty,
      final int xpReward,
      final int daysRequired,
      final String? requirementType,
      final String? requirementValue,
      final bool isActive}) = _$ChallengeModelImpl;

  factory _ChallengeModel.fromJson(Map<String, dynamic> json) =
      _$ChallengeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  String get difficulty;
  @override
  int get xpReward;
  @override
  int get daysRequired;
  @override
  String? get requirementType;
  @override
  String? get requirementValue;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$ChallengeModelImplCopyWith<_$ChallengeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserChallenge _$UserChallengeFromJson(Map<String, dynamic> json) {
  return _UserChallenge.fromJson(json);
}

/// @nodoc
mixin _$UserChallenge {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get challengeId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  int? get xpReward => throw _privateConstructorUsedError;
  int? get daysRequired => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserChallengeCopyWith<UserChallenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChallengeCopyWith<$Res> {
  factory $UserChallengeCopyWith(
          UserChallenge value, $Res Function(UserChallenge) then) =
      _$UserChallengeCopyWithImpl<$Res, UserChallenge>;
  @useResult
  $Res call(
      {int id,
      int userId,
      int challengeId,
      String status,
      int progress,
      String? title,
      String? description,
      String? difficulty,
      int? xpReward,
      int? daysRequired,
      String? icon,
      DateTime? startedAt,
      DateTime? completedAt});
}

/// @nodoc
class _$UserChallengeCopyWithImpl<$Res, $Val extends UserChallenge>
    implements $UserChallengeCopyWith<$Res> {
  _$UserChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? challengeId = null,
    Object? status = null,
    Object? progress = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? difficulty = freezed,
    Object? xpReward = freezed,
    Object? daysRequired = freezed,
    Object? icon = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      xpReward: freezed == xpReward
          ? _value.xpReward
          : xpReward // ignore: cast_nullable_to_non_nullable
              as int?,
      daysRequired: freezed == daysRequired
          ? _value.daysRequired
          : daysRequired // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserChallengeImplCopyWith<$Res>
    implements $UserChallengeCopyWith<$Res> {
  factory _$$UserChallengeImplCopyWith(
          _$UserChallengeImpl value, $Res Function(_$UserChallengeImpl) then) =
      __$$UserChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      int challengeId,
      String status,
      int progress,
      String? title,
      String? description,
      String? difficulty,
      int? xpReward,
      int? daysRequired,
      String? icon,
      DateTime? startedAt,
      DateTime? completedAt});
}

/// @nodoc
class __$$UserChallengeImplCopyWithImpl<$Res>
    extends _$UserChallengeCopyWithImpl<$Res, _$UserChallengeImpl>
    implements _$$UserChallengeImplCopyWith<$Res> {
  __$$UserChallengeImplCopyWithImpl(
      _$UserChallengeImpl _value, $Res Function(_$UserChallengeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? challengeId = null,
    Object? status = null,
    Object? progress = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? difficulty = freezed,
    Object? xpReward = freezed,
    Object? daysRequired = freezed,
    Object? icon = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$UserChallengeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      xpReward: freezed == xpReward
          ? _value.xpReward
          : xpReward // ignore: cast_nullable_to_non_nullable
              as int?,
      daysRequired: freezed == daysRequired
          ? _value.daysRequired
          : daysRequired // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserChallengeImpl implements _UserChallenge {
  const _$UserChallengeImpl(
      {required this.id,
      required this.userId,
      required this.challengeId,
      required this.status,
      this.progress = 0,
      this.title,
      this.description,
      this.difficulty,
      this.xpReward,
      this.daysRequired,
      this.icon,
      this.startedAt,
      this.completedAt});

  factory _$UserChallengeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserChallengeImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int challengeId;
  @override
  final String status;
  @override
  @JsonKey()
  final int progress;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? difficulty;
  @override
  final int? xpReward;
  @override
  final int? daysRequired;
  @override
  final String? icon;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'UserChallenge(id: $id, userId: $userId, challengeId: $challengeId, status: $status, progress: $progress, title: $title, description: $description, difficulty: $difficulty, xpReward: $xpReward, daysRequired: $daysRequired, icon: $icon, startedAt: $startedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserChallengeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.xpReward, xpReward) ||
                other.xpReward == xpReward) &&
            (identical(other.daysRequired, daysRequired) ||
                other.daysRequired == daysRequired) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      challengeId,
      status,
      progress,
      title,
      description,
      difficulty,
      xpReward,
      daysRequired,
      icon,
      startedAt,
      completedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserChallengeImplCopyWith<_$UserChallengeImpl> get copyWith =>
      __$$UserChallengeImplCopyWithImpl<_$UserChallengeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserChallengeImplToJson(
      this,
    );
  }
}

abstract class _UserChallenge implements UserChallenge {
  const factory _UserChallenge(
      {required final int id,
      required final int userId,
      required final int challengeId,
      required final String status,
      final int progress,
      final String? title,
      final String? description,
      final String? difficulty,
      final int? xpReward,
      final int? daysRequired,
      final String? icon,
      final DateTime? startedAt,
      final DateTime? completedAt}) = _$UserChallengeImpl;

  factory _UserChallenge.fromJson(Map<String, dynamic> json) =
      _$UserChallengeImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  int get challengeId;
  @override
  String get status;
  @override
  int get progress;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get difficulty;
  @override
  int? get xpReward;
  @override
  int? get daysRequired;
  @override
  String? get icon;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserChallengeImplCopyWith<_$UserChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BadgeModel _$BadgeModelFromJson(Map<String, dynamic> json) {
  return _BadgeModel.fromJson(json);
}

/// @nodoc
mixin _$BadgeModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  DateTime? get earnedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeModelCopyWith<BadgeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeModelCopyWith<$Res> {
  factory $BadgeModelCopyWith(
          BadgeModel value, $Res Function(BadgeModel) then) =
      _$BadgeModelCopyWithImpl<$Res, BadgeModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      String? icon,
      String code,
      DateTime? earnedAt});
}

/// @nodoc
class _$BadgeModelCopyWithImpl<$Res, $Val extends BadgeModel>
    implements $BadgeModelCopyWith<$Res> {
  _$BadgeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? code = null,
    Object? earnedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      earnedAt: freezed == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BadgeModelImplCopyWith<$Res>
    implements $BadgeModelCopyWith<$Res> {
  factory _$$BadgeModelImplCopyWith(
          _$BadgeModelImpl value, $Res Function(_$BadgeModelImpl) then) =
      __$$BadgeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      String? icon,
      String code,
      DateTime? earnedAt});
}

/// @nodoc
class __$$BadgeModelImplCopyWithImpl<$Res>
    extends _$BadgeModelCopyWithImpl<$Res, _$BadgeModelImpl>
    implements _$$BadgeModelImplCopyWith<$Res> {
  __$$BadgeModelImplCopyWithImpl(
      _$BadgeModelImpl _value, $Res Function(_$BadgeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? code = null,
    Object? earnedAt = freezed,
  }) {
    return _then(_$BadgeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      earnedAt: freezed == earnedAt
          ? _value.earnedAt
          : earnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadgeModelImpl implements _BadgeModel {
  const _$BadgeModelImpl(
      {required this.id,
      required this.name,
      this.description,
      this.icon,
      required this.code,
      this.earnedAt});

  factory _$BadgeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadgeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? icon;
  @override
  final String code;
  @override
  final DateTime? earnedAt;

  @override
  String toString() {
    return 'BadgeModel(id: $id, name: $name, description: $description, icon: $icon, code: $code, earnedAt: $earnedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.earnedAt, earnedAt) ||
                other.earnedAt == earnedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, icon, code, earnedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgeModelImplCopyWith<_$BadgeModelImpl> get copyWith =>
      __$$BadgeModelImplCopyWithImpl<_$BadgeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadgeModelImplToJson(
      this,
    );
  }
}

abstract class _BadgeModel implements BadgeModel {
  const factory _BadgeModel(
      {required final int id,
      required final String name,
      final String? description,
      final String? icon,
      required final String code,
      final DateTime? earnedAt}) = _$BadgeModelImpl;

  factory _BadgeModel.fromJson(Map<String, dynamic> json) =
      _$BadgeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  String get code;
  @override
  DateTime? get earnedAt;
  @override
  @JsonKey(ignore: true)
  _$$BadgeModelImplCopyWith<_$BadgeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GamificationStatus _$GamificationStatusFromJson(Map<String, dynamic> json) {
  return _GamificationStatus.fromJson(json);
}

/// @nodoc
mixin _$GamificationStatus {
  int get xp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get xpForNextLevel => throw _privateConstructorUsedError;
  List<BadgeModel> get badges => throw _privateConstructorUsedError;
  StreakData? get streak => throw _privateConstructorUsedError;
  List<UserChallenge> get activeChallenges =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamificationStatusCopyWith<GamificationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamificationStatusCopyWith<$Res> {
  factory $GamificationStatusCopyWith(
          GamificationStatus value, $Res Function(GamificationStatus) then) =
      _$GamificationStatusCopyWithImpl<$Res, GamificationStatus>;
  @useResult
  $Res call(
      {int xp,
      int level,
      int xpForNextLevel,
      List<BadgeModel> badges,
      StreakData? streak,
      List<UserChallenge> activeChallenges});

  $StreakDataCopyWith<$Res>? get streak;
}

/// @nodoc
class _$GamificationStatusCopyWithImpl<$Res, $Val extends GamificationStatus>
    implements $GamificationStatusCopyWith<$Res> {
  _$GamificationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xp = null,
    Object? level = null,
    Object? xpForNextLevel = null,
    Object? badges = null,
    Object? streak = freezed,
    Object? activeChallenges = null,
  }) {
    return _then(_value.copyWith(
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      xpForNextLevel: null == xpForNextLevel
          ? _value.xpForNextLevel
          : xpForNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<BadgeModel>,
      streak: freezed == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as StreakData?,
      activeChallenges: null == activeChallenges
          ? _value.activeChallenges
          : activeChallenges // ignore: cast_nullable_to_non_nullable
              as List<UserChallenge>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StreakDataCopyWith<$Res>? get streak {
    if (_value.streak == null) {
      return null;
    }

    return $StreakDataCopyWith<$Res>(_value.streak!, (value) {
      return _then(_value.copyWith(streak: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GamificationStatusImplCopyWith<$Res>
    implements $GamificationStatusCopyWith<$Res> {
  factory _$$GamificationStatusImplCopyWith(_$GamificationStatusImpl value,
          $Res Function(_$GamificationStatusImpl) then) =
      __$$GamificationStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int xp,
      int level,
      int xpForNextLevel,
      List<BadgeModel> badges,
      StreakData? streak,
      List<UserChallenge> activeChallenges});

  @override
  $StreakDataCopyWith<$Res>? get streak;
}

/// @nodoc
class __$$GamificationStatusImplCopyWithImpl<$Res>
    extends _$GamificationStatusCopyWithImpl<$Res, _$GamificationStatusImpl>
    implements _$$GamificationStatusImplCopyWith<$Res> {
  __$$GamificationStatusImplCopyWithImpl(_$GamificationStatusImpl _value,
      $Res Function(_$GamificationStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xp = null,
    Object? level = null,
    Object? xpForNextLevel = null,
    Object? badges = null,
    Object? streak = freezed,
    Object? activeChallenges = null,
  }) {
    return _then(_$GamificationStatusImpl(
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      xpForNextLevel: null == xpForNextLevel
          ? _value.xpForNextLevel
          : xpForNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<BadgeModel>,
      streak: freezed == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as StreakData?,
      activeChallenges: null == activeChallenges
          ? _value._activeChallenges
          : activeChallenges // ignore: cast_nullable_to_non_nullable
              as List<UserChallenge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GamificationStatusImpl implements _GamificationStatus {
  const _$GamificationStatusImpl(
      {this.xp = 0,
      this.level = 1,
      this.xpForNextLevel = 100,
      final List<BadgeModel> badges = const [],
      this.streak,
      final List<UserChallenge> activeChallenges = const []})
      : _badges = badges,
        _activeChallenges = activeChallenges;

  factory _$GamificationStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$GamificationStatusImplFromJson(json);

  @override
  @JsonKey()
  final int xp;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey()
  final int xpForNextLevel;
  final List<BadgeModel> _badges;
  @override
  @JsonKey()
  List<BadgeModel> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  final StreakData? streak;
  final List<UserChallenge> _activeChallenges;
  @override
  @JsonKey()
  List<UserChallenge> get activeChallenges {
    if (_activeChallenges is EqualUnmodifiableListView)
      return _activeChallenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeChallenges);
  }

  @override
  String toString() {
    return 'GamificationStatus(xp: $xp, level: $level, xpForNextLevel: $xpForNextLevel, badges: $badges, streak: $streak, activeChallenges: $activeChallenges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GamificationStatusImpl &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.xpForNextLevel, xpForNextLevel) ||
                other.xpForNextLevel == xpForNextLevel) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            const DeepCollectionEquality()
                .equals(other._activeChallenges, _activeChallenges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      xp,
      level,
      xpForNextLevel,
      const DeepCollectionEquality().hash(_badges),
      streak,
      const DeepCollectionEquality().hash(_activeChallenges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GamificationStatusImplCopyWith<_$GamificationStatusImpl> get copyWith =>
      __$$GamificationStatusImplCopyWithImpl<_$GamificationStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GamificationStatusImplToJson(
      this,
    );
  }
}

abstract class _GamificationStatus implements GamificationStatus {
  const factory _GamificationStatus(
      {final int xp,
      final int level,
      final int xpForNextLevel,
      final List<BadgeModel> badges,
      final StreakData? streak,
      final List<UserChallenge> activeChallenges}) = _$GamificationStatusImpl;

  factory _GamificationStatus.fromJson(Map<String, dynamic> json) =
      _$GamificationStatusImpl.fromJson;

  @override
  int get xp;
  @override
  int get level;
  @override
  int get xpForNextLevel;
  @override
  List<BadgeModel> get badges;
  @override
  StreakData? get streak;
  @override
  List<UserChallenge> get activeChallenges;
  @override
  @JsonKey(ignore: true)
  _$$GamificationStatusImplCopyWith<_$GamificationStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StreakData _$StreakDataFromJson(Map<String, dynamic> json) {
  return _StreakData.fromJson(json);
}

/// @nodoc
mixin _$StreakData {
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  DateTime? get lastActivityDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreakDataCopyWith<StreakData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakDataCopyWith<$Res> {
  factory $StreakDataCopyWith(
          StreakData value, $Res Function(StreakData) then) =
      _$StreakDataCopyWithImpl<$Res, StreakData>;
  @useResult
  $Res call({int currentStreak, int longestStreak, DateTime? lastActivityDate});
}

/// @nodoc
class _$StreakDataCopyWithImpl<$Res, $Val extends StreakData>
    implements $StreakDataCopyWith<$Res> {
  _$StreakDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastActivityDate = freezed,
  }) {
    return _then(_value.copyWith(
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastActivityDate: freezed == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreakDataImplCopyWith<$Res>
    implements $StreakDataCopyWith<$Res> {
  factory _$$StreakDataImplCopyWith(
          _$StreakDataImpl value, $Res Function(_$StreakDataImpl) then) =
      __$$StreakDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentStreak, int longestStreak, DateTime? lastActivityDate});
}

/// @nodoc
class __$$StreakDataImplCopyWithImpl<$Res>
    extends _$StreakDataCopyWithImpl<$Res, _$StreakDataImpl>
    implements _$$StreakDataImplCopyWith<$Res> {
  __$$StreakDataImplCopyWithImpl(
      _$StreakDataImpl _value, $Res Function(_$StreakDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastActivityDate = freezed,
  }) {
    return _then(_$StreakDataImpl(
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastActivityDate: freezed == lastActivityDate
          ? _value.lastActivityDate
          : lastActivityDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreakDataImpl implements _StreakData {
  const _$StreakDataImpl(
      {this.currentStreak = 0, this.longestStreak = 0, this.lastActivityDate});

  factory _$StreakDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreakDataImplFromJson(json);

  @override
  @JsonKey()
  final int currentStreak;
  @override
  @JsonKey()
  final int longestStreak;
  @override
  final DateTime? lastActivityDate;

  @override
  String toString() {
    return 'StreakData(currentStreak: $currentStreak, longestStreak: $longestStreak, lastActivityDate: $lastActivityDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreakDataImpl &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.lastActivityDate, lastActivityDate) ||
                other.lastActivityDate == lastActivityDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentStreak, longestStreak, lastActivityDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreakDataImplCopyWith<_$StreakDataImpl> get copyWith =>
      __$$StreakDataImplCopyWithImpl<_$StreakDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreakDataImplToJson(
      this,
    );
  }
}

abstract class _StreakData implements StreakData {
  const factory _StreakData(
      {final int currentStreak,
      final int longestStreak,
      final DateTime? lastActivityDate}) = _$StreakDataImpl;

  factory _StreakData.fromJson(Map<String, dynamic> json) =
      _$StreakDataImpl.fromJson;

  @override
  int get currentStreak;
  @override
  int get longestStreak;
  @override
  DateTime? get lastActivityDate;
  @override
  @JsonKey(ignore: true)
  _$$StreakDataImplCopyWith<_$StreakDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
