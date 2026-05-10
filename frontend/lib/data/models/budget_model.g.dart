// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) => BudgetModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      month: DateTime.parse(json['month'] as String),
      categoryName: json['category_name'] as String?,
      categoryIcon: json['category_icon'] as String?,
    );

BudgetProgress _$BudgetProgressFromJson(Map<String, dynamic> json) =>
    BudgetProgress(
      id: (json['id'] as num).toInt(),
      budgetAmount: (json['budget_amount'] as num).toDouble(),
      categoryId: (json['category_id'] as num).toInt(),
      categoryName: json['category_name'] as String,
      categoryIcon: json['category_icon'] as String,
      categoryColor: json['category_color'] as String,
      spent: (json['spent'] as num).toDouble(),
    );

BudgetAlert _$BudgetAlertFromJson(Map<String, dynamic> json) => BudgetAlert(
      type: json['type'] as String,
      category: json['category'] as String,
      message: json['message'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

CreateBudgetRequest _$CreateBudgetRequestFromJson(Map<String, dynamic> json) =>
    CreateBudgetRequest(
      categoryId: (json['category_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      month: json['month'] == null
          ? null
          : DateTime.parse(json['month'] as String),
    );

Map<String, dynamic> _$CreateBudgetRequestToJson(
        CreateBudgetRequest instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'amount': instance.amount,
      'month': instance.month?.toIso8601String(),
    };
