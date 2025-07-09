import 'package:dio/dio.dart' hide Headers;
import 'package:marketinya/core/models/secrets_response.dart';
import 'package:retrofit/retrofit.dart';

part 'vault_api.g.dart';

@RestApi()
abstract class VaultApi {
  factory VaultApi(Dio dio) = _VaultApi;

  @GET('/api/vault/secrets')
  Future<SecretsResponse> getSecrets();
}
