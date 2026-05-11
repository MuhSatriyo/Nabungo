import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../localization/app_strings.dart';
import '../../presentation/providers/locale_provider.dart';

extension TranslationsExtension on WidgetRef {
  String tr(String key, {Map<String, String>? params}) {
    final locale = watch(localeProvider);
    return AppStrings.tr(key, locale: locale, params: params);
  }
}

extension BuildContextTr on BuildContext {
  String tr(String key, {Map<String, String>? params}) {
    return AppStrings.tr(key, params: params);
  }
}
