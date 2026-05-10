// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) =>
    ChallengeModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      difficulty: json['difficulty'] as String,
      xpReward: (json['xp_reward'] as num?)?.toInt() ?? 50,
      daysRequired: (json['days_required'] as num?)?.toInt() ?? 3,
      requirementType: json['requirement_type'] as String?,
      requirementValue: json['requirement_value'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );

UserChallenge _$UserChallengeFromJson(Map<String, dynamic> json) =>
    UserChallenge(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      challengeId: (json['challenge_id'] as num).toInt(),
      status: json['status'] as String,
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      title: json['title'] as String?,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as String?,
      xpReward: (json['xp_reward'] as num?)?.toInt(),
      daysRequired: (json['days_required'] as num?)?.toInt(),
      icon: json['icon'] as String?,
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

BadgeModel _$BadgeModelFromJson(Map<String, dynamic> json) => BadgeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as String,
      earnedAt: json['earned_at'] == null
          ? null
          : DateTime.parse(json['earned_at'] as String),
    );

GamificationStatus _$GamificationStatusFromJson(Map<String, dynamic> json) =>
    GamificationStatus(
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 1,
      xpForNextLevel: (json['xpForNextLevel'] as num?)?.toInt() ?? 100,
      badges: (json['badges'] as List<dynamic>?)
              ?.map((e) => BadgeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      streak: json['streak'] == null
          ? null
          : StreakData.fromJson(json['streak'] as Map<String, dynamic>),
      activeChallenges: (json['activeChallenges'] as List<dynamic>?)
              ?.map(
                  (e) => UserChallenge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

StreakData _$StreakDataFromJson(Map<String, dynamic> json) => StreakData(
      currentStreak: (json['current_streak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longest_streak'] as num?)?.toInt() ?? 0,
      lastActivityDate: json['last_activity_date'] == null
          ? null
          : DateTime.parse(json['last_activity_date'] as String),
    );
