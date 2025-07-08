import 'package:dio/dio.dart';
import 'package:marketinya/core/api/vault_api.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/models/secrets_response.dart';

// ignore_for_file: do_not_use_environment
class VaultRepository {
  VaultRepository() : _vaultApi = VaultApi(Dio());

  final VaultApi _vaultApi;

  static const String _apiKey = String.fromEnvironment('VAULT_API_KEY');

  static SecretsResponse? _secrets;

  static SecretsResponse? get secrets => _secrets;

  Future<void> loadSecrets() async {
    if (_apiKey.isEmpty) {
      Log.warning('🚧 VAULT_API_KEY not provided. Use --dart-define=VAULT_API_KEY');
    }

    try {
      _secrets = await _vaultApi.getSecrets(_apiKey);
      Log.info('🔐 Secrets loaded successfully from vault.');
    } catch (e) {
      Log.error('❌ Failed to load secrets from vault: $e');
    }
  }
}
