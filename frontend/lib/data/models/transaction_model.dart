import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    required String type,
    required double amount,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'category_icon') String? categoryIcon,
    @JsonKey(name: 'category_color') String? categoryColor,
    String? note,
    required DateTime date,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

@freezed
class CreateTransactionRequest with _$CreateTransactionRequest {
  const factory CreateTransactionRequest({
    required String type,
    required double amount,
    @JsonKey(name: 'category_id') int? categoryId,
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
    @JsonKey(name: 'weekly_spending') @Default([]) List<WeeklySpending> weeklySpending,
    @JsonKey(name: 'daily_totals') @Default([]) List<DailyTotal> dailyTotals,
  }) = _AnalyticsData;

  factory AnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsDataFromJson(json);
}

@freezed
class SummaryData with _$SummaryData {
  const factory SummaryData({
    @JsonKey(name: 'total_expense') @Default(0) double totalExpense,
    @JsonKey(name: 'total_income') @Default(0) double totalIncome,
    @JsonKey(name: 'transaction_count') @Default(0) int transactionCount,
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
    @JsonKey(name: 'week_number') required double weekNumber,
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
