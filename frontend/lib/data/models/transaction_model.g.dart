// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String?,
      categoryIcon: json['categoryIcon'] as String?,
      categoryColor: json['categoryColor'] as String?,
      note: json['note'] as String?,
      date: DateTime.parse(json['date'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'amount': instance.amount,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categoryIcon': instance.categoryIcon,
      'categoryColor': instance.categoryColor,
      'note': instance.note,
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$CreateTransactionRequestImpl _$$CreateTransactionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTransactionRequestImpl(
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      note: json['note'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$CreateTransactionRequestImplToJson(
        _$CreateTransactionRequestImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
      'categoryId': instance.categoryId,
      'note': instance.note,
      'date': instance.date?.toIso8601String(),
    };

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      type: json['type'] as String? ?? 'expense',
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
      'type': instance.type,
    };

_$AnalyticsDataImpl _$$AnalyticsDataImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticsDataImpl(
      summary: SummaryData.fromJson(json['summary'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategorySummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weeklySpending: (json['weeklySpending'] as List<dynamic>?)
              ?.map((e) => WeeklySpending.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dailyTotals: (json['dailyTotals'] as List<dynamic>?)
              ?.map((e) => DailyTotal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AnalyticsDataImplToJson(_$AnalyticsDataImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'categories': instance.categories,
      'weeklySpending': instance.weeklySpending,
      'dailyTotals': instance.dailyTotals,
    };

_$SummaryDataImpl _$$SummaryDataImplFromJson(Map<String, dynamic> json) =>
    _$SummaryDataImpl(
      totalExpense: (json['totalExpense'] as num?)?.toDouble() ?? 0,
      totalIncome: (json['totalIncome'] as num?)?.toDouble() ?? 0,
      transactionCount: (json['transactionCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SummaryDataImplToJson(_$SummaryDataImpl instance) =>
    <String, dynamic>{
      'totalExpense': instance.totalExpense,
      'totalIncome': instance.totalIncome,
      'transactionCount': instance.transactionCount,
    };

_$CategorySummaryImpl _$$CategorySummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorySummaryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      total: (json['total'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$CategorySummaryImplToJson(
        _$CategorySummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
      'total': instance.total,
      'count': instance.count,
    };

_$WeeklySpendingImpl _$$WeeklySpendingImplFromJson(Map<String, dynamic> json) =>
    _$WeeklySpendingImpl(
      weekNumber: (json['weekNumber'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeeklySpendingImplToJson(
        _$WeeklySpendingImpl instance) =>
    <String, dynamic>{
      'weekNumber': instance.weekNumber,
      'total': instance.total,
    };

_$DailyTotalImpl _$$DailyTotalImplFromJson(Map<String, dynamic> json) =>
    _$DailyTotalImpl(
      date: DateTime.parse(json['date'] as String),
      expense: (json['expense'] as num).toDouble(),
      income: (json['income'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyTotalImplToJson(_$DailyTotalImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'expense': instance.expense,
      'income': instance.income,
    };
