import 'package:flutter/material.dart';

class LevelBadge extends StatelessWidget {
  final int level;
  final double size;

  const LevelBadge({super.key, required this.level, this.size = 56});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFD700).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$level',
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 1)),
            ],
          ),
        ),
      ),
    );
  }
}

class XpProgressBar extends StatelessWidget {
  final int xp;
  final int xpForNextLevel;
  final double height;

  const XpProgressBar({
    super.key,
    required this.xp,
    required this.xpForNextLevel,
    this.height = 8,
  });

  @override
  Widget build(BuildContext context) {
    final progress = xpForNextLevel > 0 ? (xp / xpForNextLevel).clamp(0.0, 1.0) : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white12,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2ED573)),
            minHeight: height,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$xp / $xpForNextLevel XP',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class BadgeCard extends StatelessWidget {
  final String name;
  final String? description;
  final String? icon;
  final bool earned;

  const BadgeCard({
    super.key,
    required this.name,
    this.description,
    this.icon,
    this.earned = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: earned
                  ? const Color(0xFFFFD700).withValues(alpha: 0.15)
                  : Colors.white10,
              shape: BoxShape.circle,
              border: Border.all(
                color: earned ? const Color(0xFFFFD700) : Colors.white24,
                width: 2,
              ),
            ),
            child: Icon(
              earned ? Icons.emoji_events : Icons.lock_outline,
              color: earned ? const Color(0xFFFFD700) : Colors.white38,
              size: 24,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: theme.textTheme.bodySmall?.copyWith(
              color: earned ? null : Colors.white38,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
