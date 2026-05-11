import 'package:flutter_test/flutter_test.dart';
import 'package:nabungo/data/models/challenge_model.dart';

void main() {
  group('ChallengeModel', () {
    test('fromJson with snake_case keys', () {
      final json = {
        'id': 1,
        'title': 'No Jajan 3 Days',
        'description': 'Hindari jajan selama 3 hari',
        'icon': 'emoji_events',
        'difficulty': 'easy',
        'xp_reward': 30,
        'days_required': 3,
        'requirement_type': 'streak',
        'requirement_value': '3',
        'is_active': true,
      };

      final challenge = ChallengeModel.fromJson(json);

      expect(challenge.id, 1);
      expect(challenge.title, 'No Jajan 3 Days');
      expect(challenge.xpReward, 30);
      expect(challenge.daysRequired, 3);
      expect(challenge.requirementType, 'streak');
      expect(challenge.requirementValue, '3');
      expect(challenge.isActive, true);
      expect(challenge.difficulty, 'easy');
    });
  });

  group('GamificationStatus', () {
    test('fromJson', () {
      final json = {
        'xp': 250,
        'level': 3,
        'xpForNextLevel': 400,
        'badges': [
          {'id': 1, 'name': 'First Transaction', 'code': 'FIRST_TRANSACTION', 'earned_at': '2024-01-01T00:00:00.000'},
        ],
        'streak': {
          'current_streak': 5,
          'longest_streak': 10,
          'last_activity_date': '2024-01-15',
        },
        'activeChallenges': [],
      };

      final status = GamificationStatus.fromJson(json);

      expect(status.xp, 250);
      expect(status.level, 3);
      expect(status.xpForNextLevel, 400);
      expect(status.badges.length, 1);
      expect(status.badges[0].name, 'First Transaction');
      expect(status.streak!.currentStreak, 5);
      expect(status.streak!.longestStreak, 10);
      expect(status.activeChallenges, []);
    });
  });

  group('StreakData', () {
    test('fromJson with snake_case keys', () {
      final json = {
        'current_streak': 3,
        'longest_streak': 7,
        'last_activity_date': '2024-01-10',
      };

      final streak = StreakData.fromJson(json);

      expect(streak.currentStreak, 3);
      expect(streak.longestStreak, 7);
      expect(streak.lastActivityDate, DateTime(2024, 1, 10));
    });
  });

  group('BadgeModel', () {
    test('fromJson with snake_case keys', () {
      final json = {
        'id': 1,
        'name': '7-Day Streak',
        'description': 'Log transactions for 7 consecutive days',
        'icon': 'whatshot',
        'code': 'STREAK_7',
        'earned_at': '2024-01-07T00:00:00.000',
      };

      final badge = BadgeModel.fromJson(json);

      expect(badge.id, 1);
      expect(badge.name, '7-Day Streak');
      expect(badge.code, 'STREAK_7');
      expect(badge.earnedAt, DateTime(2024, 1, 7));
    });
  });
}
