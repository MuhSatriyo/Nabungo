import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerLoading({
    super.key,
    this.width = double.infinity,
    this.height = 20,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.white12 : Colors.grey[300]!,
      highlightColor: isDark ? Colors.white24 : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isDark ? Colors.white12 : Colors.grey[300],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const ShimmerLoading(height: 180, borderRadius: 20),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: ShimmerLoading(height: 100, borderRadius: 16)),
              SizedBox(width: 12),
              Expanded(child: ShimmerLoading(height: 100, borderRadius: 16)),
            ],
          ),
          const SizedBox(height: 16),
          const ShimmerLoading(height: 200, borderRadius: 20),
        ],
      ),
    );
  }
}

class TransactionShimmer extends StatelessWidget {
  const TransactionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              const ShimmerLoading(width: 48, height: 48, borderRadius: 16),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ShimmerLoading(width: 120, height: 14),
                    SizedBox(height: 6),
                    ShimmerLoading(width: 80, height: 12),
                  ],
                ),
              ),
              const ShimmerLoading(width: 70, height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
