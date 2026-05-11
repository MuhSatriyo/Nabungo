import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local/local_storage.dart';

final themeProvider = StateNotifierProvider.autoDispose<ThemeNotifier, ThemeMode>((ref) {
  final localStorage = ref.read(localStorageProvider);
  return ThemeNotifier(localStorage);
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final LocalStorage _localStorage;

  ThemeNotifier(this._localStorage) : super(_getInitialMode(_localStorage));

  static ThemeMode _getInitialMode(LocalStorage storage) {
    final isDark = storage.getThemeMode();
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _localStorage.setThemeMode(state == ThemeMode.dark);
  }

  void setTheme(ThemeMode mode) {
    state = mode;
    _localStorage.setThemeMode(mode == ThemeMode.dark);
  }
}
