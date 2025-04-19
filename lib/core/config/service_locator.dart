import 'package:get_it/get_it.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';
import 'package:marketinya/core/repositories/contact_repository.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/services/firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'log.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencyInjection() async {
  Log.info('Initializing dependency injection with GetIt...');

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  /// Register services
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService.instance);
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);


  /// Register repositories
  getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt<FirestoreService>(), getIt<SharedPreferences>()));
  getIt.registerLazySingleton<ContactRepository>(() => ContactRepository());

  Log.info('Dependency injection setup completed successfully!');
}