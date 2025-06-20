import 'package:uuid/uuid.dart';

/// Singleton utility for generating UUIDs across the project
class UuidGenerator {
  UuidGenerator._(); // Private constructor
  
  static final UuidGenerator _instance = UuidGenerator._();
  static UuidGenerator get instance => _instance;
  
  final _uuid = const Uuid();
  
  /// Generate a time-based UUID (v1)
  String v1() => _uuid.v1();
  
  /// Generate a random UUID (v4)
  String v4() => _uuid.v4();
}