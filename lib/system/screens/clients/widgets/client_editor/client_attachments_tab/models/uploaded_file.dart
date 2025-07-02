import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';

part 'uploaded_file.freezed.dart';
part 'uploaded_file.g.dart';

// File size constants - reused throughout the file
const int _bytesPerKB = 1024;
const int _bytesPerMB = 1024 * 1024;
const int _bytesPerGB = 1024 * 1024 * 1024;

@freezed
class UploadedFile with _$UploadedFile {
  const factory UploadedFile({
    required String id,
    required String name,
    required int size,
    required String mimeType,
    required DateTime lastModified,
    required String fileExtension,
    required FileType fileType,
    String? tempUrl,
    String? downloadUrl, // Firebase Storage download URL
    String? storagePath, // Firebase Storage path for deletion
  }) = _UploadedFile;

  factory UploadedFile.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileFromJson(json);
}

extension UploadedFileExtension on UploadedFile {
  String get formattedSize {
    if (size < _bytesPerKB) {
      return '${size}B';
    } else if (size < _bytesPerMB) {
      return '${(size / _bytesPerKB).ceil()}KB';
    } else if (size < _bytesPerGB) {
      return '${(size / _bytesPerMB).ceil()}MB';
    } else {
      return '${(size / _bytesPerGB).ceil()}GB';
    }
  }

  bool get isImage =>
      ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(fileExtension);

  bool get isPdf => fileExtension == 'pdf';

  bool get isVideo =>
      ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm'].contains(fileExtension);

  bool get isText => ['txt', 'doc', 'docx'].contains(fileExtension);
}

@freezed
class FileValidationError with _$FileValidationError {
  const factory FileValidationError({
    required String message,
    required FileValidationErrorType type,
  }) = _FileValidationError;

  factory FileValidationError.fromJson(Map<String, dynamic> json) =>
      _$FileValidationErrorFromJson(json);
}

enum FileValidationErrorType {
  fileTooLarge,
  invalidFileType,
  invalidExtension,
  sectionMismatch,
  uploadFailed,
  unknown,
}

@freezed
class FileUploadConfig with _$FileUploadConfig {
  const factory FileUploadConfig({
    required FileType fileType,
    required int maxFileSize,
    required List<String> allowedExtensions,
  }) = _FileUploadConfig;

  factory FileUploadConfig.fromJson(Map<String, dynamic> json) =>
      _$FileUploadConfigFromJson(json);
}

extension FileUploadConfigExtension on FileUploadConfig {
  static FileUploadConfig forFile(FileType fileType) {
    switch (fileType) {
      case FileType.pdf:
        return const FileUploadConfig(
          fileType: FileType.pdf,
          maxFileSize: 50 * _bytesPerMB, // 50MB
          allowedExtensions: ['pdf'],
        );
      case FileType.txt:
        return const FileUploadConfig(
          fileType: FileType.txt,
          maxFileSize: 10 * _bytesPerMB, // 10MB
          allowedExtensions: ['txt', 'doc', 'docx'],
        );
      case FileType.image:
        return const FileUploadConfig(
          fileType: FileType.image,
          maxFileSize: 20 * _bytesPerMB, // 20MB
          allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'],
        );
      case FileType.video:
        return const FileUploadConfig(
          fileType: FileType.video,
          maxFileSize: 100 * _bytesPerMB, // 100MB
          allowedExtensions: ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm'],
        );
    }
  }
}
