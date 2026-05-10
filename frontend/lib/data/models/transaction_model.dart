import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required int id,
    required int userId,
    required String type,
    required double amount,
    required int categoryId,
    String? categoryName,
    String? categoryIcon,
    String? categoryColor,
    String? note,
    required DateTime date,
    DateTime? createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

@freezed
class CreateTransactionRequest with _$CreateTransactionRequest {
  const factory CreateTransactionRequest({
    required String type,
    required double amount,
    int? categoryId,
    String? note,
    DateTime? date,
  }) = _CreateTransactionRequest;

  factory CreateTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionRequestFromJson(json);
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String icon,
    required String color,
    @Default('expense') String type,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class AnalyticsData with _$AnalyticsData {
  const factory AnalyticsData({
    required SummaryData summary,
    @Default([]) List<CategorySummary> categories,
    @Default([]) List<WeeklySpending> weeklySpending,
    @Default([]) List<DailyTotal> dailyTotals,
  }) = _AnalyticsData;

  factory AnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsDataFromJson(json);
}

@freezed
class SummaryData with _$SummaryData {
  const factory SummaryData({
    @Default(0) double totalExpense,
    @Default(0) double totalIncome,
    @Default(0) int transactionCount,
  }) = _SummaryData;

  factory SummaryData.fromJson(Map<String, dynamic> json) =>
      _$SummaryDataFromJson(json);
}

@freezed
class CategorySummary with _$CategorySummary {
  const factory CategorySummary({
    required int id,
    required String name,
    required String icon,
    required String color,
    required double total,
    required int count,
  }) = _CategorySummary;

  factory CategorySummary.fromJson(Map<String, dynamic> json) =>
      _$CategorySummaryFromJson(json);
}

@freezed
class WeeklySpending with _$WeeklySpending {
  const factory WeeklySpending({
    required double weekNumber,
    required double total,
  }) = _WeeklySpending;

  factory WeeklySpending.fromJson(Map<String, dynamic> json) =>
      _$WeeklySpendingFromJson(json);
}

@freezed
class DailyTotal with _$DailyTotal {
  const factory DailyTotal({
    required DateTime date,
    required double expense,
    required double income,
  }) = _DailyTotal;

  factory DailyTotal.fromJson(Map<String, dynamic> json) =>
      _$DailyTotalFromJson(json);
}
