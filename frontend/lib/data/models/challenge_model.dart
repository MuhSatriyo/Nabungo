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
    @JsonKey(name: 'xp_reward') @Default(50) int xpReward,
    @JsonKey(name: 'days_required') @Default(3) int daysRequired,
    @JsonKey(name: 'requirement_type') String? requirementType,
    @JsonKey(name: 'requirement_value') String? requirementValue,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _ChallengeModel;

  factory ChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeModelFromJson(json);
}

@freezed
class UserChallenge with _$UserChallenge {
  const factory UserChallenge({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'challenge_id') required int challengeId,
    required String status,
    @Default(0) int progress,
    String? title,
    String? description,
    String? difficulty,
    @JsonKey(name: 'xp_reward') int? xpReward,
    @JsonKey(name: 'days_required') int? daysRequired,
    String? icon,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
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
    @JsonKey(name: 'earned_at') DateTime? earnedAt,
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
    @JsonKey(name: 'current_streak') @Default(0) int currentStreak,
    @JsonKey(name: 'longest_streak') @Default(0) int longestStreak,
    @JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,
  }) = _StreakData;

  factory StreakData.fromJson(Map<String, dynamic> json) =>
      _$StreakDataFromJson(json);
}
