import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/services/firebase_service.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseService.auth;

  final StreamController<Authentication> _controller = StreamController<Authentication>.broadcast();
  late final StreamSubscription<User?> _authStateSubscription;
  final userRepository = getIt<UserRepository>();

  AuthenticationRepository() {
    // Listen to repository state changes and handle them with _authStateListener.
    _authStateSubscription =
        _firebaseAuth.authStateChanges().listen(_authStateListener);
  }

  // Expose a stream of repository statuses.
  Stream<Authentication> get status => _controller.stream;

  // Handle repository state changes.
  void _authStateListener(User? user) {
    if (user != null) {
      _controller.add(Authentication.authenticated);
      Log.info('User authenticated: ${user.email}');
    } else {
      _controller.add(Authentication.unauthenticated);
      Log.info('User unauthenticated');
    }
  }

  Future<void> login({required String email, required String password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;
    if (user == null) {
      throw FirebaseAuthException(code: 'error-null-user');
    }

    await userRepository.setCurrentUser(user.uid);
    _controller.add(Authentication.authenticated);
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      _controller.add(Authentication.unauthenticated);
      Log.info('User logged out successfully');
    } catch (error) {
      Log.error('Failed to log out: $error');
      throw Exception('Logout failed');
    }
  }

  void dispose() {
    _authStateSubscription.cancel();
    _controller.close();
  }
}