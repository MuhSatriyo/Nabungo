// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: (json['category_id'] as num?)?.toInt() ?? 0,
      categoryName: json['category_name'] as String?,
      categoryIcon: json['category_icon'] as String?,
      categoryColor: json['category_color'] as String?,
      note: json['note'] as String?,
      date: DateTime.parse(json['date'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'type': instance.type,
      'amount': instance.amount,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_icon': instance.categoryIcon,
      'category_color': instance.categoryColor,
      'note': instance.note,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

CreateTransactionRequest _$CreateTransactionRequestFromJson(
        Map<String, dynamic> json) =>
    CreateTransactionRequest(
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      note: json['note'] as String?,
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$CreateTransactionRequestToJson(
        CreateTransactionRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
      'category_id': instance.categoryId,
      'note': instance.note,
      'date': instance.date?.toIso8601String(),
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String? ?? 'receipt',
      color: json['color'] as String? ?? '#6C63FF',
      type: json['type'] as String? ?? 'expense',
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
      'type': instance.type,
    };

AnalyticsData _$AnalyticsDataFromJson(Map<String, dynamic> json) =>
    AnalyticsData(
      summary: SummaryData.fromJson(json['summary'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategorySummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      weeklySpending: (json['weekly_spending'] as List<dynamic>?)
              ?.map((e) => WeeklySpending.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      dailyTotals: (json['daily_totals'] as List<dynamic>?)
              ?.map((e) => DailyTotal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

SummaryData _$SummaryDataFromJson(Map<String, dynamic> json) => SummaryData(
      totalExpense: (json['total_expense'] as num?)?.toDouble() ?? 0,
      totalIncome: (json['total_income'] as num?)?.toDouble() ?? 0,
      transactionCount: (json['transaction_count'] as num?)?.toInt() ?? 0,
    );

CategorySummary _$CategorySummaryFromJson(Map<String, dynamic> json) =>
    CategorySummary(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      total: (json['total'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

WeeklySpending _$WeeklySpendingFromJson(Map<String, dynamic> json) =>
    WeeklySpending(
      weekNumber: (json['week_number'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

DailyTotal _$DailyTotalFromJson(Map<String, dynamic> json) => DailyTotal(
      date: DateTime.parse(json['date'] as String),
      expense: (json['expense'] as num).toDouble(),
      income: (json['income'] as num).toDouble(),
    );
