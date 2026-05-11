import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';
import '../../data/models/insight_model.dart';

final insightProvider = StateNotifierProvider.autoDispose<InsightNotifier, InsightState>((ref) {
  return InsightNotifier(ref.read(apiClientProvider));
});

class InsightState {
  final bool isLoading;
  final List<InsightModel> insights;
  final String? error;

  const InsightState({
    this.isLoading = false,
    this.insights = const [],
    this.error,
  });

  InsightState copyWith({
    bool? isLoading,
    List<InsightModel>? insights,
    String? error,
  }) {
    return InsightState(
      isLoading: isLoading ?? this.isLoading,
      insights: insights ?? this.insights,
      error: error,
    );
  }
}

class InsightNotifier extends StateNotifier<InsightState> {
  final ApiClient _client;

  InsightNotifier(this._client) : super(const InsightState());

  Future<void> loadInsights() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _client.get('/insights');
      if (response.data['success'] == true) {
        final insights = (response.data['data'] as List)
            .map((e) => InsightModel.fromJson(e))
            .toList();
        state = state.copyWith(isLoading: false, insights: insights);
      } else {
        state = state.copyWith(isLoading: false, error: 'Failed to load insights');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
