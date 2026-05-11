import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'data/datasources/local/local_storage.dart';
import 'presentation/providers/locale_provider.dart';
import 'presentation/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  final localStorage = LocalStorage();
  await localStorage.init();

  final isDark = localStorage.getThemeMode();
  final savedLocale = localStorage.getString('locale') ?? 'id';

  runApp(
    ProviderScope(
      overrides: [
        localStorageProvider.overrideWithValue(localStorage),
      ],
      child: NabungoApp(isDark: isDark, initialLocale: savedLocale),
    ),
  );
}

class NabungoApp extends ConsumerWidget {
  final bool isDark;
  final String initialLocale;

  const NabungoApp({super.key, required this.isDark, required this.initialLocale});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Nabungo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      locale: Locale(locale),
      supportedLocales: const [Locale('id'), Locale('en')],
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      routerConfig: appRouter,
    );
  }
}
