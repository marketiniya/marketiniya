import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';

part 'uploaded_file.freezed.dart';
part 'uploaded_file.g.dart';

@freezed
class UploadedFile with _$UploadedFile {
  const factory UploadedFile({
    required String id,
    required String name,
    required int size,
    required String mimeType,
    required DateTime lastModified,
    required String fileExtension,
    required FileType sectionType,
    String? tempUrl,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DropzoneFileInterface? fileInterface,
  }) = _UploadedFile;

  factory UploadedFile.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileFromJson(json);
}

extension UploadedFileExtension on UploadedFile {
  String get formattedSize {
    if (size < 1024) {
      return '${size}B';
    }
    if (size < 1024 * 1024) {
      return '${(size / 1024).toStringAsFixed(1)}KB';
    }
    return '${(size / (1024 * 1024)).toStringAsFixed(1)}MB';
  }

  bool get isImage => ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(fileExtension);
  bool get isPdf => fileExtension == 'pdf';
  bool get isVideo => ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm'].contains(fileExtension);
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
    required String sectionType,
    required int maxFileSize,
    required List<String> allowedExtensions,
  }) = _FileUploadConfig;

  factory FileUploadConfig.fromJson(Map<String, dynamic> json) =>
      _$FileUploadConfigFromJson(json);
}

extension FileUploadConfigExtension on FileUploadConfig {
  static FileUploadConfig forSectionType(String sectionType) {
    switch (sectionType.toLowerCase()) {
      case 'pdf':
        return const FileUploadConfig(
          sectionType: 'pdf',
          maxFileSize: 50 * 1024 * 1024, // 50MB
          allowedExtensions: ['pdf'],
        );
      case 'txt':
        return const FileUploadConfig(
          sectionType: 'txt',
          maxFileSize: 10 * 1024 * 1024, // 10MB
          allowedExtensions: ['txt', 'doc', 'docx'],
        );
      case 'image':
        return const FileUploadConfig(
          sectionType: 'image',
          maxFileSize: 20 * 1024 * 1024, // 20MB
          allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'],
        );
      case 'video':
        return const FileUploadConfig(
          sectionType: 'video',
          maxFileSize: 100 * 1024 * 1024, // 100MB
          allowedExtensions: ['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm'],
        );
      default:
        return const FileUploadConfig(
          sectionType: 'unknown',
          maxFileSize: 10 * 1024 * 1024, // 10MB
          allowedExtensions: [],
        );
    }
  }
}
