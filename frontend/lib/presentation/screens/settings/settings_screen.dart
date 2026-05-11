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

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
    'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
  ];

  void _showExportSheet(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final now = DateTime.now();

    int fromDay = now.day;
    int fromMonth = now.month;
    int fromYear = now.year;
    int fromHour = now.hour;
    int toDay = now.day;
    int toMonth = now.month;
    int toYear = now.year;
    int toHour = now.hour;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setSheetState) {
            final maxDayFrom = DateTime(fromYear, fromMonth + 1, 0).day;
            if (fromDay > maxDayFrom) fromDay = maxDayFrom;
            final maxDayTo = DateTime(toYear, toMonth + 1, 0).day;
            if (toDay > maxDayTo) toDay = maxDayTo;

            return Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 24, MediaQuery.of(ctx).viewInsets.bottom + 32),
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
                  const SizedBox(height: 20),
                  // FROM row
                  Text(ref.tr('export_from'), style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _DateDropdown(label: ref.tr('export_date'), value: fromDay, max: maxDayFrom, onChanged: (v) => setSheetState(() => fromDay = v)),
                      const SizedBox(width: 8),
                      _DateDropdown(label: ref.tr('export_month'), value: fromMonth, max: 12, display: (v) => _months[v - 1], onChanged: (v) => setSheetState(() => fromMonth = v)),
                      const SizedBox(width: 8),
                      _DateDropdown(label: ref.tr('export_year'), value: fromYear, max: now.year, min: now.year - 2, onChanged: (v) => setSheetState(() => fromYear = v)),
                      const SizedBox(width: 8),
                      _DateDropdown(label: ref.tr('export_hour'), value: fromHour, max: 23, display: (v) => v.toString().padLeft(2, '0'), onChanged: (v) => setSheetState(() => fromHour = v)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // TO row
                  Text(ref.tr('export_to'), style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _DateDropdown(label: ref.tr('export_date'), value: toDay, max: maxDayTo, onChanged: (v) => setSheetState(() => toDay = v)),
                      const SizedBox(width: 8),
                      _DateDropdown(label: ref.tr('export_month'), value: toMonth, max: 12, display: (v) => _months[v - 1], onChanged: (v) => setSheetState(() => toMonth = v)),
                      const SizedBox(width: 8),
                      _DateDropdown(label: ref.tr('export_year'), value: toYear, max: now.year, min: now.year - 2, onChanged: (v) => setSheetState(() => toYear = v)),
                      const SizedBox(width: 8),
                      _DateDropdown(label: ref.tr('export_hour'), value: toHour, max: 23, display: (v) => v.toString().padLeft(2, '0'), onChanged: (v) => setSheetState(() => toHour = v)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        final start = DateTime(fromYear, fromMonth, fromDay, fromHour);
                        final end = DateTime(toYear, toMonth, toDay, toHour);
                        _exportTransactions(context, ref, start, end);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(ref.tr('export_btn')),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _exportTransactions(BuildContext context, WidgetRef ref, DateTime startDate, DateTime endDate) {
    final api = ref.read(apiClientProvider);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(ref.tr('download_transactions'))),
    );

    api.get('/transactions/export', queryParameters: {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
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

class _DateDropdown extends StatelessWidget {
  final String label;
  final int value;
  final int max;
  final int min;
  final String Function(int)? display;
  final ValueChanged<int> onChanged;

  const _DateDropdown({
    required this.label,
    required this.value,
    required this.max,
    this.min = 1,
    this.display,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: value.clamp(min, max),
                isDense: true,
                style: const TextStyle(fontSize: 12),
                items: List.generate(max - min + 1, (i) => min + i).map((v) {
                  return DropdownMenuItem(
                    value: v,
                    child: Text(display != null ? display!(v) : v.toString(), overflow: TextOverflow.visible),
                  );
                }).toList(),
                onChanged: (v) {
                  if (v != null) onChanged(v);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}