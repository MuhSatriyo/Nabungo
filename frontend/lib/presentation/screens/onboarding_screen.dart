import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/localization/translations_extension.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingItem> _items = [
    _OnboardingItem(
      icon: Icons.account_balance_wallet_outlined,
      titleKey: 'onboarding_title_1',
      descKey: 'onboarding_desc_1',
      color: const Color(0xFF2ED573),
    ),
    _OnboardingItem(
      icon: Icons.auto_graph_outlined,
      titleKey: 'onboarding_title_2',
      descKey: 'onboarding_desc_2',
      color: const Color(0xFF54A0FF),
    ),
    _OnboardingItem(
      icon: Icons.emoji_events_outlined,
      titleKey: 'onboarding_title_3',
      descKey: 'onboarding_desc_3',
      color: const Color(0xFFFFD700),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nabungo', style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: Text(ref.tr('skip'), style: TextStyle(color: theme.colorScheme.primary)),
                  ),
                ],
              ),
            ),
            // Pages
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: item.color.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(item.icon, size: 72, color: item.color),
                        ).animate().fadeIn(
                          duration: 600.ms,
                          delay: (200 * index).ms,
                        ).slideY(begin: 0.3),
                        const SizedBox(height: 48),
                        Text(
                          ref.tr(item.titleKey),
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(
                          duration: 600.ms,
                          delay: (400 * index).ms,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          ref.tr(item.descKey),
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.textTheme.bodyMedium?.color,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(
                          duration: 600.ms,
                          delay: (600 * index).ms,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Dots & Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _items.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == i ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == i
                              ? theme.colorScheme.primary
                              : theme.colorScheme.primary.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _items.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          context.go('/login');
                        }
                      },
                      child: Text(_currentPage == _items.length - 1
                          ? ref.tr('get_started')
                          : ref.tr('next')),
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
}

class _OnboardingItem {
  final IconData icon;
  final String titleKey;
  final String descKey;
  final Color color;

  _OnboardingItem({
    required this.icon,
    required this.titleKey,
    required this.descKey,
    required this.color,
  });
}
