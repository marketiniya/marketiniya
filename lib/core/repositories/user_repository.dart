import 'package:injectable/injectable.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/models/user.dart';
import 'package:marketinya/core/services/firestore_service.dart';

@injectable
class UserRepository {
  final FirestoreService _firestore;
  User? _currentUser;

  UserRepository(this._firestore);

  User? get currentUser => _currentUser;

  static const String _users = 'users';

  Future<User?> getUser(String userId) async {
    try {
      final doc = await _firestore.getDocument(_users, userId);
      if (!doc.exists) return null;
      return User.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  Future<void> createUser(User user) async {
    try {
      await _firestore.createDocument(_users, user.id, user.toJson());
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await _firestore.updateDocument(_users, user.id, user.toJson());
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<void> setCurrentUser(String userId) async {
    try {
      final user = await getUser(userId);
      if (user != null) {
        _currentUser = user;
      } else {
        Log.error('User not found with ID: $userId');
        throw Exception('User not found');
      }
    } catch (e) {
      Log.error('Failed to set current user: $e');
      throw Exception('Failed to set current user: $e');
    }
  }
}

