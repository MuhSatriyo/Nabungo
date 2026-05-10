/// Flutter environment configuration
/// Update these values based on your deployment environment
class Environment {
  static const String appName = 'Nabungo';
  static const String appVersion = '1.0.0';

  /// API Base URL - change this to your production API URL
  /// For local development use: http://localhost:3000/api
  /// For production use: https://api.nabungo.app/api
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000/api',
  );

  /// Flag to determine if running in production mode
  static const bool isProduction = bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );

  /// Flag to determine if running in debug mode
  static bool get isDebug => !isProduction;

  /// App flavor
  static const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'production',
  );
}
