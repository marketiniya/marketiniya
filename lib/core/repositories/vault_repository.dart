import 'package:marketinya/core/api/vault/vault_api.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/models/secrets_response.dart';

class VaultRepository {
  VaultRepository(this._vaultApi);

  final VaultApi _vaultApi;

  SecretsResponse? _cachedSecrets;

  SecretsResponse? get secrets => _cachedSecrets;

  Future<void> loadSecrets() async {
    try {
      _cachedSecrets = await _vaultApi.getSecrets();
      Log.info('🔐 Secrets loaded successfully from vault.');
    } catch (e) {
      Log.error('❌ Failed to load secrets from vault: $e');
      _cachedSecrets = null;
    }
  }
}
