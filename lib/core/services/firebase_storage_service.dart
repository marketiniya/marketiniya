import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:marketinya/core/config/log.dart';

class FirebaseStorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static const String _baseAttachmentsPath = 'attachments';

  /// Upload file to Firebase Storage and return download URL
  Future<String> uploadFile({
    required String path,
    required Uint8List data,
    required String contentType,
  }) async {
    try {
      final ref = _storage.ref().child(path);
      final metadata = SettableMetadata(contentType: contentType);
      
      final uploadTask = ref.putData(data, metadata);
      final snapshot = await uploadTask;
      
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      Log.error('Failed to upload file: $e');
      throw Exception('Failed to upload file: $e');
    }
  }

  /// Delete file from Firebase Storage
  Future<void> deleteFile(String path) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.delete();
    } catch (e) {
      Log.error('Failed to delete file: $e');
      throw Exception('Failed to delete file: $e');
    }
  }

  /// Generate storage path for file
  static String generateStoragePath({
    required String clientId,
    required String fileType,
    required String fileId,
    required String extension,
  }) {
    return '$_baseAttachmentsPath/$clientId/$fileType/$fileId.$extension';
  }

  /// Delete a folder and all its contents from Firebase Storage
  Future<void> deleteFolder(String folderPath) async {
    try {
      final ref = _storage.ref().child(folderPath);
      final result = await ref.listAll();

      for (final item in result.items) {
        await item.delete();
      }

      for (final prefix in result.prefixes) {
        await deleteFolder('$folderPath/${prefix.name}');
      }
    } catch (e) {
      Log.error('Failed to delete folder: $e');
      throw Exception('Failed to delete folder: $e');
    }
  }
}
