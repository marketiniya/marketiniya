import 'package:marketinya/core/api/vault/vault_api.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/models/secrets_response.dart';

class VaultRepository {
  VaultRepository(this._vaultApi);

  final VaultApi _vaultApi;

  static SecretsResponse? _secrets;

  static SecretsResponse? get secrets => _secrets;

  Future<void> loadSecrets() async {
    try {
      _secrets = await _vaultApi.getSecrets();
      Log.info('🔐 Secrets loaded successfully from vault.');
    } catch (e) {
      Log.error('❌ Failed to load secrets from vault: $e');
    }
  }
}
