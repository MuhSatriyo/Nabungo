import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_model.freezed.dart';
part 'challenge_model.g.dart';

@freezed
class ChallengeModel with _$ChallengeModel {
  const factory ChallengeModel({
    required int id,
    required String title,
    String? description,
    String? icon,
    required String difficulty,
    @Default(50) int xpReward,
    @Default(3) int daysRequired,
    String? requirementType,
    String? requirementValue,
    @Default(true) bool isActive,
  }) = _ChallengeModel;

  factory ChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeModelFromJson(json);
}

@freezed
class UserChallenge with _$UserChallenge {
  const factory UserChallenge({
    required int id,
    required int userId,
    required int challengeId,
    required String status,
    @Default(0) int progress,
    String? title,
    String? description,
    String? difficulty,
    int? xpReward,
    int? daysRequired,
    String? icon,
    DateTime? startedAt,
    DateTime? completedAt,
  }) = _UserChallenge;

  factory UserChallenge.fromJson(Map<String, dynamic> json) =>
      _$UserChallengeFromJson(json);
}

@freezed
class BadgeModel with _$BadgeModel {
  const factory BadgeModel({
    required int id,
    required String name,
    String? description,
    String? icon,
    required String code,
    DateTime? earnedAt,
  }) = _BadgeModel;

  factory BadgeModel.fromJson(Map<String, dynamic> json) =>
      _$BadgeModelFromJson(json);
}

@freezed
class GamificationStatus with _$GamificationStatus {
  const factory GamificationStatus({
    @Default(0) int xp,
    @Default(1) int level,
    @Default(100) int xpForNextLevel,
    @Default([]) List<BadgeModel> badges,
    StreakData? streak,
    @Default([]) List<UserChallenge> activeChallenges,
  }) = _GamificationStatus;

  factory GamificationStatus.fromJson(Map<String, dynamic> json) =>
      _$GamificationStatusFromJson(json);
}

@freezed
class StreakData with _$StreakData {
  const factory StreakData({
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    DateTime? lastActivityDate,
  }) = _StreakData;

  factory StreakData.fromJson(Map<String, dynamic> json) =>
      _$StreakDataFromJson(json);
}
