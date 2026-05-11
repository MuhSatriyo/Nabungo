import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../providers/transaction_provider.dart';
import '../../widgets/charts/pie_chart_widget.dart';
import '../../widgets/charts/bar_chart_widget.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/shimmer_loading.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/extensions.dart';

class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({super.key});

  @override
  ConsumerState<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  String _period = 'month';

  @override
  void initState() {
    super.initState();
    _loadAnalytics();
  }

  void _loadAnalytics() {
    Future.microtask(() {
      ref.read(transactionProvider.notifier).loadAnalytics(period: _period);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txState = ref.watch(transactionProvider);
    final analytics = txState.analytics;

    ref.listen(transactionProvider, (prev, next) {
      if (next.error != null && next.error != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: AppColors.danger),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => _loadAnalytics(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Statistics', style: theme.textTheme.displayMedium),
                      SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(value: 'week', label: Text('Week')),
                          ButtonSegment(value: 'month', label: Text('Month')),
                          ButtonSegment(value: 'year', label: Text('Year')),
                        ],
                        selected: {_period},
                        onSelectionChanged: (v) {
                          setState(() => _period = v.first);
                          _loadAnalytics();
                        },
                      ),
                    ],
                  ),
                ),
                if (analytics == null)
                  const DashboardShimmer()
                else ...[
                  // Summary cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: GlassCard(
                            padding: const EdgeInsets.all(16),
                            borderRadius: 14,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Expense', style: theme.textTheme.bodySmall),
                                const SizedBox(height: 8),
                                Text(
                                  analytics.summary.totalExpense.rupiah,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: AppColors.danger,
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
                            borderRadius: 14,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Income', style: theme.textTheme.bodySmall),
                                const SizedBox(height: 8),
                                Text(
                                  analytics.summary.totalIncome.rupiah,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: AppColors.success,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Transaction count
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      borderRadius: 14,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.info.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.receipt_long, color: AppColors.info, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Text('Total Transactions', style: theme.textTheme.bodyMedium),
                          const Spacer(),
                          Text(
                            '${analytics.summary.transactionCount}',
                            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Bar chart
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      borderRadius: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Daily Spending', style: theme.textTheme.titleMedium),
                          const SizedBox(height: 16),
                          if (analytics.dailyTotals.isEmpty)
                            SizedBox(
                              height: 180,
                              child: Center(child: Text('No data', style: theme.textTheme.bodyMedium)),
                            )
                          else
                            SpendingBarChart(
                              weeklyData: analytics.dailyTotals.map((d) => d.expense).toList(),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Pie chart
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      borderRadius: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Spending by Category', style: theme.textTheme.titleMedium),
                          const SizedBox(height: 16),
                          if (analytics.categories.isEmpty)
                            SizedBox(
                              height: 200,
                              child: Center(child: Text('No data', style: theme.textTheme.bodyMedium)),
                            )
                          else
                            CategoryPieChart(categories: analytics.categories),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}
