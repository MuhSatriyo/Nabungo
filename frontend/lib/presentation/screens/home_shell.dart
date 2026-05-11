import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/localization/translations_extension.dart';

class HomeShell extends ConsumerStatefulWidget {
  final Widget child;

  const HomeShell({super.key, required this.child});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int _currentIndex = 0;

  final _pages = ['/dashboard', '/statistics', '/challenges', '/wallet'];
  final _navIcons = [
    Icons.dashboard_outlined,
    Icons.bar_chart_outlined,
    Icons.emoji_events_outlined,
    Icons.account_balance_wallet_outlined,
  ];
  final _navActiveIcons = [
    Icons.dashboard,
    Icons.bar_chart,
    Icons.emoji_events,
    Icons.account_balance_wallet,
  ];
  final _navLabels = ['nav_home', 'nav_stats', 'nav_challenge', 'nav_wallet'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1C2333) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (i) {
              final selected = _currentIndex == i;
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() => _currentIndex = i);
                    context.go(_pages[i]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          selected ? _navActiveIcons[i] : _navIcons[i],
                          color: selected
                              ? theme.colorScheme.primary
                              : (isDark ? Colors.white38 : Colors.black38),
                          size: 24,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          ref.tr(_navLabels[i]),
                          style: TextStyle(
                            fontSize: 11,
                            color: selected
                                ? theme.colorScheme.primary
                                : (isDark ? Colors.white38 : Colors.black38),
                            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-transaction'),
        child: const Icon(Icons.add, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
