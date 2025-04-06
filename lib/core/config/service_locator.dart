import 'package:get_it/get_it.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';

import 'log.dart';

final GetIt getIt = GetIt.instance;

void initializeDependencyInjection() {
  Log.info('Initializing dependency injection with GetIt...');

  /// Register repositories
  getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());

  /// Register services

  Log.info('Dependency injection setup completed successfully!');
}
