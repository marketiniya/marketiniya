import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/models/uploaded_file.dart';

part 'file_upload_state.freezed.dart';

@freezed
class FileUploadState with _$FileUploadState {
  const factory FileUploadState({
    // PDF Section
    @Default(Status.initial) Status pdfStatus,
    @Default([]) List<UploadedFile> pdfFiles,
    String? pdfError,

    // TXT Section
    @Default(Status.initial) Status txtStatus,
    @Default([]) List<UploadedFile> txtFiles,
    String? txtError,

    // Image Section
    @Default(Status.initial) Status imageStatus,
    @Default([]) List<UploadedFile> imageFiles,
    String? imageError,

    // Video Section
    @Default(Status.initial) Status videoStatus,
    @Default([]) List<UploadedFile> videoFiles,
    String? videoError,

    // UI states for drag-drop
    @Default(false) bool isDragOver,
    String? currentDragSection,
  }) = _FileUploadState;
}

extension FileUploadStateExtension on FileUploadState {
  // Helper methods to get section-specific data
  Status getSectionStatus(FileType fileType) {
    switch (fileType) {
      case FileType.pdf:
        return pdfStatus;
      case FileType.txt:
        return txtStatus;
      case FileType.image:
        return imageStatus;
      case FileType.video:
        return videoStatus;
    }
  }

  List<UploadedFile> getSectionFiles(FileType fileType) {
    switch (fileType) {
      case FileType.pdf:
        return pdfFiles;
      case FileType.txt:
        return txtFiles;
      case FileType.image:
        return imageFiles;
      case FileType.video:
        return videoFiles;
    }
  }

  String? getSectionError(FileType fileType) {
    switch (fileType) {
      case FileType.pdf:
        return pdfError;
      case FileType.txt:
        return txtError;
      case FileType.image:
        return imageError;
      case FileType.video:
        return videoError;
    }
  }

  // Convenience getters
  bool get hasAnyFiles =>
      pdfFiles.isNotEmpty ||
      txtFiles.isNotEmpty ||
      imageFiles.isNotEmpty ||
      videoFiles.isNotEmpty;

  int get totalFilesCount =>
      pdfFiles.length +
      txtFiles.length +
      imageFiles.length +
      videoFiles.length;

  bool hasSectionFiles(FileType fileType) {
    return getSectionFiles(fileType).isNotEmpty;
  }

  bool isSectionLoading(FileType fileType) {
    return getSectionStatus(fileType) == Status.loading;
  }

  bool hasSectionError(FileType fileType) {
    return getSectionStatus(fileType) == Status.error;
  }
}
