import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils {
  static String getErrorMessage(FirebaseAuthException error) {

    const errorMessages = {
      'user-not-found': 'No user found for that email.',
      'wrong-password': 'Wrong password provided for that user.',
      'operation-not-allowed': 'Email/password accounts are not enabled.',
      'user-disabled': 'The user account has been disabled.',
      'invalid-credential': 'Invalid credentials. Check email and password.',
      'weak-password': 'The password provided is too weak.',
      'email-already-in-use': 'The account already exists.',
      'invalid-email': 'The email address is not valid.',
      'too-many-requests': 'The number of requests exceeds the maximum allowed.',
      'error-null-user': 'User creation failed.',
      'api-key-not-valid.-please-pass-a-valid-api-key.': 'Unable to authenticate: the provided API key is incorrect.',
    };

    return errorMessages[error.code] ?? error.message ?? 'An unknown error occurred';
  }
}