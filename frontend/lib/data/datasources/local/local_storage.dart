import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import '../../../core/constants/app_constants.dart';

final localStorageProvider = Provider<LocalStorage>((ref) {
  return LocalStorage();
});

class LocalStorage {
  Box? _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(AppConstants.hiveBoxName);
  }

  Future<void> saveString(String key, String value) async {
    await _box?.put(key, value);
  }

  String? getString(String key) {
    return _box?.get(key);
  }

  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    await _box?.put(key, jsonEncode(value));
  }

  Map<String, dynamic>? getMap(String key) {
    final data = _box?.get(key);
    if (data is String) {
      return jsonDecode(data);
    }
    return null;
  }

  Future<void> saveList(String key, List<dynamic> value) async {
    await _box?.put(key, jsonEncode(value));
  }

  List<dynamic>? getList(String key) {
    final data = _box?.get(key);
    if (data is String) {
      return jsonDecode(data);
    }
    return null;
  }

  Future<void> remove(String key) async {
    await _box?.delete(key);
  }

  Future<void> clear() async {
    await _box?.clear();
  }

  bool containsKey(String key) {
    return _box?.containsKey(key) ?? false;
  }

  Future<void> setThemeMode(bool isDark) async {
    await _box?.put(AppConstants.themeKey, isDark);
  }

  bool getThemeMode() {
    return _box?.get(AppConstants.themeKey, defaultValue: false) ?? false;
  }

  Future<void> setTokens({required String accessToken, String? refreshToken}) async {
    await _box?.put(AppConstants.tokenKey, accessToken);
    if (refreshToken != null) {
      await _box?.put(AppConstants.refreshTokenKey, refreshToken);
    }
  }

  String? getAccessToken() => _box?.get(AppConstants.tokenKey);
  String? getRefreshToken() => _box?.get(AppConstants.refreshTokenKey);

  Future<void> clearAuth() async {
    await _box?.delete(AppConstants.tokenKey);
    await _box?.delete(AppConstants.refreshTokenKey);
    await _box?.delete(AppConstants.userKey);
  }
}
