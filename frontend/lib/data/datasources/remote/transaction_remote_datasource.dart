import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../models/transaction_model.dart';

final transactionRemoteDataSourceProvider = Provider<TransactionRemoteDataSource>((ref) {
  return TransactionRemoteDataSource(ref.read(apiClientProvider));
});

class TransactionRemoteDataSource {
  final ApiClient _client;

  TransactionRemoteDataSource(this._client);

  Future<TransactionModel> create(Map<String, dynamic> data) async {
    final response = await _client.post('/transactions', data: data);
    if (response.data['success'] == true) {
      return TransactionModel.fromJson(response.data['data']);
    }
    throw Exception('Failed to create transaction');
  }

  Future<List<TransactionModel>> getAll({Map<String, dynamic>? params}) async {
    final response = await _client.get('/transactions', queryParameters: params);
    if (response.data['success'] == true) {
      return (response.data['data'] as List)
          .map((e) => TransactionModel.fromJson(e))
          .toList();
    }
    throw Exception('Failed to fetch transactions');
  }

  Future<TransactionModel> getById(int id) async {
    final response = await _client.get('/transactions/$id');
    if (response.data['success'] == true) {
      return TransactionModel.fromJson(response.data['data']);
    }
    throw Exception('Transaction not found');
  }

  Future<TransactionModel> update(int id, Map<String, dynamic> data) async {
    final response = await _client.put('/transactions/$id', data: data);
    if (response.data['success'] == true) {
      return TransactionModel.fromJson(response.data['data']);
    }
    throw Exception('Failed to update transaction');
  }

  Future<void> delete(int id) async {
    await _client.delete('/transactions/$id');
  }

  Future<AnalyticsData> getAnalytics({String period = 'month'}) async {
    final response = await _client.get('/transactions/analytics', queryParameters: {'period': period});
    if (response.data['success'] == true) {
      return AnalyticsData.fromJson(response.data['data']);
    }
    throw Exception('Failed to fetch analytics');
  }
}
