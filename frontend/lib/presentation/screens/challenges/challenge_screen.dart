import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../providers/gamification_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/shimmer_loading.dart';
import '../../widgets/gamification/level_badge.dart';
import '../../../core/constants/colors.dart';

class ChallengeScreen extends ConsumerStatefulWidget {
  const ChallengeScreen({super.key});

  @override
  ConsumerState<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends ConsumerState<ChallengeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(gamificationProvider.notifier).loadStatus();
      ref.read(gamificationProvider.notifier).loadChallenges();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gameState = ref.watch(gamificationProvider);
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(gamificationProvider.notifier).loadStatus();
            await ref.read(gamificationProvider.notifier).loadChallenges();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                  child: Text('Challenges', style: theme.textTheme.displayMedium),
                ),
                // Gamification Status
                if (gameState.status != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GlassCard(
                      padding: const EdgeInsets.all(20),
                      borderRadius: 20,
                      child: Row(
                        children: [
                          LevelBadge(level: gameState.status!.level),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Level ${gameState.status!.level}',
                                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(authState.user?.name ?? 'User',
                                  style: theme.textTheme.bodySmall),
                                const SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: gameState.status!.xpForNextLevel > 0
                                        ? (gameState.status!.xp / gameState.status!.xpForNextLevel).clamp(0.0, 1.0)
                                        : 0,
                                    backgroundColor: Colors.white12,
                                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
                                    minHeight: 6,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text('${gameState.status!.xp} / ${gameState.status!.xpForNextLevel} XP',
                                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 11)),
                              ],
                            ),
                          ),
                          // Streak
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF6B6B).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.local_fire_department, color: Color(0xFFFF6B6B), size: 24),
                                Text('${gameState.status!.streak?.currentStreak ?? 0}',
                                  style: const TextStyle(
                                    color: Color(0xFFFF6B6B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Badges
                  if (gameState.status!.badges.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                      child: Text('Badges', style: theme.textTheme.titleMedium),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: gameState.status!.badges.length,
                        itemBuilder: (context, index) {
                          final badge = gameState.status!.badges[index];
                          return Container(
                            width: 80,
                            margin: const EdgeInsets.only(right: 12),
                            child: Column(
                              children: [
                                Container(
                                  width: 48, height: 48,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFD700).withValues(alpha: 0.15),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color(0xFFFFD700), width: 2),
                                  ),
                                  child: const Icon(Icons.emoji_events, color: Color(0xFFFFD700), size: 24),
                                ),
                                const SizedBox(height: 6),
                                Text(badge.name, style: const TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Text('Available Challenges', style: theme.textTheme.titleMedium),
                ),
                if (gameState.isLoading)
                  const TransactionShimmer()
                else if (gameState.challenges.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Center(child: Text('No challenges available', style: theme.textTheme.bodyMedium)),
                  )
                else
                  ...gameState.challenges.map((challenge) {
                    Color difficultyColor;
                    switch (challenge.difficulty) {
                      case 'easy':
                        difficultyColor = AppColors.success;
                        break;
                      case 'medium':
                        difficultyColor = AppColors.warning;
                        break;
                      default:
                        difficultyColor = AppColors.danger;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: GlassCard(
                        padding: const EdgeInsets.all(16),
                        borderRadius: 16,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: difficultyColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                challenge.icon == null
                                    ? Icons.emoji_events
                                    : Icons.emoji_events,
                                color: difficultyColor, size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(challenge.title,
                                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 4),
                                  Text(challenge.description ?? '',
                                    style: theme.textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: difficultyColor.withValues(alpha: 0.15),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(challenge.difficulty[0].toUpperCase() + challenge.difficulty.substring(1),
                                          style: TextStyle(fontSize: 10, color: difficultyColor, fontWeight: FontWeight.w600)),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.stars, size: 14, color: AppColors.warning),
                                      const SizedBox(width: 2),
                                      Text('+${challenge.xpReward} XP', style: const TextStyle(fontSize: 11)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref.read(gamificationProvider.notifier).joinChallenge(challenge.id);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                minimumSize: Size.zero,
                              ),
                              child: const Text('Join', style: TextStyle(fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}
