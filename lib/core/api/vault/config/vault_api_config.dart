import 'package:dio/dio.dart';
import 'package:marketinya/core/config/log.dart';

// ignore_for_file: do_not_use_environment
class VaultApiConfig {
  static const String _baseUrl =
      'https://marketiniya-vault-311217329392.europe-central2.run.app';

  static const String _apiKey = String.fromEnvironment('VAULT_API_KEY');
  static const Duration _connectTimeout = Duration(seconds: 10);
  static const Duration _receiveTimeout = Duration(seconds: 10);

  static Dio createDioClient() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      headers: _buildHeaders(),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    return dio;
  }

  static Map<String, String> _buildHeaders() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (_apiKey.isNotEmpty) {
      headers['X-API-Key'] = _apiKey;
    } else {
      Log.warning('🚧 VAULT_API_KEY is required but not provided. '
          'Use --dart-define=VAULT_API_KEY=api_key_here');
    }

    return headers;
  }
}
