import 'package:dio/dio.dart';
import 'package:marketinya/core/models/secrets_response.dart';
import 'package:retrofit/retrofit.dart';

part 'vault_api.g.dart';

@RestApi(baseUrl: 'https://marketiniya-vault-311217329392.europe-central2.run.app')
abstract class VaultApi {
  factory VaultApi(Dio dio) = _VaultApi;

  @GET('/api/vault/secrets')
  Future<SecretsResponse> getSecrets(
    @Header('X-API-Key') String apiKey, {
    @Header('Accept') String accept = 'application/json',
    @Header('Content-Type') String contentType = 'application/json',
  });
}
