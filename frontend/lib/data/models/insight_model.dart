import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_model.freezed.dart';
part 'insight_model.g.dart';

@freezed
class InsightModel with _$InsightModel {
  const factory InsightModel({
    required String type,
    required String title,
    required String message,
  }) = _InsightModel;

  factory InsightModel.fromJson(Map<String, dynamic> json) =>
      _$InsightModelFromJson(json);
}
