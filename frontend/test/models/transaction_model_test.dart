import 'package:flutter_test/flutter_test.dart';
import 'package:nabungo/data/models/transaction_model.dart';

void main() {
  group('TransactionModel', () {
    test('fromJson with snake_case keys', () {
      final json = {
        'id': 1,
        'user_id': 1,
        'type': 'expense',
        'amount': 50000.0,
        'category_id': 1,
        'category_name': 'Makan',
        'category_icon': 'restaurant',
        'category_color': '#FF6B6B',
        'note': 'Nasi goreng',
        'date': '2024-01-15T12:00:00.000',
        'created_at': '2024-01-15T12:00:00.000',
      };

      final model = TransactionModel.fromJson(json);

      expect(model.id, 1);
      expect(model.userId, 1);
      expect(model.type, 'expense');
      expect(model.amount, 50000.0);
      expect(model.categoryId, 1);
      expect(model.categoryName, 'Makan');
      expect(model.categoryIcon, 'restaurant');
      expect(model.categoryColor, '#FF6B6B');
      expect(model.note, 'Nasi goreng');
      expect(model.date, DateTime(2024, 1, 15, 12, 0, 0));
      expect(model.createdAt, DateTime(2024, 1, 15, 12, 0, 0));
    });

    test('toJson produces camelCase keys', () {
      final model = TransactionModel(
        id: 1,
        userId: 1,
        type: 'income',
        amount: 100000.0,
        categoryId: 11,
        categoryName: 'Gaji',
        date: DateTime(2024, 1, 1),
      );

      final json = model.toJson();

      expect(json['id'], 1);
      expect(json['user_id'], 1);
      expect(json['type'], 'income');
      expect(json['amount'], 100000.0);
      expect(json['category_id'], 11);
      expect(json['category_name'], 'Gaji');
    });
  });

  group('SummaryData', () {
    test('fromJson with snake_case keys', () {
      final json = {
        'total_expense': 150000.0,
        'total_income': 500000.0,
        'transaction_count': 10,
      };

      final summary = SummaryData.fromJson(json);

      expect(summary.totalExpense, 150000.0);
      expect(summary.totalIncome, 500000.0);
      expect(summary.transactionCount, 10);
    });

    test('fromJson defaults to 0 for missing fields', () {
      final summary = SummaryData.fromJson({});

      expect(summary.totalExpense, 0);
      expect(summary.totalIncome, 0);
      expect(summary.transactionCount, 0);
    });
  });

  group('AnalyticsData', () {
    test('fromJson with snake_case keys', () {
      final json = {
        'summary': {
          'total_expense': 200000.0,
          'total_income': 1000000.0,
          'transaction_count': 15,
        },
        'categories': [
          {'id': 1, 'name': 'Makan', 'icon': 'restaurant', 'color': '#FF6B6B', 'total': 100000.0, 'count': 5},
        ],
        'weekly_spending': [
          {'week_number': 3, 'total': 50000.0},
        ],
        'daily_totals': [
          {'date': '2024-01-15', 'expense': 50000.0, 'income': 0},
        ],
      };

      final analytics = AnalyticsData.fromJson(json);

      expect(analytics.summary.totalExpense, 200000.0);
      expect(analytics.summary.totalIncome, 1000000.0);
      expect(analytics.summary.transactionCount, 15);
      expect(analytics.categories.length, 1);
      expect(analytics.weeklySpending.length, 1);
      expect(analytics.dailyTotals.length, 1);
    });

    test('defaults to empty lists when fields missing', () {
      final json = {
        'summary': {'total_expense': 0, 'total_income': 0, 'transaction_count': 0},
      };

      final analytics = AnalyticsData.fromJson(json);

      expect(analytics.categories, []);
      expect(analytics.weeklySpending, []);
      expect(analytics.dailyTotals, []);
    });
  });
}
