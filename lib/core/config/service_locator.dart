import 'package:get_it/get_it.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/services/firestore_service.dart';

import 'log.dart';

final GetIt getIt = GetIt.instance;

void initializeDependencyInjection() {
  Log.info('Initializing dependency injection with GetIt...');

  /// Register services
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService.instance);

  /// Register repositories
  getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt<FirestoreService>()));

  Log.info('Dependency injection setup completed successfully!');
}