import 'package:flutter/foundation.dart' show kIsWeb;

class Environment {
  static const String appName = 'Nabungo';
  static const String appVersion = '1.0.0';

  /// API Base URL - override at build time:
  ///   flutter run --dart-define=API_BASE_URL=http://192.168.1.x:3000/api
  ///   flutter build apk --dart-define=API_BASE_URL=http://192.168.1.x:3000/api
  static String get apiBaseUrl {
    const compiledUrl = String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: '',
    );
    if (compiledUrl.isNotEmpty) return compiledUrl;
    return _defaultUrl;
  }

  static String get _defaultUrl {
    if (kIsWeb) return 'http://localhost:3000/api';
    return 'http://10.0.2.2:3000/api';
  }

  static bool get isProduction => bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );

  static bool get isDebug => !isProduction;

  static const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'production',
  );
}
