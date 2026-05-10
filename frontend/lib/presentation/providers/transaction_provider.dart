import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/transaction_model.dart';
import '../../data/datasources/remote/transaction_remote_datasource.dart';
import '../../data/datasources/local/local_storage.dart';

final transactionProvider = StateNotifierProvider<TransactionNotifier, TransactionState>((ref) {
  return TransactionNotifier(
    ref.read(transactionRemoteDataSourceProvider),
    ref.read(localStorageProvider),
  );
});

class TransactionState {
  final bool isLoading;
  final List<TransactionModel> transactions;
  final AnalyticsData? analytics;
  final String? error;
  final List<CategoryModel> categories;

  const TransactionState({
    this.isLoading = false,
    this.transactions = const [],
    this.analytics,
    this.error,
    this.categories = const [],
  });

  TransactionState copyWith({
    bool? isLoading,
    List<TransactionModel>? transactions,
    AnalyticsData? analytics,
    String? error,
    List<CategoryModel>? categories,
  }) {
    return TransactionState(
      isLoading: isLoading ?? this.isLoading,
      transactions: transactions ?? this.transactions,
      analytics: analytics ?? this.analytics,
      error: error,
      categories: categories ?? this.categories,
    );
  }
}

class TransactionNotifier extends StateNotifier<TransactionState> {
  final TransactionRemoteDataSource _dataSource;

  TransactionNotifier(this._dataSource, LocalStorage localStorage)
      : super(const TransactionState());

  Future<void> loadTransactions({Map<String, dynamic>? params}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final transactions = await _dataSource.getAll(params: params);
      state = state.copyWith(isLoading: false, transactions: transactions);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        transactions: [],
        error: e.toString(),
      );
    }
  }

  Future<void> loadAnalytics({String period = 'month'}) async {
    try {
      final analytics = await _dataSource.getAnalytics(period: period);
      state = state.copyWith(analytics: analytics);
    } catch (_) {
      state = state.copyWith(
        analytics: const AnalyticsData(summary: SummaryData()),
      );
    }
  }

  Future<void> createTransaction(Map<String, dynamic> data) async {
    try {
      await _dataSource.create(data);
      await loadTransactions();
      await loadAnalytics();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> deleteTransaction(int id) async {
    try {
      await _dataSource.delete(id);
      await loadTransactions();
      await loadAnalytics();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
