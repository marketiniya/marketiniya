import 'package:freezed_annotation/freezed_annotation.dart';

part 'secrets_response.freezed.dart';
part 'secrets_response.g.dart';

@freezed
class SecretsResponse with _$SecretsResponse {
  const factory SecretsResponse({
    // PROD WEB Firebase secrets
    @JsonKey(name: 'MARKETINYA_PROD_WEB_FIREBASE_API_KEY')
    required String prodWebFirebaseApiKey,
    @JsonKey(name: 'MARKETINYA_PROD_WEB_FIREBASE_APP_ID')
    required String prodWebFirebaseAppId,
    @JsonKey(name: 'MARKETINYA_PROD_WEB_FIREBASE_AUTH_DOMAIN')
    required String prodWebFirebaseAuthDomain,
    @JsonKey(name: 'MARKETINYA_PROD_WEB_FIREBASE_MESSAGING_SENDER_ID')
    required String prodWebFirebaseMessagingSenderId,
    @JsonKey(name: 'MARKETINYA_PROD_WEB_FIREBASE_PROJECT_ID')
    required String prodWebFirebaseProjectId,
    @JsonKey(name: 'MARKETINYA_PROD_WEB_FIREBASE_STORAGE_BUCKET')
    required String prodWebFirebaseStorageBucket,

    // WIP WEB Firebase secrets
    @JsonKey(name: 'MARKETINYA_WIP_WEB_FIREBASE_API_KEY')
    required String wipWebFirebaseApiKey,
    @JsonKey(name: 'MARKETINYA_WIP_WEB_FIREBASE_APP_ID')
    required String wipWebFirebaseAppId,
    @JsonKey(name: 'MARKETINYA_WIP_WEB_FIREBASE_AUTH_DOMAIN')
    required String wipWebFirebaseAuthDomain,
    @JsonKey(name: 'MARKETINYA_WIP_WEB_FIREBASE_MESSAGING_SENDER_ID')
    required String wipWebFirebaseMessagingSenderId,
    @JsonKey(name: 'MARKETINYA_WIP_WEB_FIREBASE_PROJECT_ID')
    required String wipWebFirebaseProjectId,
    @JsonKey(name: 'MARKETINYA_WIP_WEB_FIREBASE_STORAGE_BUCKET')
    required String wipWebFirebaseStorageBucket,
    @JsonKey(name: 'MARKETINYA_WIP_WEB_FIREBASE_MEASUREMENT_ID')
    required String wipWebFirebaseMeasurementId,
  }) = _SecretsResponse;

  factory SecretsResponse.fromJson(Map<String, dynamic> json) =>
      _$SecretsResponseFromJson(json);
}
