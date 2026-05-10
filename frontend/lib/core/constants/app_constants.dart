class AppConstants {
  static const String appName = 'Nabungo';
  static const String baseUrl = 'http://localhost:3000/api';
  static const String hiveBoxName = 'nabungo_box';
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String localeKey = 'locale';

  // XP System
  static const int xpPerTransaction = 10;
  static const int xpPerStreakDay = 5;
  static const int xpChallengeComplete = 50;
  static const int xpPerInsight = 3;

  // Limits
  static const int maxRecentTransactions = 5;
  static const int maxTopCategories = 5;
  static const int pageSize = 20;

  // Animation
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration slowAnimationDuration = Duration(milliseconds: 600);
}
