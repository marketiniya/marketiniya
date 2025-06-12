import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketinya/core/enums/authentication.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';

/// A ChangeNotifier that listens to authentication status changes
/// and notifies listeners when the status changes.
class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this._authRepository) {
    _authStatusSubscription = _authRepository.status.listen((status) {
      if (_authStatus != status) {
        _authStatus = status;
        notifyListeners();
      }
    });
  }

  final AuthenticationRepository _authRepository;
  late final StreamSubscription<Authentication> _authStatusSubscription;
  Authentication _authStatus = Authentication.unknown;

  bool get isAuthenticated => _authStatus == Authentication.authenticated;

  @override
  void dispose() {
    _authStatusSubscription.cancel();
    super.dispose();
  }
}