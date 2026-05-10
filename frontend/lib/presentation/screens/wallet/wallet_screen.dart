import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../providers/transaction_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/shimmer_loading.dart';
import '../../widgets/common/empty_state.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/extensions.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(() {
      ref.read(transactionProvider.notifier).loadTransactions();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txState = ref.watch(transactionProvider);
    final auth = ref.watch(authStateProvider);
    final isDark = theme.brightness == Brightness.dark;

    final expenses = txState.transactions.where((t) => t.type == 'expense').toList();
    final incomes = txState.transactions.where((t) => t.type == 'income').toList();

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Wallet', style: theme.textTheme.displayMedium),
                    const SizedBox(height: 16),
                    GlassCard(
                      padding: const EdgeInsets.all(20),
                      borderRadius: 20,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Balance', style: theme.textTheme.bodyMedium),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.accent.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('IDR', style: TextStyle(
                                  color: AppColors.accent, fontSize: 12, fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            ((txState.analytics?.summary.totalIncome ?? 0) -
                                (txState.analytics?.summary.totalExpense ?? 0)).rupiah,
                            style: theme.textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: (txState.analytics?.summary.totalIncome ?? 0) >=
                                     (txState.analytics?.summary.totalExpense ?? 0)
                                  ? AppColors.success
                                  : AppColors.danger,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: AppColors.success.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.trending_up, color: AppColors.success, size: 16),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Income', style: theme.textTheme.bodySmall?.copyWith(fontSize: 11)),
                                        Text(
                                          (txState.analytics?.summary.totalIncome ?? 0).compactRupiah,
                                          style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.w600, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: AppColors.danger.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.trending_down, color: AppColors.danger, size: 16),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Expense', style: theme.textTheme.bodySmall?.copyWith(fontSize: 11)),
                                        Text(
                                          (txState.analytics?.summary.totalExpense ?? 0).compactRupiah,
                                          style: const TextStyle(color: AppColors.danger, fontWeight: FontWeight.w600, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyTabDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Expenses'),
                    Tab(text: 'Income'),
                  ],
                  labelColor: theme.colorScheme.primary,
                  unselectedLabelColor: theme.textTheme.bodyMedium?.color,
                  indicatorColor: theme.colorScheme.primary,
                ),
                color: theme.scaffoldBackgroundColor,
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildTransactionList(theme, expenses),
              _buildTransactionList(theme, incomes),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildTransactionList(ThemeData theme, List<dynamic> transactions) {
    if (transactions.isEmpty) {
      return EmptyState(
        title: 'No transactions',
        subtitle: 'Start tracking your finances',
        icon: Icons.receipt_long_outlined,
      );
    }
    return RefreshIndicator(
      onRefresh: () async => ref.read(transactionProvider.notifier).loadTransactions(),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return Container(
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
                  child: Icon(Icons.receipt_outlined,
                    color: tx.categoryColor != null
                        ? Color(int.parse('FF${tx.categoryColor!.replaceAll('#', '')}', radix: 16))
                        : AppColors.primary,
                    size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tx.note ?? tx.categoryName ?? 'Transaction',
                        style: theme.textTheme.titleMedium),
                      const SizedBox(height: 2),
                      Text('${tx.categoryName ?? ''} \u2022 ${tx.date.dayMonth}',
                        style: theme.textTheme.bodySmall),
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
          );
        },
      ),
    );
  }
}

class _StickyTabDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;

  _StickyTabDelegate(this.tabBar, {required this.color});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: color, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_StickyTabDelegate oldDelegate) => false;
}
