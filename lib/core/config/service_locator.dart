import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketinya/core/api/vault/config/vault_api_config.dart';
import 'package:marketinya/core/api/vault/vault_api.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/repositories/attachment_repository.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/contact_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/repositories/vault_repository.dart';
import 'package:marketinya/core/services/firebase_storage_service.dart';
import 'package:marketinya/core/services/firestore_service.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/services/file_validation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencyInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register HTTP & APIs clients
  getIt.registerLazySingleton<Dio>(() => VaultApiConfig.createDioClient());
  getIt.registerLazySingleton<VaultApi>(() => VaultApi(getIt<Dio>()));

  // Register services
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService.instance);
  getIt.registerLazySingleton<FirebaseStorageService>(() => FirebaseStorageService());
  getIt.registerLazySingleton<FileValidationService>(() => FileValidationService());

  // Register repositories
  getIt.registerLazySingleton<VaultRepository>(() => VaultRepository(getIt<VaultApi>()));
  getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt<FirestoreService>(), getIt<SharedPreferences>()));
  getIt.registerLazySingleton<ContactRepository>(() => ContactRepository(getIt<FirestoreService>()));
  getIt.registerLazySingleton<ClientRepository>(() => ClientRepository(getIt<FirestoreService>()));
  getIt.registerLazySingleton<AttachmentRepository>(
    () => AttachmentRepository(
      getIt<FirebaseStorageService>(),
      getIt<FirestoreService>(),
    ),
  );

  Log.info('⚙️ Dependency injection setup completed successfully!');
}