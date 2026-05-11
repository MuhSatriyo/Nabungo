// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) {
  return _BudgetModel.fromJson(json);
}

/// @nodoc
mixin _$BudgetModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_icon')
  String? get categoryIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetModelCopyWith<BudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelCopyWith<$Res> {
  factory $BudgetModelCopyWith(
          BudgetModel value, $Res Function(BudgetModel) then) =
      _$BudgetModelCopyWithImpl<$Res, BudgetModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'category_id') int categoryId,
      double amount,
      DateTime month,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_icon') String? categoryIcon});
}

/// @nodoc
class _$BudgetModelCopyWithImpl<$Res, $Val extends BudgetModel>
    implements $BudgetModelCopyWith<$Res> {
  _$BudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? categoryId = null,
    Object? amount = null,
    Object? month = null,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
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
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetModelImplCopyWith<$Res>
    implements $BudgetModelCopyWith<$Res> {
  factory _$$BudgetModelImplCopyWith(
          _$BudgetModelImpl value, $Res Function(_$BudgetModelImpl) then) =
      __$$BudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'category_id') int categoryId,
      double amount,
      DateTime month,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_icon') String? categoryIcon});
}

/// @nodoc
class __$$BudgetModelImplCopyWithImpl<$Res>
    extends _$BudgetModelCopyWithImpl<$Res, _$BudgetModelImpl>
    implements _$$BudgetModelImplCopyWith<$Res> {
  __$$BudgetModelImplCopyWithImpl(
      _$BudgetModelImpl _value, $Res Function(_$BudgetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? categoryId = null,
    Object? amount = null,
    Object? month = null,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
  }) {
    return _then(_$BudgetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetModelImpl implements _BudgetModel {
  const _$BudgetModelImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'category_id') required this.categoryId,
      required this.amount,
      required this.month,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_icon') this.categoryIcon});

  factory _$BudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  final double amount;
  @override
  final DateTime month;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'category_icon')
  final String? categoryIcon;

  @override
  String toString() {
    return 'BudgetModel(id: $id, userId: $userId, categoryId: $categoryId, amount: $amount, month: $month, categoryName: $categoryName, categoryIcon: $categoryIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, categoryId, amount,
      month, categoryName, categoryIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      __$$BudgetModelImplCopyWithImpl<_$BudgetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetModelImplToJson(
      this,
    );
  }
}

abstract class _BudgetModel implements BudgetModel {
  const factory _BudgetModel(
          {required final int id,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'category_id') required final int categoryId,
          required final double amount,
          required final DateTime month,
          @JsonKey(name: 'category_name') final String? categoryName,
          @JsonKey(name: 'category_icon') final String? categoryIcon}) =
      _$BudgetModelImpl;

  factory _BudgetModel.fromJson(Map<String, dynamic> json) =
      _$BudgetModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  double get amount;
  @override
  DateTime get month;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'category_icon')
  String? get categoryIcon;
  @override
  @JsonKey(ignore: true)
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetProgress _$BudgetProgressFromJson(Map<String, dynamic> json) {
  return _BudgetProgress.fromJson(json);
}

/// @nodoc
mixin _$BudgetProgress {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_amount')
  double get budgetAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_icon')
  String get categoryIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_color')
  String get categoryColor => throw _privateConstructorUsedError;
  double get spent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetProgressCopyWith<BudgetProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetProgressCopyWith<$Res> {
  factory $BudgetProgressCopyWith(
          BudgetProgress value, $Res Function(BudgetProgress) then) =
      _$BudgetProgressCopyWithImpl<$Res, BudgetProgress>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'budget_amount') double budgetAmount,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'category_icon') String categoryIcon,
      @JsonKey(name: 'category_color') String categoryColor,
      double spent});
}

/// @nodoc
class _$BudgetProgressCopyWithImpl<$Res, $Val extends BudgetProgress>
    implements $BudgetProgressCopyWith<$Res> {
  _$BudgetProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? budgetAmount = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? categoryIcon = null,
    Object? categoryColor = null,
    Object? spent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      budgetAmount: null == budgetAmount
          ? _value.budgetAmount
          : budgetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIcon: null == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      categoryColor: null == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetProgressImplCopyWith<$Res>
    implements $BudgetProgressCopyWith<$Res> {
  factory _$$BudgetProgressImplCopyWith(_$BudgetProgressImpl value,
          $Res Function(_$BudgetProgressImpl) then) =
      __$$BudgetProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'budget_amount') double budgetAmount,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'category_icon') String categoryIcon,
      @JsonKey(name: 'category_color') String categoryColor,
      double spent});
}

