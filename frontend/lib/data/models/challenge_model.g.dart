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
      xpReward: (json['xpReward'] as num?)?.toInt() ?? 50,
      daysRequired: (json['daysRequired'] as num?)?.toInt() ?? 3,
      requirementType: json['requirementType'] as String?,
      requirementValue: json['requirementValue'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$ChallengeModelImplToJson(
        _$ChallengeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'icon': instance.icon,
      'difficulty': instance.difficulty,
      'xpReward': instance.xpReward,
      'daysRequired': instance.daysRequired,
      'requirementType': instance.requirementType,
      'requirementValue': instance.requirementValue,
      'isActive': instance.isActive,
    };

_$UserChallengeImpl _$$UserChallengeImplFromJson(Map<String, dynamic> json) =>
    _$UserChallengeImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      challengeId: (json['challengeId'] as num).toInt(),
      status: json['status'] as String,
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      title: json['title'] as String?,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as String?,
      xpReward: (json['xpReward'] as num?)?.toInt(),
      daysRequired: (json['daysRequired'] as num?)?.toInt(),
      icon: json['icon'] as String?,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$UserChallengeImplToJson(_$UserChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'challengeId': instance.challengeId,
      'status': instance.status,
      'progress': instance.progress,
      'title': instance.title,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'xpReward': instance.xpReward,
      'daysRequired': instance.daysRequired,
      'icon': instance.icon,
      'startedAt': instance.startedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };

_$BadgeModelImpl _$$BadgeModelImplFromJson(Map<String, dynamic> json) =>
    _$BadgeModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as String,
      earnedAt: json['earnedAt'] == null
          ? null
          : DateTime.parse(json['earnedAt'] as String),
    );

Map<String, dynamic> _$$BadgeModelImplToJson(_$BadgeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'code': instance.code,
      'earnedAt': instance.earnedAt?.toIso8601String(),
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
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      lastActivityDate: json['lastActivityDate'] == null
          ? null
          : DateTime.parse(json['lastActivityDate'] as String),
    );

Map<String, dynamic> _$$StreakDataImplToJson(_$StreakDataImpl instance) =>
    <String, dynamic>{
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'lastActivityDate': instance.lastActivityDate?.toIso8601String(),
    };
