import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/common/glass_card.dart';
import '../../../core/constants/colors.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final auth = ref.watch(authStateProvider);
    final isDark = theme.brightness == Brightness.dark;
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
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
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
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
          Text('Preferences', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          // Dark mode toggle
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            borderRadius: 14,
            child: SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: Text(isDark ? 'Dark theme active' : 'Light theme active',
                style: theme.textTheme.bodySmall),
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
              title: const Text('Notifications'),
              subtitle: Text('Manage reminders', style: theme.textTheme.bodySmall),
              trailing: Icon(Icons.chevron_right, color: theme.textTheme.bodyMedium?.color),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 24),
          Text('Data', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          // Export data
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            borderRadius: 14,
            child: ListTile(
              leading: const Icon(Icons.download_outlined),
              title: const Text('Export Data'),
              subtitle: Text('Download your transactions', style: theme.textTheme.bodySmall),
              trailing: Icon(Icons.chevron_right, color: theme.textTheme.bodyMedium?.color),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 24),
          Text('Account', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          // Delete account
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            borderRadius: 14,
            child: ListTile(
              leading: const Icon(Icons.delete_outline, color: AppColors.danger),
              title: const Text('Delete Account', style: TextStyle(color: AppColors.danger)),
              subtitle: Text('Permanently delete your data', style: theme.textTheme.bodySmall),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Delete Account?'),
                    content: const Text('This action cannot be undone. All your data will be permanently deleted.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          ref.read(authStateProvider.notifier).logout();
                          context.go('/login');
                        },
                        child: const Text('Delete', style: TextStyle(color: AppColors.danger)),
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
              label: const Text('Logout'),
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
              'Nabungo v1.0.0',
              style: theme.textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