/// @nodoc
class __$$BudgetProgressImplCopyWithImpl<$Res>
    extends _$BudgetProgressCopyWithImpl<$Res, _$BudgetProgressImpl>
    implements _$$BudgetProgressImplCopyWith<$Res> {
  __$$BudgetProgressImplCopyWithImpl(
      _$BudgetProgressImpl _value, $Res Function(_$BudgetProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? budgetAmount = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? categoryIcon = null,
    Object? categoryColor = null,
    Object? spent = null,
  }) {
    return _then(_$BudgetProgressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      budgetAmount: null == budgetAmount
          ? _value.budgetAmount
          : budgetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIcon: null == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      categoryColor: null == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetProgressImpl implements _BudgetProgress {
  const _$BudgetProgressImpl(
      {required this.id,
      @JsonKey(name: 'budget_amount') required this.budgetAmount,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'category_icon') required this.categoryIcon,
      @JsonKey(name: 'category_color') required this.categoryColor,
      required this.spent});

  factory _$BudgetProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetProgressImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'budget_amount')
  final double budgetAmount;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'category_icon')
  final String categoryIcon;
  @override
  @JsonKey(name: 'category_color')
  final String categoryColor;
  @override
  final double spent;

  @override
  String toString() {
    return 'BudgetProgress(id: $id, budgetAmount: $budgetAmount, categoryId: $categoryId, categoryName: $categoryName, categoryIcon: $categoryIcon, categoryColor: $categoryColor, spent: $spent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetProgressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.budgetAmount, budgetAmount) ||
                other.budgetAmount == budgetAmount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.spent, spent) || other.spent == spent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, budgetAmount, categoryId,
      categoryName, categoryIcon, categoryColor, spent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetProgressImplCopyWith<_$BudgetProgressImpl> get copyWith =>
      __$$BudgetProgressImplCopyWithImpl<_$BudgetProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetProgressImplToJson(
      this,
    );
  }
}

abstract class _BudgetProgress implements BudgetProgress {
  const factory _BudgetProgress(
      {required final int id,
      @JsonKey(name: 'budget_amount') required final double budgetAmount,
      @JsonKey(name: 'category_id') required final int categoryId,
      @JsonKey(name: 'category_name') required final String categoryName,
      @JsonKey(name: 'category_icon') required final String categoryIcon,
      @JsonKey(name: 'category_color') required final String categoryColor,
      required final double spent}) = _$BudgetProgressImpl;

  factory _BudgetProgress.fromJson(Map<String, dynamic> json) =
      _$BudgetProgressImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'budget_amount')
  double get budgetAmount;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'category_icon')
  String get categoryIcon;
  @override
  @JsonKey(name: 'category_color')
  String get categoryColor;
  @override
  double get spent;
  @override
  @JsonKey(ignore: true)
  _$$BudgetProgressImplCopyWith<_$BudgetProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetAlert _$BudgetAlertFromJson(Map<String, dynamic> json) {
  return _BudgetAlert.fromJson(json);
}

/// @nodoc
mixin _$BudgetAlert {
  String get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetAlertCopyWith<BudgetAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetAlertCopyWith<$Res> {
  factory $BudgetAlertCopyWith(
          BudgetAlert value, $Res Function(BudgetAlert) then) =
      _$BudgetAlertCopyWithImpl<$Res, BudgetAlert>;
  @useResult
  $Res call({String type, String category, String message, double percentage});
}

/// @nodoc
class _$BudgetAlertCopyWithImpl<$Res, $Val extends BudgetAlert>
    implements $BudgetAlertCopyWith<$Res> {
  _$BudgetAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? category = null,
    Object? message = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetAlertImplCopyWith<$Res>
    implements $BudgetAlertCopyWith<$Res> {
  factory _$$BudgetAlertImplCopyWith(
          _$BudgetAlertImpl value, $Res Function(_$BudgetAlertImpl) then) =
      __$$BudgetAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String category, String message, double percentage});
}

