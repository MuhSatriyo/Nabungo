// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeModelImpl _$$ChallengeModelImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeModelImpl(
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

Map<String, dynamic> _$$ChallengeModelImplToJson(
        _$ChallengeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'icon': instance.icon,
      'difficulty': instance.difficulty,
      'xp_reward': instance.xpReward,
      'days_required': instance.daysRequired,
      'requirement_type': instance.requirementType,
      'requirement_value': instance.requirementValue,
      'is_active': instance.isActive,
    };

_$UserChallengeImpl _$$UserChallengeImplFromJson(Map<String, dynamic> json) =>
    _$UserChallengeImpl(
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
      requirementType: json['requirement_type'] as String?,
      requirementValue: json['requirement_value'] as String?,
      icon: json['icon'] as String?,
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$$UserChallengeImplToJson(_$UserChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'challenge_id': instance.challengeId,
      'status': instance.status,
      'progress': instance.progress,
      'title': instance.title,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'xp_reward': instance.xpReward,
      'days_required': instance.daysRequired,
      'requirement_type': instance.requirementType,
      'requirement_value': instance.requirementValue,
      'icon': instance.icon,
      'started_at': instance.startedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
    };

_$BadgeModelImpl _$$BadgeModelImplFromJson(Map<String, dynamic> json) =>
    _$BadgeModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as String,
      earnedAt: json['earned_at'] == null
          ? null
          : DateTime.parse(json['earned_at'] as String),
    );

Map<String, dynamic> _$$BadgeModelImplToJson(_$BadgeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'code': instance.code,
      'earned_at': instance.earnedAt?.toIso8601String(),
    };

_$GamificationStatusImpl _$$GamificationStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$GamificationStatusImpl(
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 1,
      xpForNextLevel: (json['xpForNextLevel'] as num?)?.toInt() ?? 100,
      badges: (json['badges'] as List<dynamic>?)
              ?.map((e) => BadgeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      streak: json['streak'] == null
          ? null
          : StreakData.fromJson(json['streak'] as Map<String, dynamic>),
      activeChallenges: (json['activeChallenges'] as List<dynamic>?)
              ?.map((e) => UserChallenge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GamificationStatusImplToJson(
        _$GamificationStatusImpl instance) =>
    <String, dynamic>{
      'xp': instance.xp,
      'level': instance.level,
      'xpForNextLevel': instance.xpForNextLevel,
      'badges': instance.badges,
      'streak': instance.streak,
      'activeChallenges': instance.activeChallenges,
    };

_$StreakDataImpl _$$StreakDataImplFromJson(Map<String, dynamic> json) =>
    _$StreakDataImpl(
      currentStreak: (json['current_streak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longest_streak'] as num?)?.toInt() ?? 0,
      lastActivityDate: json['last_activity_date'] == null
          ? null
          : DateTime.parse(json['last_activity_date'] as String),
    );

Map<String, dynamic> _$$StreakDataImplToJson(_$StreakDataImpl instance) =>
    <String, dynamic>{
      'current_streak': instance.currentStreak,
      'longest_streak': instance.longestStreak,
      'last_activity_date': instance.lastActivityDate?.toIso8601String(),
    };
