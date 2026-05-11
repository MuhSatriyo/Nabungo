import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_constants.dart';
import '../../data/datasources/local/local_storage.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, String>((ref) {
  final storage = ref.watch(localStorageProvider);
  return LocaleNotifier(storage);
});

class LocaleNotifier extends StateNotifier<String> {
  final LocalStorage _storage;

  LocaleNotifier(this._storage) : super(_storage.getString(AppConstants.localeKey) ?? 'id');

  Future<void> setLocale(String locale) async {
    state = locale;
    await _storage.saveString(AppConstants.localeKey, locale);
  }

  void toggle() {
    setLocale(state == 'id' ? 'en' : 'id');
  }
}
