import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';
import '../../data/models/user_model.dart';
import '../../data/datasources/remote/auth_remote_datasource.dart';
import '../../data/datasources/local/local_storage.dart';

final localStorageProvider = Provider<LocalStorage>((ref) => LocalStorage());

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.read(authRemoteDataSourceProvider),
    ref.read(apiClientProvider),
    ref.read(localStorageProvider),
  );
});

class AuthState {
  final bool isLoading;
  final UserModel? user;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    bool? isLoading,
    UserModel? user,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRemoteDataSource _dataSource;
  final ApiClient _apiClient;
  final LocalStorage _localStorage;

  AuthNotifier(this._dataSource, this._apiClient, this._localStorage)
      : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _dataSource.login(email, password);
      await _localStorage.setTokens(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
      );
      await _localStorage.saveMap('user', result.user.toJson());
      state = state.copyWith(
        isLoading: false,
        user: result.user,
        isAuthenticated: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<void> register(String name, String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _dataSource.register(name, email, password);
      await _localStorage.setTokens(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
      );
      await _localStorage.saveMap('user', result.user.toJson());
      state = state.copyWith(
        isLoading: false,
        user: result.user,
        isAuthenticated: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<void> checkAuth() async {
    final token = _localStorage.getAccessToken();
    if (token != null) {
      _apiClient.setTokens(accessToken: token);
      try {
        final user = await _dataSource.getProfile();
        state = state.copyWith(user: user, isAuthenticated: true);
      } catch (_) {
        await _localStorage.clearAuth();
        state = const AuthState();
      }
    }
  }

  Future<void> logout() async {
    _dataSource.logout();
    await _localStorage.clearAuth();
    state = const AuthState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
