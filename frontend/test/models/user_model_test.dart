import 'package:flutter_test/flutter_test.dart';
import 'package:nabungo/data/models/user_model.dart';

void main() {
  group('UserModel', () {
    test('fromJson with snake_case keys', () {
      final json = {
        'id': 1,
        'name': 'John Doe',
        'email': 'john@example.com',
        'avatar_url': null,
        'xp': 150,
        'level': 3,
        'created_at': '2024-01-01T00:00:00.000',
      };

      final user = UserModel.fromJson(json);

      expect(user.id, 1);
      expect(user.name, 'John Doe');
      expect(user.email, 'john@example.com');
      expect(user.avatarUrl, null);
      expect(user.xp, 150);
      expect(user.level, 3);
      expect(user.createdAt, DateTime(2024, 1, 1));
    });
  });

  group('AuthResponse', () {
    test('fromJson', () {
      final json = {
        'user': {
          'id': 1,
          'name': 'John',
          'email': 'john@test.com',
          'avatar_url': null,
          'xp': 0,
          'level': 1,
        },
        'accessToken': 'abc123',
        'refreshToken': 'def456',
      };

      final response = AuthResponse.fromJson(json);

      expect(response.user.id, 1);
      expect(response.accessToken, 'abc123');
      expect(response.refreshToken, 'def456');
    });
  });
}
