import 'dart:typed_data';

import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/services/firebase_storage_service.dart';
import 'package:marketinya/core/services/firestore_service.dart';
import 'package:marketinya/core/utils/uuid_generator.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/models/uploaded_file.dart';

class AttachmentRepository {
  AttachmentRepository(
    this._firebaseStorageService,
    this._firestoreService,
  );

  final FirebaseStorageService _firebaseStorageService;
  final FirestoreService _firestoreService;

  static const String _clientsCollection = 'clients';
  static const String _attachmentsSubcollection = 'attachments';
  static const String _fileTypeField = 'fileType';

  /// Load attachments for a specific client and file type
  Future<List<UploadedFile>> loadAttachments({
    required String clientId,
    required FileType fileType,
  }) async {
    try {
      final querySnapshot = await _firestoreService
          .getCollection(_clientsCollection)
          .doc(clientId)
          .collection(_attachmentsSubcollection)
          .where(_fileTypeField, isEqualTo: fileType.value)
          .get();

      final files = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return UploadedFile.fromJson(data);
      }).toList();

      return files;
    } catch (e) {
      Log.error('Error loading attachments: $e');
      throw Exception('Failed to load attachments: $e');
    }
  }

  /// Upload a file with extracted data (generic method)
  Future<UploadedFile> uploadFile({
    required String clientId,
    required FileType fileType,
    required String fileName,
    required int fileSize,
    required String mimeType,
    required DateTime lastModified,
    required Uint8List fileData,
    String? tempUrl,
  }) async {
    try {
      final getFileName = await generateFileNameWithIncrementPrefix(
        clientId,
        fileType,
        fileName,
      );

      final fileExtension = _getFileExtension(getFileName);
      final fileId = UuidGenerator.instance.v1();
      final storagePath = FirebaseStorageService.generateStoragePath(
        clientId: clientId,
        fileType: fileType.value,
        fileId: fileId,
        extension: fileExtension,
      );

      final downloadUrl = await _firebaseStorageService.uploadFile(
        path: storagePath,
        data: fileData,
        contentType: mimeType,
      );

      final uploadedFile = UploadedFile(
        id: fileId,
        name: getFileName,
        size: fileSize,
        mimeType: mimeType,
        lastModified: lastModified,
        fileExtension: fileExtension,
        fileType: fileType,
        downloadUrl: downloadUrl,
        storagePath: storagePath,
        tempUrl: tempUrl,
      );

      await _saveFileToFirestore(clientId, uploadedFile);

      return uploadedFile;
    } catch (e) {
      Log.error('Error uploading file: $e');
      rethrow;
    }
  }

  /// Remove a file
  Future<void> removeFile({
    required String clientId,
    required FileType fileType,
    required String fileId,
  }) async {
    try {
      final fileDoc = await _firestoreService
          .getCollection(_clientsCollection)
          .doc(clientId)
          .collection(_attachmentsSubcollection)
          .doc(fileId)
          .get();

      if (fileDoc.exists) {
        final fileData = fileDoc.data()!;
        final storagePath = fileData['storagePath'] as String?;

        if (storagePath != null) {
          await _firebaseStorageService.deleteFile(storagePath);
        }

        await _firestoreService
            .getCollection(_clientsCollection)
            .doc(clientId)
            .collection(_attachmentsSubcollection)
            .doc(fileId)
            .delete();
      }
    } catch (e) {
      Log.error('Error removing file: $e');
      rethrow;
    }
  }

  /// Save single file to Firestore subcollection
  Future<void> _saveFileToFirestore(
    String clientId,
    UploadedFile file,
  ) async {
    await _firestoreService
        .getCollection(_clientsCollection)
        .doc(clientId)
        .collection(_attachmentsSubcollection)
        .doc(file.id)
        .set(file.toJson());
  }

  Future<String> generateFileNameWithIncrementPrefix(
    String clientId,
    FileType fileType,
    String originalName,
  ) async {
    if (!await _documentExists(clientId, fileType, originalName)) {
      return originalName;
    }

    var counter = 1;
    String newName;

    do {
      newName = '($counter)$originalName';
      counter++;
    } while (await _documentExists(clientId, fileType, newName));

    return newName;
  }

  Future<bool> _documentExists(
    String clientId,
    FileType fileType,
    String fileName,
  ) async {
    final querySnapshot = await _firestoreService
        .getCollection(_clientsCollection)
        .doc(clientId)
        .collection(_attachmentsSubcollection)
        .where(_fileTypeField, isEqualTo: fileType.value)
        .where('name', isEqualTo: fileName)
        .limit(1)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  /// Helper method to get file extension
  String _getFileExtension(String fileName) {
    final parts = fileName.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }
}
