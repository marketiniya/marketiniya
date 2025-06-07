import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/models/uploaded_file.dart';

@Injectable()
class FileValidationService {
  /// Validates a file against the given configuration
  Future<FileValidationError?> validateFile(
    DropzoneFileInterface file,
    DropzoneViewController controller,
    FileUploadConfig config,
  ) async {
    try {
      // Get file information
      final fileName = await controller.getFilename(file);
      final fileSize = await controller.getFileSize(file);
      final mimeType = await controller.getFileMIME(file);

      // Validate file size
      final sizeError = _validateFileSize(fileSize, config);
      if (sizeError != null) return sizeError;

      // Validate file extension
      final extensionError = _validateFileExtension(fileName, config);
      if (extensionError != null) return extensionError;

      // Validate file type matches section
      final typeError = _validateFileTypeForSection(fileName, mimeType, config);
      if (typeError != null) return typeError;

      return null; // File is valid
    } catch (e) {
      return FileValidationError(
        message: 'Error validating file: ${e.toString()}',
        type: FileValidationErrorType.unknown,
      );
    }
  }

  /// Validates multiple files
  Future<List<FileValidationError>> validateFiles(
    List<DropzoneFileInterface> files,
    DropzoneViewController controller,
    FileUploadConfig config,
  ) async {
    final errors = <FileValidationError>[];

    for (final file in files) {
      final error = await validateFile(file, controller, config);
      if (error != null) {
        errors.add(error);
      }
    }

    return errors;
  }

  FileValidationError? _validateFileSize(int fileSize, FileUploadConfig config) {
    if (fileSize > config.maxFileSize) {
      final maxSizeMB = (config.maxFileSize / (1024 * 1024)).toStringAsFixed(1);
      return FileValidationError(
        message: 'File too large. Maximum size is ${maxSizeMB}MB',
        type: FileValidationErrorType.fileTooLarge,
      );
    }
    return null;
  }

  FileValidationError? _validateFileExtension(
    String fileName,
    FileUploadConfig config,
  ) {
    if (config.allowedExtensions.isEmpty) return null;

    final extension = _getFileExtension(fileName);
    if (!config.allowedExtensions.contains(extension)) {
      return FileValidationError(
        message: 'File type not allowed. Allowed types: ${config.allowedExtensions.join(', ')}',
        type: FileValidationErrorType.invalidExtension,
      );
    }
    return null;
  }

  FileValidationError? _validateFileTypeForSection(
    String fileName,
    String mimeType,
    FileUploadConfig config,
  ) {
    final extension = _getFileExtension(fileName);
    final sectionType = config.sectionType.toLowerCase();

    final isValidForSection = _isFileTypeAllowedForSection(
      extension,
      mimeType,
      sectionType,
    );

    if (!isValidForSection) {
      return FileValidationError(
        message: 'File type does not match this section (${config.sectionType})',
        type: FileValidationErrorType.sectionMismatch,
      );
    }

    return null;
  }

  bool _isFileTypeAllowedForSection(
    String extension,
    String mimeType,
    String sectionType,
  ) {
    switch (sectionType) {
      case 'pdf':
        return extension == 'pdf' || mimeType.contains('pdf');
      case 'txt':
        return ['txt', 'doc', 'docx'].contains(extension) || 
               mimeType.contains('text') || 
               mimeType.contains('document');
      case 'image':
        return ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension) ||
               mimeType.startsWith('image/');
      case 'video':
        return ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm'].contains(extension) ||
               mimeType.startsWith('video/');
      default:
        return true; // Allow all types for unknown sections
    }
  }

  String _getFileExtension(String fileName) {
    final parts = fileName.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  /// Get human-readable error message for validation error type
  String getErrorMessage(FileValidationErrorType type) {
    switch (type) {
      case FileValidationErrorType.fileTooLarge:
        return 'File is too large';
      case FileValidationErrorType.invalidFileType:
        return 'Invalid file type';
      case FileValidationErrorType.invalidExtension:
        return 'File extension not allowed';
      case FileValidationErrorType.sectionMismatch:
        return 'File type does not match section';
      case FileValidationErrorType.uploadFailed:
        return 'Upload failed';
      case FileValidationErrorType.unknown:
        return 'Unknown error occurred';
    }
  }

  /// Check if file is supported for preview
  bool canPreviewFile(String extension, String mimeType) {
    // Images can be previewed
    if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension) ||
        mimeType.startsWith('image/')) {
      return true;
    }

    // PDFs can be previewed in browser
    if (extension == 'pdf' || mimeType.contains('pdf')) {
      return true;
    }

    // Text files can be previewed
    if (['txt'].contains(extension) || mimeType.contains('text/plain')) {
      return true;
    }

    return false;
  }

  /// Get appropriate icon for file type
  String getFileTypeIcon(String extension) {
    if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension)) {
      return 'image';
    }
    if (extension == 'pdf') {
      return 'pdf';
    }
    if (['txt', 'doc', 'docx'].contains(extension)) {
      return 'txt';
    }
    if (['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm'].contains(extension)) {
      return 'video';
    }
    return 'unknown';
  }
}
