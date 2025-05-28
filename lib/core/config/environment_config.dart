import 'package:marketinya/core/config/firebase_options.dart';
import 'package:marketinya/core/config/log.dart';

/// Simple environment configuration for WIP/PROD Firebase setup
class EnvironmentConfig {
  static const String _environmentKey = 'environment';
  static const String _env = String.fromEnvironment(_environmentKey, defaultValue: 'wip');

  /// Current environment - respects dart-define in all build modes
  static FirebaseEnvironment get currentEnvironment {
    switch (_env.toLowerCase()) {
      case 'prod':
      case 'production':
        return FirebaseEnvironment.prod;
      default:
        return FirebaseEnvironment.wip;
    }
  }

  /// Initialize Firebase with the correct environment
  static void initializeEnvironment() {
    final environment = currentEnvironment;
    DefaultFirebaseOptions.setEnvironment(environment);

    Log.info('🔥 Firebase Environment: ${environment.name.toUpperCase()}');
  }

  static bool get isWip => currentEnvironment == FirebaseEnvironment.wip;

  static bool get isProd => currentEnvironment == FirebaseEnvironment.prod;
}
