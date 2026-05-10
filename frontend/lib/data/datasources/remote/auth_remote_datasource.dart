import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../models/user_model.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource(ref.read(apiClientProvider));
});

class AuthRemoteDataSource {
  final ApiClient _client;

  AuthRemoteDataSource(this._client);

  Future<AuthResponse> login(String email, String password) async {
    final response = await _client.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    if (response.data['success'] == true) {
      final data = response.data['data'];
      _client.setTokens(
        accessToken: data['accessToken'],
        refreshToken: data['refreshToken'],
      );
      return AuthResponse.fromJson(data);
    }
    throw Exception(response.data['error'] ?? 'Login failed');
  }

  Future<AuthResponse> register(String name, String email, String password) async {
    final response = await _client.post('/auth/register', data: {
      'name': name,
      'email': email,
      'password': password,
    });
    if (response.data['success'] == true) {
      final data = response.data['data'];
      _client.setTokens(
        accessToken: data['accessToken'],
        refreshToken: data['refreshToken'],
      );
      return AuthResponse.fromJson(data);
    }
    throw Exception(response.data['error'] ?? 'Registration failed');
  }

  Future<UserModel> getProfile() async {
    final response = await _client.get('/auth/profile');
    if (response.data['success'] == true) {
      return UserModel.fromJson(response.data['data']);
    }
    throw Exception('Failed to get profile');
  }

  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    final response = await _client.put('/auth/profile', data: data);
    if (response.data['success'] == true) {
      return UserModel.fromJson(response.data['data']);
    }
    throw Exception('Failed to update profile');
  }

  Future<void> deleteAccount() async {
    await _client.delete('/auth/account');
  }

  void logout() {
    _client.clearTokens();
  }
}
