import 'package:get_it/get_it.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/repositories/client_repository.dart';
import 'package:marketinya/core/repositories/contact_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/services/firestore_service.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/services/file_validation_service.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/services/hardcoded_data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencyInjection() async {
  Log.info('Initializing dependency injection with GetIt...');

  final sharedPreferences = await SharedPreferences.getInstance();

  /// Register services
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService.instance);
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);


  /// Register repositories
  getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt<FirestoreService>(), getIt<SharedPreferences>()));
  getIt.registerLazySingleton<ContactRepository>(() => ContactRepository(getIt<FirestoreService>()));
  getIt.registerLazySingleton<ClientRepository>(() => ClientRepository(getIt<FirestoreService>()));

  /// Register file upload services
  getIt.registerLazySingleton<FileValidationService>(() => FileValidationService());
  getIt.registerLazySingleton<HardcodedDataService>(() => HardcodedDataService());

  /// Register file upload BLoC
  getIt.registerFactory<FileUploadBloc>(() => FileUploadBloc(
    getIt<FileValidationService>(),
    getIt<HardcodedDataService>(),
  ));

  Log.info('Dependency injection setup completed successfully!');
}