import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/transaction_model.dart';
import '../../data/datasources/remote/transaction_remote_datasource.dart';
import '../../data/datasources/local/local_storage.dart';

final transactionProvider = StateNotifierProvider.autoDispose<TransactionNotifier, TransactionState>((ref) {
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
  final bool hasMore;
  final int currentPage;

  const TransactionState({
    this.isLoading = false,
    this.transactions = const [],
    this.analytics,
    this.error,
    this.categories = const [],
    this.hasMore = true,
    this.currentPage = 1,
  });

  TransactionState copyWith({
    bool? isLoading,
    List<TransactionModel>? transactions,
    AnalyticsData? analytics,
    String? error,
    List<CategoryModel>? categories,
    bool? hasMore,
    int? currentPage,
  }) {
    return TransactionState(
      isLoading: isLoading ?? this.isLoading,
      transactions: transactions ?? this.transactions,
      analytics: analytics ?? this.analytics,
      error: error,
      categories: categories ?? this.categories,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class TransactionNotifier extends StateNotifier<TransactionState> {
  final TransactionRemoteDataSource _dataSource;

  TransactionNotifier(this._dataSource, LocalStorage localStorage)
      : super(const TransactionState());

  Future<void> loadTransactions({Map<String, dynamic>? params, bool loadMore = false}) async {
    if (loadMore && !state.hasMore) return;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final limit = int.tryParse(params?['limit']?.toString() ?? '') ?? 20;
      final offset = loadMore ? state.currentPage * limit : 0;
      final page = loadMore ? state.currentPage + 1 : 1;
      final queryParams = {
        ...?params,
        'offset': offset.toString(),
        'limit': limit.toString(),
      };
      final transactions = await _dataSource.getAll(params: queryParams);
      state = state.copyWith(
        isLoading: false,
        transactions: loadMore ? [...state.transactions, ...transactions] : transactions,
        hasMore: transactions.length >= limit,
        currentPage: page,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<void> loadAnalytics({String period = 'month'}) async {
    state = state.copyWith(isLoading: true);
    try {
      final analytics = await _dataSource.getAnalytics(period: period);
      state = state.copyWith(isLoading: false, analytics: analytics);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        analytics: const AnalyticsData(summary: SummaryData()),
        error: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<void> createTransaction(Map<String, dynamic> data) async {
    try {
      await _dataSource.create(data);
      await loadTransactions();
      await loadAnalytics();
    } catch (e) {
      state = state.copyWith(error: e.toString().replaceAll('Exception: ', ''));
      rethrow;
    }
  }

  Future<void> deleteTransaction(int id) async {
    try {
      await _dataSource.delete(id);
      await loadTransactions();
      await loadAnalytics();
    } catch (e) {
      state = state.copyWith(error: e.toString().replaceAll('Exception: ', ''));
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
