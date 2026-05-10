import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constants/colors.dart';
import '../../../data/models/transaction_model.dart';

class CategoryPieChart extends StatelessWidget {
  final List<CategorySummary> categories;
  final double height;

  const CategoryPieChart({
    super.key,
    required this.categories,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (categories.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text('No data', style: theme.textTheme.bodyMedium),
        ),
      );
    }

    final total = categories.fold<double>(0, (sum, c) => sum + c.total);
    if (total == 0) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text('No expenses', style: theme.textTheme.bodyMedium),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: Row(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: categories.map((cat) {
                  final color = _parseColor(cat.color);
                  return PieChartSectionData(
                    value: cat.total,
                    color: color,
                    radius: 50,
                    title: '${(cat.total / total * 100).toStringAsFixed(0)}%',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: categories.take(5).map((cat) {
              final color = _parseColor(cat.color);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10, height: 10,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      cat.name,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Color _parseColor(String colorStr) {
    try {
      final hex = colorStr.replaceAll('#', '');
      if (hex.length == 6) {
        return Color(int.parse('FF$hex', radix: 16));
      }
    } catch (_) {}
    return AppColors.primary;
  }
}
