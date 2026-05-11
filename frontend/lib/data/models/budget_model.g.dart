// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetModelImpl _$$BudgetModelImplFromJson(Map<String, dynamic> json) =>
    _$BudgetModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      month: DateTime.parse(json['month'] as String),
      categoryName: json['category_name'] as String?,
      categoryIcon: json['category_icon'] as String?,
    );

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'amount': instance.amount,
      'month': instance.month.toIso8601String(),
      'category_name': instance.categoryName,
      'category_icon': instance.categoryIcon,
    };

_$BudgetProgressImpl _$$BudgetProgressImplFromJson(Map<String, dynamic> json) =>
    _$BudgetProgressImpl(
      id: (json['id'] as num).toInt(),
      budgetAmount: (json['budget_amount'] as num).toDouble(),
      categoryId: (json['category_id'] as num).toInt(),
      categoryName: json['category_name'] as String,
      categoryIcon: json['category_icon'] as String,
      categoryColor: json['category_color'] as String,
      spent: (json['spent'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetProgressImplToJson(
        _$BudgetProgressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'budget_amount': instance.budgetAmount,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_icon': instance.categoryIcon,
      'category_color': instance.categoryColor,
      'spent': instance.spent,
    };

_$BudgetAlertImpl _$$BudgetAlertImplFromJson(Map<String, dynamic> json) =>
    _$BudgetAlertImpl(
      type: json['type'] as String,
      category: json['category'] as String,
      message: json['message'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetAlertImplToJson(_$BudgetAlertImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'category': instance.category,
      'message': instance.message,
      'percentage': instance.percentage,
    };

_$CreateBudgetRequestImpl _$$CreateBudgetRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBudgetRequestImpl(
      categoryId: (json['category_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      month: json['month'] == null
          ? null
          : DateTime.parse(json['month'] as String),
    );

Map<String, dynamic> _$$CreateBudgetRequestImplToJson(
        _$CreateBudgetRequestImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'amount': instance.amount,
      'month': instance.month?.toIso8601String(),
    };
