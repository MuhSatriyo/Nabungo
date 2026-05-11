import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'category_id') required int categoryId,
    required double amount,
    required DateTime month,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'category_icon') String? categoryIcon,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}

@freezed
class BudgetProgress with _$BudgetProgress {
  const factory BudgetProgress({
    required int id,
    @JsonKey(name: 'budget_amount') required double budgetAmount,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'category_icon') required String categoryIcon,
    @JsonKey(name: 'category_color') required String categoryColor,
    required double spent,
  }) = _BudgetProgress;

  factory BudgetProgress.fromJson(Map<String, dynamic> json) =>
      _$BudgetProgressFromJson(json);
}

@freezed
class BudgetAlert with _$BudgetAlert {
  const factory BudgetAlert({
    required String type,
    required String category,
    required String message,
    required double percentage,
  }) = _BudgetAlert;

  factory BudgetAlert.fromJson(Map<String, dynamic> json) =>
      _$BudgetAlertFromJson(json);
}

@freezed
class CreateBudgetRequest with _$CreateBudgetRequest {
  const factory CreateBudgetRequest({
    @JsonKey(name: 'category_id') required int categoryId,
    required double amount,
    DateTime? month,
  }) = _CreateBudgetRequest;

  factory CreateBudgetRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBudgetRequestFromJson(json);
}
