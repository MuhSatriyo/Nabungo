import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import '../../providers/auth_provider.dart';
import '../../providers/locale_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/common/glass_card.dart';
import '../../../core/constants/colors.dart';
import '../../../core/localization/translations_extension.dart';
import '../../../core/network/api_client.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final auth = ref.watch(authStateProvider);
    final isDark = theme.brightness == Brightness.dark;
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(ref.tr('settings'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile section
          GlassCard(
            padding: const EdgeInsets.all(20),
            borderRadius: 20,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                  child: Text(
                    (auth.user?.name ?? 'U')[0].toUpperCase(),
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(auth.user?.name ?? 'User', style: theme.textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text(auth.user?.email ?? '', style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: theme.textTheme.bodyMedium?.color),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(ref.tr('preferences'), style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          // Language toggle
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            borderRadius: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.language),
                    const SizedBox(width: 12),
                    Text(ref.tr('language'), style: theme.textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: Text(
                    currentLocale == 'id' ? ref.tr('indonesian') : ref.tr('english'),
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: SegmentedButton<String>(
                    segments: [
                      ButtonSegment(value: 'id', label: Text(ref.tr('indonesian'))),
                      ButtonSegment(value: 'en', label: Text(ref.tr('english'))),
                    ],
                    selected: {currentLocale},
                    onSelectionChanged: (v) {
                      ref.read(localeProvider.notifier).setLocale(v.first);
                    },
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Dark mode toggle
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            borderRadius: 14,
            child: SwitchListTile(
              title: Text(ref.tr('dark_mode')),
              subtitle: Text(
                isDark ? ref.tr('dark_theme_active') : ref.tr('light_theme_active'),
                style: theme.textTheme.bodySmall,
              ),
              secondary: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: isDark ? const Color(0xFFFFD700) : AppColors.warning,
              ),
              value: isDark,
              onChanged: (_) {
                ref.read(themeProvider.notifier).toggleTheme();
              },
            ),
          ),
          const SizedBox(height: 8),
          // Notifications
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            borderRadius: 14,
            child: ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: Text(ref.tr('notifications')),
              subtitle: Text(ref.tr('manage_reminders'), style: theme.textTheme.bodySmall),
              trailing: Icon(Icons.chevron_right, color: theme.textTheme.bodyMedium?.color),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 24),
          Text(ref.tr('data'), style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          // Export data
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            borderRadius: 14,
            child: ListTile(
              leading: const Icon(Icons.download_outlined),
              title: Text(ref.tr('export_data')),
              subtitle: Text(ref.tr('download_transactions'), style: theme.textTheme.bodySmall),
              trailing: Icon(Icons.chevron_right, color: theme.textTheme.bodyMedium?.color),
              onTap: () => _showExportSheet(context, ref),
            ),
          ),
          const SizedBox(height: 24),
          Text(ref.tr('account'), style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          // Delete account
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            borderRadius: 14,
            child: ListTile(
              leading: const Icon(Icons.delete_outline, color: AppColors.danger),
              title: Text(ref.tr('delete_account'), style: const TextStyle(color: AppColors.danger)),
              subtitle: Text(ref.tr('permanently_delete'), style: theme.textTheme.bodySmall),
              trailing: Icon(Icons.chevron_right, color: theme.textTheme.bodyMedium?.color),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(ref.tr('delete_account_confirm_title')),
                    content: Text(ref.tr('delete_account_confirm_body')),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: Text(ref.tr('cancel')),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          ref.read(authStateProvider.notifier).logout();
                          context.go('/login');
                        },
                        child: Text(ref.tr('confirm_delete'), style: const TextStyle(color: AppColors.danger)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          // Logout
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                ref.read(authStateProvider.notifier).logout();
                context.go('/login');
              },
              icon: const Icon(Icons.logout),
              label: Text(ref.tr('logout')),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.danger,
                side: const BorderSide(color: AppColors.danger),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              ref.tr('version'),
              style: theme.textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showExportSheet(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        final options = [
          {'key': '1hour', 'label': ref.tr('export_1hour')},
          {'key': '1day', 'label': ref.tr('export_1day')},
          {'key': '1week', 'label': ref.tr('export_1week')},
          {'key': '1month', 'label': ref.tr('export_1month')},
        ];
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(ref.tr('export_title'), style: theme.textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(ref.tr('export_period'),
                style: theme.textTheme.bodySmall?.copyWith(color: theme.textTheme.bodyMedium?.color)),
              const SizedBox(height: 20),
              ...options.map((opt) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      _exportTransactions(context, ref, opt['key']!);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(opt['label']!),
                  ),
                ),
              )),
              const SizedBox(height: 8),
              Center(
                child: Text(ref.tr('export_max_period'),
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _exportTransactions(BuildContext context, WidgetRef ref, String period) {
    final now = DateTime.now();
    late DateTime startDate;

    switch (period) {
      case '1hour':
        startDate = now.subtract(const Duration(hours: 1));
        break;
      case '1day':
        startDate = now.subtract(const Duration(days: 1));
        break;
      case '1week':
        startDate = now.subtract(const Duration(days: 7));
        break;
      case '1month':
        startDate = DateTime(now.year, now.month - 1, now.day);
        break;
      default:
        startDate = now.subtract(const Duration(days: 30));
    }

    final api = ref.read(apiClientProvider);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(ref.tr('download_transactions'))),
    );

    api.get('/transactions/export', queryParameters: {
      'startDate': startDate.toIso8601String(),
      'endDate': now.toIso8601String(),
    }).then((response) {
      final csv = response.data as String;
      if (kIsWeb) {
        final blob = html.Blob([csv], 'text/csv');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute('download', 'nabungo_transactions.csv')
          ..click();
        html.Url.revokeObjectUrl(url);
      }
    }).catchError((e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${ref.tr('failed')}: ${e.toString()}'),
            backgroundColor: AppColors.danger,
          ),
        );
      }
    });
  }
}