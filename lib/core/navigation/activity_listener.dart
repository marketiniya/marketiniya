import 'package:flutter/material.dart';
import 'package:marketinya/core/config/service_locator.dart';
import 'package:marketinya/core/repositories/authentication_repository.dart';

/// A wrapper widget that listens to user activity and resets the inactivity timer.
///
/// This widget should wrap the entire app to detect any user interaction
/// and prevent automatic logout during active usage.
class ActivityListener extends StatelessWidget {
  const ActivityListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final authRepository = getIt<AuthenticationRepository>();
    
    return Listener(
      // Listen to all pointer events (taps, scrolls, mouse moves, etc.)
      onPointerDown: (_) => authRepository.resetInactivityTimer(),
      onPointerMove: (_) => authRepository.resetInactivityTimer(),
      onPointerUp: (_) => authRepository.resetInactivityTimer(),
      // Ensure the listener covers the entire screen
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