/// @nodoc
class __$$BudgetAlertImplCopyWithImpl<$Res>
    extends _$BudgetAlertCopyWithImpl<$Res, _$BudgetAlertImpl>
    implements _$$BudgetAlertImplCopyWith<$Res> {
  __$$BudgetAlertImplCopyWithImpl(
      _$BudgetAlertImpl _value, $Res Function(_$BudgetAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? category = null,
    Object? message = null,
    Object? percentage = null,
  }) {
    return _then(_$BudgetAlertImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetAlertImpl implements _BudgetAlert {
  const _$BudgetAlertImpl(
      {required this.type,
      required this.category,
      required this.message,
      required this.percentage});

  factory _$BudgetAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetAlertImplFromJson(json);

  @override
  final String type;
  @override
  final String category;
  @override
  final String message;
  @override
  final double percentage;

  @override
  String toString() {
    return 'BudgetAlert(type: $type, category: $category, message: $message, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetAlertImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, category, message, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetAlertImplCopyWith<_$BudgetAlertImpl> get copyWith =>
      __$$BudgetAlertImplCopyWithImpl<_$BudgetAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetAlertImplToJson(
      this,
    );
  }
}

abstract class _BudgetAlert implements BudgetAlert {
  const factory _BudgetAlert(
      {required final String type,
      required final String category,
      required final String message,
      required final double percentage}) = _$BudgetAlertImpl;

  factory _BudgetAlert.fromJson(Map<String, dynamic> json) =
      _$BudgetAlertImpl.fromJson;

  @override
  String get type;
  @override
  String get category;
  @override
  String get message;
  @override
  double get percentage;
  @override
  @JsonKey(ignore: true)
  _$$BudgetAlertImplCopyWith<_$BudgetAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateBudgetRequest _$CreateBudgetRequestFromJson(Map<String, dynamic> json) {
  return _CreateBudgetRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBudgetRequest {
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime? get month => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBudgetRequestCopyWith<CreateBudgetRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBudgetRequestCopyWith<$Res> {
  factory $CreateBudgetRequestCopyWith(
          CreateBudgetRequest value, $Res Function(CreateBudgetRequest) then) =
      _$CreateBudgetRequestCopyWithImpl<$Res, CreateBudgetRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') int categoryId,
      double amount,
      DateTime? month});
}

/// @nodoc
class _$CreateBudgetRequestCopyWithImpl<$Res, $Val extends CreateBudgetRequest>
    implements $CreateBudgetRequestCopyWith<$Res> {
  _$CreateBudgetRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? amount = null,
    Object? month = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBudgetRequestImplCopyWith<$Res>
    implements $CreateBudgetRequestCopyWith<$Res> {
  factory _$$CreateBudgetRequestImplCopyWith(_$CreateBudgetRequestImpl value,
          $Res Function(_$CreateBudgetRequestImpl) then) =
      __$$CreateBudgetRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') int categoryId,
      double amount,
      DateTime? month});
}

/// @nodoc
class __$$CreateBudgetRequestImplCopyWithImpl<$Res>
    extends _$CreateBudgetRequestCopyWithImpl<$Res, _$CreateBudgetRequestImpl>
    implements _$$CreateBudgetRequestImplCopyWith<$Res> {
  __$$CreateBudgetRequestImplCopyWithImpl(_$CreateBudgetRequestImpl _value,
      $Res Function(_$CreateBudgetRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? amount = null,
    Object? month = freezed,
  }) {
    return _then(_$CreateBudgetRequestImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBudgetRequestImpl implements _CreateBudgetRequest {
  const _$CreateBudgetRequestImpl(
      {@JsonKey(name: 'category_id') required this.categoryId,
      required this.amount,
      this.month});

  factory _$CreateBudgetRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBudgetRequestImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  final double amount;
  @override
  final DateTime? month;

  @override
  String toString() {
    return 'CreateBudgetRequest(categoryId: $categoryId, amount: $amount, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBudgetRequestImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.month, month) || other.month == month));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, amount, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBudgetRequestImplCopyWith<_$CreateBudgetRequestImpl> get copyWith =>
      __$$CreateBudgetRequestImplCopyWithImpl<_$CreateBudgetRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBudgetRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateBudgetRequest implements CreateBudgetRequest {
  const factory _CreateBudgetRequest(
      {@JsonKey(name: 'category_id') required final int categoryId,
      required final double amount,
      final DateTime? month}) = _$CreateBudgetRequestImpl;

  factory _CreateBudgetRequest.fromJson(Map<String, dynamic> json) =
      _$CreateBudgetRequestImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  double get amount;
  @override
  DateTime? get month;
  @override
  @JsonKey(ignore: true)
  _$$CreateBudgetRequestImplCopyWith<_$CreateBudgetRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
