import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/repositories/user_repository.dart';
import 'package:marketinya/core/services/firebase_service.dart';

class AuthenticationRepository {
  AuthenticationRepository() {
    // Listen to repository state changes and handle them with _authStateListener.
    _authStateSubscription =
        _firebaseAuth.idTokenChanges().listen(_authStateListener);
  }

  final FirebaseAuth _firebaseAuth = FirebaseService.auth;
  final StreamController<Authentication> _controller = StreamController<Authentication>.broadcast();
  final userRepository = getIt<UserRepository>();

  late final StreamSubscription<User?> _authStateSubscription;

  Timer? _inactivityTimer;
  static const Duration _inactivityDuration = Duration(minutes: 1);

  // Expose a stream of repository statuses.
  Stream<Authentication> get status => _controller.stream;

  // Handle repository state changes.
  void _authStateListener(User? user) {
    if (user != null) {
      _controller.add(Authentication.authenticated);
      Log.info('User authenticated: ${user.email}');
      _startInactivityTimer(); // Start timer when user is authenticated
    } else {
      _controller.add(Authentication.unauthenticated);
      Log.info('User unauthenticated');
      _cancelInactivityTimer(); // Cancel timer when user is unauthenticated
    }
  }

  Future<void> login({required String email, required String password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;
    if (user == null) {
      throw FirebaseAuthException(code: 'error-null-user');
    }

    await userRepository.setCurrentUser(user.uid);
    _controller.add(Authentication.authenticated);
  }

  Future<void> logout() async {
    try {
      _cancelInactivityTimer(); // Cancel timer before logging out
      await _firebaseAuth.signOut();
      _controller.add(Authentication.unauthenticated);
      Log.info('User logged out successfully');
    } catch (error) {
      Log.error('Failed to log out: $error');
      throw Exception('Logout failed');
    }
  }

  // Inactivity timer methods
  void _startInactivityTimer() {
    _cancelInactivityTimer(); // Cancel any existing timer
    _inactivityTimer = Timer(_inactivityDuration, () {
      Log.info('User inactive for ${_inactivityDuration.inMinutes} minutes, logging out automatically');
      logout();
    });
  }

  void _cancelInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = null;
  }

  // Reset the inactivity timer. Call this method whenever user activity is detected.
  void resetInactivityTimer() {
    if (_firebaseAuth.currentUser != null) {
      _startInactivityTimer();
    }
  }

  void dispose() {
    _cancelInactivityTimer(); // Clean up timer
    _authStateSubscription.cancel();
    _controller.close();
  }
}