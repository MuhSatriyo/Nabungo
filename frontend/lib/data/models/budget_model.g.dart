// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetModelImpl _$$BudgetModelImplFromJson(Map<String, dynamic> json) =>
    _$BudgetModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      month: DateTime.parse(json['month'] as String),
      categoryName: json['categoryName'] as String?,
      categoryIcon: json['categoryIcon'] as String?,
    );

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'amount': instance.amount,
      'month': instance.month.toIso8601String(),
      'categoryName': instance.categoryName,
      'categoryIcon': instance.categoryIcon,
    };

_$BudgetProgressImpl _$$BudgetProgressImplFromJson(Map<String, dynamic> json) =>
    _$BudgetProgressImpl(
      id: (json['id'] as num).toInt(),
      budgetAmount: (json['budgetAmount'] as num).toDouble(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      categoryIcon: json['categoryIcon'] as String,
      categoryColor: json['categoryColor'] as String,
      spent: (json['spent'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetProgressImplToJson(
        _$BudgetProgressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'budgetAmount': instance.budgetAmount,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categoryIcon': instance.categoryIcon,
      'categoryColor': instance.categoryColor,
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
      categoryId: (json['categoryId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      month: json['month'] == null
          ? null
          : DateTime.parse(json['month'] as String),
    );

Map<String, dynamic> _$$CreateBudgetRequestImplToJson(
        _$CreateBudgetRequestImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'amount': instance.amount,
      'month': instance.month?.toIso8601String(),
    };
