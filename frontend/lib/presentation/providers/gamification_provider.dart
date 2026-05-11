import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';
import '../../data/models/challenge_model.dart';

final gamificationProvider = StateNotifierProvider.autoDispose<GamificationNotifier, GamificationState>((ref) {
  return GamificationNotifier(ref.read(apiClientProvider));
});

class GamificationState {
  final bool isLoading;
  final GamificationStatus? status;
  final List<ChallengeModel> challenges;
  final String? error;

  const GamificationState({
    this.isLoading = false,
    this.status,
    this.challenges = const [],
    this.error,
  });

  GamificationState copyWith({
    bool? isLoading,
    GamificationStatus? status,
    List<ChallengeModel>? challenges,
    String? error,
  }) {
    return GamificationState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      challenges: challenges ?? this.challenges,
      error: error,
    );
  }
}

class GamificationNotifier extends StateNotifier<GamificationState> {
  final ApiClient _client;
  bool _disposed = false;

  GamificationNotifier(this._client) : super(const GamificationState());

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> loadStatus() async {
    if (_disposed) return;
    state = state.copyWith(isLoading: true);
    try {
      final response = await _client.get('/challenges/gamification');
      if (!_disposed) {
        if (response.data['success'] == true) {
          state = state.copyWith(
            isLoading: false,
            status: GamificationStatus.fromJson(response.data['data']),
          );
        } else {
          state = state.copyWith(isLoading: false, error: 'Failed to load gamification status');
        }
      }
    } catch (e) {
      if (!_disposed) {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }
  }

  Future<void> loadChallenges() async {
    if (_disposed) return;
    try {
      final response = await _client.get('/challenges');
      if (!_disposed) {
        if (response.data['success'] == true) {
          final challenges = (response.data['data'] as List)
              .map((e) => ChallengeModel.fromJson(e))
              .toList();
          state = state.copyWith(challenges: challenges);
        } else {
          state = state.copyWith(error: 'Failed to load challenges');
        }
      }
    } catch (e) {
      if (!_disposed) {
        state = state.copyWith(error: e.toString());
      }
    }
  }

  Future<void> joinChallenge(int challengeId) async {
    try {
      await _client.post('/challenges/$challengeId/join');
      if (_disposed) return;
      await loadStatus();
      if (_disposed) return;
      await loadChallenges();
    } catch (e) {
      if (!_disposed) {
        state = state.copyWith(error: e.toString());
      }
    }
  }

  Future<void> claimChallenge(int challengeId) async {
    try {
      state = state.copyWith(isLoading: true);
      await _client.post('/challenges/$challengeId/claim');
      if (_disposed) return;
      await loadStatus();
      if (_disposed) return;
      await loadChallenges();
    } catch (e) {
      if (!_disposed) {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }
  }

  void clearError() {
    if (!_disposed) {
      state = state.copyWith(error: null);
    }
  }
}
