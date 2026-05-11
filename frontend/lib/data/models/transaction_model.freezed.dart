// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_icon')
  String? get categoryIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_color')
  String? get categoryColor => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String type,
      double amount,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_icon') String? categoryIcon,
      @JsonKey(name: 'category_color') String? categoryColor,
      String? note,
      DateTime date,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? amount = null,
    Object? categoryId = null,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? categoryColor = freezed,
    Object? note = freezed,
    Object? date = null,
    Object? createdAt = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String type,
      double amount,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_icon') String? categoryIcon,
      @JsonKey(name: 'category_color') String? categoryColor,
      String? note,
      DateTime date,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? amount = null,
    Object? categoryId = null,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? categoryColor = freezed,
    Object? note = freezed,
    Object? date = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$TransactionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.type,
      required this.amount,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_icon') this.categoryIcon,
      @JsonKey(name: 'category_color') this.categoryColor,
      this.note,
      required this.date,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final String type;
  @override
  final double amount;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'category_icon')
  final String? categoryIcon;
  @override
  @JsonKey(name: 'category_color')
  final String? categoryColor;
  @override
  final String? note;
  @override
  final DateTime date;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TransactionModel(id: $id, userId: $userId, type: $type, amount: $amount, categoryId: $categoryId, categoryName: $categoryName, categoryIcon: $categoryIcon, categoryColor: $categoryColor, note: $note, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      type,
      amount,
      categoryId,
      categoryName,
      categoryIcon,
      categoryColor,
      note,
      date,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
          {required final int id,
          @JsonKey(name: 'user_id') required final int userId,
          required final String type,
          required final double amount,
          @JsonKey(name: 'category_id') required final int categoryId,
          @JsonKey(name: 'category_name') final String? categoryName,
          @JsonKey(name: 'category_icon') final String? categoryIcon,
          @JsonKey(name: 'category_color') final String? categoryColor,
          final String? note,
          required final DateTime date,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get type;
  @override
  double get amount;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'category_icon')
  String? get categoryIcon;
  @override
  @JsonKey(name: 'category_color')
  String? get categoryColor;
  @override
  String? get note;
  @override
  DateTime get date;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTransactionRequest _$CreateTransactionRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateTransactionRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTransactionRequest {
  String get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTransactionRequestCopyWith<CreateTransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTransactionRequestCopyWith<$Res> {
  factory $CreateTransactionRequestCopyWith(CreateTransactionRequest value,
          $Res Function(CreateTransactionRequest) then) =
      _$CreateTransactionRequestCopyWithImpl<$Res, CreateTransactionRequest>;
  @useResult
  $Res call(
      {String type,
      double amount,
      @JsonKey(name: 'category_id') int? categoryId,
      String? note,
      DateTime? date});
}

/// @nodoc
class _$CreateTransactionRequestCopyWithImpl<$Res,
        $Val extends CreateTransactionRequest>
    implements $CreateTransactionRequestCopyWith<$Res> {
  _$CreateTransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
    Object? categoryId = freezed,
    Object? note = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTransactionRequestImplCopyWith<$Res>
    implements $CreateTransactionRequestCopyWith<$Res> {
  factory _$$CreateTransactionRequestImplCopyWith(
          _$CreateTransactionRequestImpl value,
          $Res Function(_$CreateTransactionRequestImpl) then) =
      __$$CreateTransactionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      double amount,
      @JsonKey(name: 'category_id') int? categoryId,
      String? note,
      DateTime? date});
}

/// @nodoc
class __$$CreateTransactionRequestImplCopyWithImpl<$Res>
    extends _$CreateTransactionRequestCopyWithImpl<$Res,
        _$CreateTransactionRequestImpl>
    implements _$$CreateTransactionRequestImplCopyWith<$Res> {
  __$$CreateTransactionRequestImplCopyWithImpl(
      _$CreateTransactionRequestImpl _value,
      $Res Function(_$CreateTransactionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
    Object? categoryId = freezed,
    Object? note = freezed,
    Object? date = freezed,
  }) {
    return _then(_$CreateTransactionRequestImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTransactionRequestImpl implements _CreateTransactionRequest {
  const _$CreateTransactionRequestImpl(
      {required this.type,
      required this.amount,
      @JsonKey(name: 'category_id') this.categoryId,
      this.note,
      this.date});

  factory _$CreateTransactionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTransactionRequestImplFromJson(json);

  @override
  final String type;
  @override
  final double amount;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  final String? note;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'CreateTransactionRequest(type: $type, amount: $amount, categoryId: $categoryId, note: $note, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionRequestImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, amount, categoryId, note, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransactionRequestImplCopyWith<_$CreateTransactionRequestImpl>
      get copyWith => __$$CreateTransactionRequestImplCopyWithImpl<
          _$CreateTransactionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTransactionRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateTransactionRequest implements CreateTransactionRequest {
  const factory _CreateTransactionRequest(
      {required final String type,
      required final double amount,
      @JsonKey(name: 'category_id') final int? categoryId,
      final String? note,
      final DateTime? date}) = _$CreateTransactionRequestImpl;

  factory _CreateTransactionRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTransactionRequestImpl.fromJson;

  @override
  String get type;
  @override
  double get amount;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  String? get note;
  @override
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$CreateTransactionRequestImplCopyWith<_$CreateTransactionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({int id, String name, String icon, String color, String type});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
    Object? type = null,
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
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String icon, String color, String type});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
    Object? type = null,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.id,
      required this.name,
      required this.icon,
      required this.color,
      this.type = 'expense'});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String color;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, icon: $icon, color: $color, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon, color, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {required final int id,
      required final String name,
      required final String icon,
      required final String color,
      final String type}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  String get color;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsData _$AnalyticsDataFromJson(Map<String, dynamic> json) {
  return _AnalyticsData.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsData {
  SummaryData get summary => throw _privateConstructorUsedError;
  List<CategorySummary> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_spending')
  List<WeeklySpending> get weeklySpending => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_totals')
  List<DailyTotal> get dailyTotals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsDataCopyWith<AnalyticsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsDataCopyWith<$Res> {
  factory $AnalyticsDataCopyWith(
          AnalyticsData value, $Res Function(AnalyticsData) then) =
      _$AnalyticsDataCopyWithImpl<$Res, AnalyticsData>;
  @useResult
  $Res call(
      {SummaryData summary,
      List<CategorySummary> categories,
      @JsonKey(name: 'weekly_spending') List<WeeklySpending> weeklySpending,
      @JsonKey(name: 'daily_totals') List<DailyTotal> dailyTotals});

  $SummaryDataCopyWith<$Res> get summary;
}

/// @nodoc
class _$AnalyticsDataCopyWithImpl<$Res, $Val extends AnalyticsData>
    implements $AnalyticsDataCopyWith<$Res> {
  _$AnalyticsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? categories = null,
    Object? weeklySpending = null,
    Object? dailyTotals = null,
  }) {
    return _then(_value.copyWith(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as SummaryData,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategorySummary>,
      weeklySpending: null == weeklySpending
          ? _value.weeklySpending
          : weeklySpending // ignore: cast_nullable_to_non_nullable
              as List<WeeklySpending>,
      dailyTotals: null == dailyTotals
          ? _value.dailyTotals
          : dailyTotals // ignore: cast_nullable_to_non_nullable
              as List<DailyTotal>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SummaryDataCopyWith<$Res> get summary {
    return $SummaryDataCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsDataImplCopyWith<$Res>
    implements $AnalyticsDataCopyWith<$Res> {
  factory _$$AnalyticsDataImplCopyWith(
          _$AnalyticsDataImpl value, $Res Function(_$AnalyticsDataImpl) then) =
      __$$AnalyticsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SummaryData summary,
      List<CategorySummary> categories,
      @JsonKey(name: 'weekly_spending') List<WeeklySpending> weeklySpending,
      @JsonKey(name: 'daily_totals') List<DailyTotal> dailyTotals});

  @override
  $SummaryDataCopyWith<$Res> get summary;
}

/// @nodoc
class __$$AnalyticsDataImplCopyWithImpl<$Res>
    extends _$AnalyticsDataCopyWithImpl<$Res, _$AnalyticsDataImpl>
    implements _$$AnalyticsDataImplCopyWith<$Res> {
  __$$AnalyticsDataImplCopyWithImpl(
      _$AnalyticsDataImpl _value, $Res Function(_$AnalyticsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? categories = null,
    Object? weeklySpending = null,
    Object? dailyTotals = null,
  }) {
    return _then(_$AnalyticsDataImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as SummaryData,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategorySummary>,
      weeklySpending: null == weeklySpending
          ? _value._weeklySpending
          : weeklySpending // ignore: cast_nullable_to_non_nullable
              as List<WeeklySpending>,
      dailyTotals: null == dailyTotals
          ? _value._dailyTotals
          : dailyTotals // ignore: cast_nullable_to_non_nullable
              as List<DailyTotal>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsDataImpl implements _AnalyticsData {
  const _$AnalyticsDataImpl(
      {required this.summary,
      final List<CategorySummary> categories = const [],
      @JsonKey(name: 'weekly_spending')
      final List<WeeklySpending> weeklySpending = const [],
      @JsonKey(name: 'daily_totals')
      final List<DailyTotal> dailyTotals = const []})
      : _categories = categories,
        _weeklySpending = weeklySpending,
        _dailyTotals = dailyTotals;

  factory _$AnalyticsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsDataImplFromJson(json);

  @override
  final SummaryData summary;
  final List<CategorySummary> _categories;
  @override
  @JsonKey()
  List<CategorySummary> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<WeeklySpending> _weeklySpending;
  @override
  @JsonKey(name: 'weekly_spending')
  List<WeeklySpending> get weeklySpending {
    if (_weeklySpending is EqualUnmodifiableListView) return _weeklySpending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklySpending);
  }

  final List<DailyTotal> _dailyTotals;
  @override
  @JsonKey(name: 'daily_totals')
  List<DailyTotal> get dailyTotals {
    if (_dailyTotals is EqualUnmodifiableListView) return _dailyTotals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyTotals);
  }

  @override
  String toString() {
    return 'AnalyticsData(summary: $summary, categories: $categories, weeklySpending: $weeklySpending, dailyTotals: $dailyTotals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsDataImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._weeklySpending, _weeklySpending) &&
            const DeepCollectionEquality()
                .equals(other._dailyTotals, _dailyTotals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_weeklySpending),
      const DeepCollectionEquality().hash(_dailyTotals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsDataImplCopyWith<_$AnalyticsDataImpl> get copyWith =>
      __$$AnalyticsDataImplCopyWithImpl<_$AnalyticsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsDataImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsData implements AnalyticsData {
  const factory _AnalyticsData(
          {required final SummaryData summary,
          final List<CategorySummary> categories,
          @JsonKey(name: 'weekly_spending')
          final List<WeeklySpending> weeklySpending,
          @JsonKey(name: 'daily_totals') final List<DailyTotal> dailyTotals}) =
      _$AnalyticsDataImpl;

  factory _AnalyticsData.fromJson(Map<String, dynamic> json) =
      _$AnalyticsDataImpl.fromJson;

  @override
  SummaryData get summary;
  @override
  List<CategorySummary> get categories;
  @override
  @JsonKey(name: 'weekly_spending')
  List<WeeklySpending> get weeklySpending;
  @override
  @JsonKey(name: 'daily_totals')
  List<DailyTotal> get dailyTotals;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsDataImplCopyWith<_$AnalyticsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SummaryData _$SummaryDataFromJson(Map<String, dynamic> json) {
  return _SummaryData.fromJson(json);
}

/// @nodoc
mixin _$SummaryData {
  @JsonKey(name: 'total_expense')
  double get totalExpense => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_income')
  double get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_count')
  int get transactionCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryDataCopyWith<SummaryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryDataCopyWith<$Res> {
  factory $SummaryDataCopyWith(
          SummaryData value, $Res Function(SummaryData) then) =
      _$SummaryDataCopyWithImpl<$Res, SummaryData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_expense') double totalExpense,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'transaction_count') int transactionCount});
}

/// @nodoc
class _$SummaryDataCopyWithImpl<$Res, $Val extends SummaryData>
    implements $SummaryDataCopyWith<$Res> {
  _$SummaryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpense = null,
    Object? totalIncome = null,
    Object? transactionCount = null,
  }) {
    return _then(_value.copyWith(
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryDataImplCopyWith<$Res>
    implements $SummaryDataCopyWith<$Res> {
  factory _$$SummaryDataImplCopyWith(
          _$SummaryDataImpl value, $Res Function(_$SummaryDataImpl) then) =
      __$$SummaryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_expense') double totalExpense,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'transaction_count') int transactionCount});
}

/// @nodoc
class __$$SummaryDataImplCopyWithImpl<$Res>
    extends _$SummaryDataCopyWithImpl<$Res, _$SummaryDataImpl>
    implements _$$SummaryDataImplCopyWith<$Res> {
  __$$SummaryDataImplCopyWithImpl(
      _$SummaryDataImpl _value, $Res Function(_$SummaryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpense = null,
    Object? totalIncome = null,
    Object? transactionCount = null,
  }) {
    return _then(_$SummaryDataImpl(
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryDataImpl implements _SummaryData {
  const _$SummaryDataImpl(
      {@JsonKey(name: 'total_expense') this.totalExpense = 0,
      @JsonKey(name: 'total_income') this.totalIncome = 0,
      @JsonKey(name: 'transaction_count') this.transactionCount = 0});

  factory _$SummaryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryDataImplFromJson(json);

  @override
  @JsonKey(name: 'total_expense')
  final double totalExpense;
  @override
  @JsonKey(name: 'total_income')
  final double totalIncome;
  @override
  @JsonKey(name: 'transaction_count')
  final int transactionCount;

  @override
  String toString() {
    return 'SummaryData(totalExpense: $totalExpense, totalIncome: $totalIncome, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryDataImpl &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalExpense, totalIncome, transactionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryDataImplCopyWith<_$SummaryDataImpl> get copyWith =>
      __$$SummaryDataImplCopyWithImpl<_$SummaryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryDataImplToJson(
      this,
    );
  }
}

abstract class _SummaryData implements SummaryData {
  const factory _SummaryData(
          {@JsonKey(name: 'total_expense') final double totalExpense,
          @JsonKey(name: 'total_income') final double totalIncome,
          @JsonKey(name: 'transaction_count') final int transactionCount}) =
      _$SummaryDataImpl;

  factory _SummaryData.fromJson(Map<String, dynamic> json) =
      _$SummaryDataImpl.fromJson;

  @override
  @JsonKey(name: 'total_expense')
  double get totalExpense;
  @override
  @JsonKey(name: 'total_income')
  double get totalIncome;
  @override
  @JsonKey(name: 'transaction_count')
  int get transactionCount;
  @override
  @JsonKey(ignore: true)
  _$$SummaryDataImplCopyWith<_$SummaryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategorySummary _$CategorySummaryFromJson(Map<String, dynamic> json) {
  return _CategorySummary.fromJson(json);
}

/// @nodoc
mixin _$CategorySummary {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorySummaryCopyWith<CategorySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySummaryCopyWith<$Res> {
  factory $CategorySummaryCopyWith(
          CategorySummary value, $Res Function(CategorySummary) then) =
      _$CategorySummaryCopyWithImpl<$Res, CategorySummary>;
  @useResult
  $Res call(
      {int id,
      String name,
      String icon,
      String color,
      double total,
      int count});
}

/// @nodoc
class _$CategorySummaryCopyWithImpl<$Res, $Val extends CategorySummary>
    implements $CategorySummaryCopyWith<$Res> {
  _$CategorySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
    Object? total = null,
    Object? count = null,
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
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySummaryImplCopyWith<$Res>
    implements $CategorySummaryCopyWith<$Res> {
  factory _$$CategorySummaryImplCopyWith(_$CategorySummaryImpl value,
          $Res Function(_$CategorySummaryImpl) then) =
      __$$CategorySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String icon,
      String color,
      double total,
      int count});
}

/// @nodoc
class __$$CategorySummaryImplCopyWithImpl<$Res>
    extends _$CategorySummaryCopyWithImpl<$Res, _$CategorySummaryImpl>
    implements _$$CategorySummaryImplCopyWith<$Res> {
  __$$CategorySummaryImplCopyWithImpl(
      _$CategorySummaryImpl _value, $Res Function(_$CategorySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
    Object? total = null,
    Object? count = null,
  }) {
    return _then(_$CategorySummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorySummaryImpl implements _CategorySummary {
  const _$CategorySummaryImpl(
      {required this.id,
      required this.name,
      required this.icon,
      required this.color,
      required this.total,
      required this.count});

  factory _$CategorySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorySummaryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String color;
  @override
  final double total;
  @override
  final int count;

  @override
  String toString() {
    return 'CategorySummary(id: $id, name: $name, icon: $icon, color: $color, total: $total, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, icon, color, total, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySummaryImplCopyWith<_$CategorySummaryImpl> get copyWith =>
      __$$CategorySummaryImplCopyWithImpl<_$CategorySummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorySummaryImplToJson(
      this,
    );
  }
}

abstract class _CategorySummary implements CategorySummary {
  const factory _CategorySummary(
      {required final int id,
      required final String name,
      required final String icon,
      required final String color,
      required final double total,
      required final int count}) = _$CategorySummaryImpl;

  factory _CategorySummary.fromJson(Map<String, dynamic> json) =
      _$CategorySummaryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  String get color;
  @override
  double get total;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$CategorySummaryImplCopyWith<_$CategorySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklySpending _$WeeklySpendingFromJson(Map<String, dynamic> json) {
  return _WeeklySpending.fromJson(json);
}

/// @nodoc
mixin _$WeeklySpending {
  @JsonKey(name: 'week_number')
  double get weekNumber => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklySpendingCopyWith<WeeklySpending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklySpendingCopyWith<$Res> {
  factory $WeeklySpendingCopyWith(
          WeeklySpending value, $Res Function(WeeklySpending) then) =
      _$WeeklySpendingCopyWithImpl<$Res, WeeklySpending>;
  @useResult
  $Res call({@JsonKey(name: 'week_number') double weekNumber, double total});
}

/// @nodoc
class _$WeeklySpendingCopyWithImpl<$Res, $Val extends WeeklySpending>
    implements $WeeklySpendingCopyWith<$Res> {
  _$WeeklySpendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekNumber = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      weekNumber: null == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklySpendingImplCopyWith<$Res>
    implements $WeeklySpendingCopyWith<$Res> {
  factory _$$WeeklySpendingImplCopyWith(_$WeeklySpendingImpl value,
          $Res Function(_$WeeklySpendingImpl) then) =
      __$$WeeklySpendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'week_number') double weekNumber, double total});
}

/// @nodoc
class __$$WeeklySpendingImplCopyWithImpl<$Res>
    extends _$WeeklySpendingCopyWithImpl<$Res, _$WeeklySpendingImpl>
    implements _$$WeeklySpendingImplCopyWith<$Res> {
  __$$WeeklySpendingImplCopyWithImpl(
      _$WeeklySpendingImpl _value, $Res Function(_$WeeklySpendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekNumber = null,
    Object? total = null,
  }) {
    return _then(_$WeeklySpendingImpl(
      weekNumber: null == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklySpendingImpl implements _WeeklySpending {
  const _$WeeklySpendingImpl(
      {@JsonKey(name: 'week_number') required this.weekNumber,
      required this.total});

  factory _$WeeklySpendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklySpendingImplFromJson(json);

  @override
  @JsonKey(name: 'week_number')
  final double weekNumber;
  @override
  final double total;

  @override
  String toString() {
    return 'WeeklySpending(weekNumber: $weekNumber, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklySpendingImpl &&
            (identical(other.weekNumber, weekNumber) ||
                other.weekNumber == weekNumber) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, weekNumber, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklySpendingImplCopyWith<_$WeeklySpendingImpl> get copyWith =>
      __$$WeeklySpendingImplCopyWithImpl<_$WeeklySpendingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklySpendingImplToJson(
      this,
    );
  }
}

abstract class _WeeklySpending implements WeeklySpending {
  const factory _WeeklySpending(
      {@JsonKey(name: 'week_number') required final double weekNumber,
      required final double total}) = _$WeeklySpendingImpl;

  factory _WeeklySpending.fromJson(Map<String, dynamic> json) =
      _$WeeklySpendingImpl.fromJson;

  @override
  @JsonKey(name: 'week_number')
  double get weekNumber;
  @override
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$WeeklySpendingImplCopyWith<_$WeeklySpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyTotal _$DailyTotalFromJson(Map<String, dynamic> json) {
  return _DailyTotal.fromJson(json);
}

/// @nodoc
mixin _$DailyTotal {
  DateTime get date => throw _privateConstructorUsedError;
  double get expense => throw _privateConstructorUsedError;
  double get income => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyTotalCopyWith<DailyTotal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTotalCopyWith<$Res> {
  factory $DailyTotalCopyWith(
          DailyTotal value, $Res Function(DailyTotal) then) =
      _$DailyTotalCopyWithImpl<$Res, DailyTotal>;
  @useResult
  $Res call({DateTime date, double expense, double income});
}

/// @nodoc
class _$DailyTotalCopyWithImpl<$Res, $Val extends DailyTotal>
    implements $DailyTotalCopyWith<$Res> {
  _$DailyTotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? expense = null,
    Object? income = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyTotalImplCopyWith<$Res>
    implements $DailyTotalCopyWith<$Res> {
  factory _$$DailyTotalImplCopyWith(
          _$DailyTotalImpl value, $Res Function(_$DailyTotalImpl) then) =
      __$$DailyTotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double expense, double income});
}

/// @nodoc
class __$$DailyTotalImplCopyWithImpl<$Res>
    extends _$DailyTotalCopyWithImpl<$Res, _$DailyTotalImpl>
    implements _$$DailyTotalImplCopyWith<$Res> {
  __$$DailyTotalImplCopyWithImpl(
      _$DailyTotalImpl _value, $Res Function(_$DailyTotalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? expense = null,
    Object? income = null,
  }) {
    return _then(_$DailyTotalImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyTotalImpl implements _DailyTotal {
  const _$DailyTotalImpl(
      {required this.date, required this.expense, required this.income});

  factory _$DailyTotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyTotalImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double expense;
  @override
  final double income;

  @override
  String toString() {
    return 'DailyTotal(date: $date, expense: $expense, income: $income)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTotalImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.income, income) || other.income == income));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, expense, income);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTotalImplCopyWith<_$DailyTotalImpl> get copyWith =>
      __$$DailyTotalImplCopyWithImpl<_$DailyTotalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyTotalImplToJson(
      this,
    );
  }
}

abstract class _DailyTotal implements DailyTotal {
  const factory _DailyTotal(
      {required final DateTime date,
      required final double expense,
      required final double income}) = _$DailyTotalImpl;

  factory _DailyTotal.fromJson(Map<String, dynamic> json) =
      _$DailyTotalImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get expense;
  @override
  double get income;
  @override
  @JsonKey(ignore: true)
  _$$DailyTotalImplCopyWith<_$DailyTotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
