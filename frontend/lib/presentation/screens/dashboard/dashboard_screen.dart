import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../providers/auth_provider.dart';
import '../../providers/transaction_provider.dart';
import '../../providers/insight_provider.dart';
import '../../providers/gamification_provider.dart';
import '../../widgets/common/shimmer_loading.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/charts/bar_chart_widget.dart';
import '../../widgets/gamification/level_badge.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/extensions.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    Future.microtask(() {
      ref.read(transactionProvider.notifier).loadTransactions(params: {'limit': '5'});
      ref.read(transactionProvider.notifier).loadAnalytics();
      ref.read(insightProvider.notifier).loadInsights();
      ref.read(gamificationProvider.notifier).loadStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = ref.watch(authStateProvider);
    final txState = ref.watch(transactionProvider);
    final insightState = ref.watch(insightProvider);
    final gameState = ref.watch(gamificationProvider);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => _loadData(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(theme, auth, gameState, isDark),
              // Quick Stats
              if (txState.analytics != null)
                _buildQuickStats(theme, txState.analytics!),
              // Insights Carousel
              if (insightState.insights.isNotEmpty)
                _buildInsights(theme, insightState.insights),
              // Spending Chart
              if (txState.analytics != null)
                _buildChartSection(theme, txState.analytics!),
              // Recent Transactions
              _buildRecentTransactions(theme, txState),
              const SizedBox(height: 24),
            ],
          ).animate().fadeIn(duration: 400.ms),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, AuthState auth, GamificationState game, bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF1C2333), const Color(0xFF0D1117)]
              : AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${auth.user?.name ?? 'User'}!',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateTime.now().fullDate,
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  if (game.status != null)
                    LevelBadge(level: game.status!.level, size: 40),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => context.push('/settings'),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      child: const Icon(Icons.settings, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: GlassCard(
                  padding: const EdgeInsets.all(16),
                  borderRadius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.trending_down, color: AppColors.danger, size: 18),
                          const SizedBox(width: 6),
                          Text('Expense', style: TextStyle(
                            color: Colors.white70, fontSize: 12,
                          )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        txState.analytics?.summary.totalExpense.rupiah ?? 'Rp 0',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GlassCard(
                  padding: const EdgeInsets.all(16),
                  borderRadius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.trending_up, color: AppColors.success, size: 18),
                          const SizedBox(width: 6),
                          Text('Income', style: TextStyle(
                            color: Colors.white70, fontSize: 12,
                          )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        txState.analytics?.summary.totalIncome.rupiah ?? 'Rp 0',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(ThemeData theme, AnalyticsData analytics) {
    final balance = analytics.summary.totalIncome - analytics.summary.totalExpense;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        borderRadius: 16,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: balance >= 0
                    ? AppColors.success.withOpacity(0.1)
                    : AppColors.danger.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                balance >= 0 ? Icons.savings_outlined : Icons.warning_amber_outlined,
                color: balance >= 0 ? AppColors.success : AppColors.danger,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sisa Uang', style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Text(
                    balance.rupiah,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: balance >= 0 ? AppColors.success : AppColors.danger,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsights(ThemeData theme, List<dynamic> insights) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: insights.length,
        itemBuilder: (context, index) {
          final insight = insights[index];
          Color bgColor;
          IconData icon;
          switch (insight.type) {
            case 'success':
              bgColor = AppColors.success;
              icon = Icons.check_circle_outline;
              break;
            case 'warning':
              bgColor = AppColors.warning;
              icon = Icons.warning_amber_outlined;
              break;
            case 'danger':
              bgColor = AppColors.danger;
              icon = Icons.error_outline;
              break;
            default:
              bgColor = AppColors.info;
              icon = Icons.info_outline;
          }
          return Container(
            width: 280,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: bgColor.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Icon(icon, color: bgColor, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(insight.title, style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 13,
                      )),
                      const SizedBox(height: 2),
                      Text(insight.message, style: TextStyle(
                        fontSize: 11, color: theme.textTheme.bodyMedium?.color,
                      ), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChartSection(ThemeData theme, AnalyticsData analytics) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        borderRadius: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Weekly Spending', style: theme.textTheme.titleMedium),
                Text('This week', style: theme.textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 16),
            if (analytics.dailyTotals.isEmpty)
              SizedBox(
                height: 180,
                child: Center(
                  child: Text('No data this week', style: theme.textTheme.bodyMedium),
                ),
              )
            else
              SpendingBarChart(
                weeklyData: analytics.dailyTotals
                    .map((d) => d.expense)
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(ThemeData theme, TransactionState txState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Transactions', style: theme.textTheme.titleMedium),
              TextButton(
                onPressed: () => context.go('/wallet'),
                child: const Text('See All'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (txState.isLoading)
            const ShimmerLoading(height: 300)
          else if (txState.transactions.isEmpty)
            EmptyState(
              title: 'No transactions yet',
              subtitle: 'Tap + to add your first transaction',
              icon: Icons.receipt_long_outlined,
            )
          else
            ...txState.transactions.map((tx) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.cardTheme.color,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: (tx.categoryColor != null
                          ? Color(int.parse('FF${tx.categoryColor!.replaceAll('#', '')}', radix: 16))
                          : AppColors.primary).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.receipt_outlined,
                      color: tx.categoryColor != null
                          ? Color(int.parse('FF${tx.categoryColor!.replaceAll('#', '')}', radix: 16))
                          : AppColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.note ?? tx.categoryName ?? 'Transaction',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${tx.categoryName ?? ''} \u2022 ${tx.date.dayMonth}',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    tx.type == 'income'
                        ? '+${tx.amount.compactRupiah}'
                        : '-${tx.amount.compactRupiah}',
                    style: TextStyle(
                      color: tx.type == 'income' ? AppColors.success : AppColors.danger,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )),
        ],
      ),
    );
  }
}
