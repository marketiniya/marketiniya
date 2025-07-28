import 'package:file_picker/file_picker.dart' as picker;
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/attachments_tab/enums/file_type.dart';

part 'file_upload_event.freezed.dart';

@freezed
class FileUploadEvent with _$FileUploadEvent {
  /// Load all sections when tab opens
  const factory FileUploadEvent.loadAllSections() = _LoadAllSections;

  /// Load specific section
  const factory FileUploadEvent.loadSection(FileType fileType) = _LoadSection;

  /// File dropped via drag and drop
  const factory FileUploadEvent.fileDropped({
    required FileType fileType,
    required DropzoneFileInterface file,
    required DropzoneViewController controller,
  }) = _FileDropped;

  /// File picked from system via file picker
  const factory FileUploadEvent.filePicked({
    required FileType fileType,
    required picker.PlatformFile file,
  }) = _FilePicked;

  /// Drag enter event for specific section
  const factory FileUploadEvent.dragEntered(FileType fileType) = _DragEntered;

  /// Drag leave event for specific section
  const factory FileUploadEvent.dragLeft(FileType fileType) = _DragLeft;

  /// Remove a specific file from section
  const factory FileUploadEvent.fileRemoved({
    required FileType fileType,
    required String fileId,
  }) = _FileRemoved;

  /// Clear error for specific section
  const factory FileUploadEvent.errorCleared(FileType fileType) = _ErrorCleared;

  /// Download a file
  const factory FileUploadEvent.fileOpen({
    required String fileId,
    required String fileName,
    required String downloadUrl,
  }) = _FileDownload;
}
