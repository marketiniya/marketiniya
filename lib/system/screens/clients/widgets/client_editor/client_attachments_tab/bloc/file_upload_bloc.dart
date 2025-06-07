import 'dart:async';

import 'package:file_picker/file_picker.dart' as picker;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/models/uploaded_file.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/services/file_validation_service.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/services/hardcoded_data_service.dart';

@Injectable()
class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  FileUploadBloc(
    this._fileValidationService,
    this._hardcodedDataService,
  ) : super(const FileUploadState()) {
    on<FileUploadEvent>((event, emit) async {
      await event.when(
        loadAllSections: () => _onLoadAllSections(emit),
        loadSection: (fileType) => _loadFileTypeData(fileType, emit),
        fileDropped: (fileType, file, controller) => _onFileDropped(fileType, file, controller, emit),
        filePicked: (fileType, file) => _onFilePicked(fileType, file, emit),
        dragEntered: (fileType) => _onDragEntered(fileType, emit),
        dragLeft: (fileType) => _onDragLeft(fileType, emit),
        fileRemoved: (fileType, fileId) => _onFileRemoved(fileType, fileId, emit),
        errorCleared: (fileType) => _onErrorCleared(fileType, emit),
      );
    });
  }

  final FileValidationService _fileValidationService;
  final HardcodedDataService _hardcodedDataService;

  /// Load all sections when tab opens
  Future<void> _onLoadAllSections(
    Emitter<FileUploadState> emit,
  ) async {
    // Set all sections to loading
    emit(state.copyWith(
      pdfStatus: Status.loading,
      txtStatus: Status.loading,
      imageStatus: Status.loading,
      videoStatus: Status.loading,
    ));

    // Load each section independently
    await Future.wait([
      _loadFileTypeData(FileType.pdf, emit),
      _loadFileTypeData(FileType.txt, emit),
      _loadFileTypeData(FileType.image, emit),
      _loadFileTypeData(FileType.video, emit),
    ]);
  }

  /// Load data for a specific file type
  Future<void> _loadFileTypeData(
    FileType fileType,
    Emitter<FileUploadState> emit,
  ) async {
    emit(_updateSectionStatus(state, fileType, Status.loading));

    final files = await _hardcodedDataService.getFilesForSection(fileType.value);

    // Update section with success
    emit(_updateSectionData(state, fileType, Status.success, files, null));
  }

  /// Handle file dropped in specific section
  Future<void> _onFileDropped(
    FileType fileType,
    DropzoneFileInterface file,
    DropzoneViewController controller,
    Emitter<FileUploadState> emit,
  ) async {
    // Clear drag state
    emit(state.copyWith(
      isDragOver: false,
      currentDragSection: null,
    ));

    try {
      // Validate file for section
      final config = FileUploadConfigExtension.forFile(fileType);
      final validationError = await _fileValidationService.validateFile(
        file,
        controller,
        config,
      );

      if (validationError != null) {
        // Update section with error
        emit(_updateSectionData(
          state,
          fileType,
          Status.error,
          state.getSectionFiles(fileType),
          validationError.message,
        ));
        return;
      }

      // Extract file information
      final fileName = await controller.getFilename(file);
      final fileSize = await controller.getFileSize(file);
      final mimeType = await controller.getFileMIME(file);
      final lastModified = await controller.getFileLastModified(file);
      final tempUrl = await controller.createFileUrl(file);

      // Create uploaded file
      final uploadedFile = UploadedFile(
        id: '${fileName}_${DateTime.now().millisecondsSinceEpoch}',
        name: fileName,
        size: fileSize,
        mimeType: mimeType,
        lastModified: lastModified,
        fileExtension: _getFileExtension(fileName),
        sectionType: fileType,
        tempUrl: tempUrl,
        fileInterface: file,
      );

      // Add file to section
      final currentFiles = state.getSectionFiles(fileType);
      final updatedFiles = [...currentFiles, uploadedFile];

      emit(_updateSectionData(
        state,
        fileType,
        Status.success,
        updatedFiles,
        null,
      ));
    } catch (e) {
      Log.error('Error processing dropped file: $e');
      emit(_updateSectionData(
        state,
        fileType,
        Status.error,
        state.getSectionFiles(fileType),
        'Failed to upload file: ${e.toString()}',
      ));
    }
  }

  /// Handle file picked from system via file picker
  Future<void> _onFilePicked(
    FileType fileType,
    picker.PlatformFile file,
    Emitter<FileUploadState> emit,
  ) async {
    final config = FileUploadConfigExtension.forFile(fileType);

    if (file.size > config.maxFileSize) {
      emit(
        _updateSectionData(
          state,
          fileType,
          Status.error,
          state.getSectionFiles(fileType),
          'File size exceeds maximum allowed size of ${config.maxFileSize ~/ (1024 * 1024)}MB',
        ),
      );
      return;
    }

    final fileExtension = _getFileExtension(file.name);
    if (!config.allowedExtensions.contains(fileExtension)) {
      emit(
        _updateSectionData(
          state,
          fileType,
          Status.error,
          state.getSectionFiles(fileType),
          'File type not allowed. Allowed types: ${config.allowedExtensions.join(', ')}',
        ),
      );
      return;
    }

    final uploadedFile = UploadedFile(
      id: '${file.name}_${DateTime.now().millisecondsSinceEpoch}',
      name: file.name,
      size: file.size,
      mimeType: _getMimeTypeFromExtension(fileExtension),
      lastModified: DateTime.now(),
      fileExtension: fileExtension,
      sectionType: fileType,
      tempUrl: file.path,
      platformFile: file, // Store the PlatformFile for later use
    );

    // Add file to section
    final currentFiles = state.getSectionFiles(fileType);
    final updatedFiles = [...currentFiles, uploadedFile];

    emit(
      _updateSectionData(
        state,
        fileType,
        Status.success,
        updatedFiles,
        null,
      ),
    );
  }

  /// Handle drag enter for specific section
  Future<void> _onDragEntered(
    FileType fileType,
    Emitter<FileUploadState> emit,
  ) async {
    emit(state.copyWith(
      isDragOver: true,
      currentDragSection: fileType.value,
    ));
  }

  /// Handle drag leave for specific section
  Future<void> _onDragLeft(
    FileType fileType,
    Emitter<FileUploadState> emit,
  ) async {
    emit(state.copyWith(
      isDragOver: false,
      currentDragSection: null,
    ));
  }

  /// Remove file from specific section
  Future<void> _onFileRemoved(
    FileType fileType,
    String fileId,
    Emitter<FileUploadState> emit,
  ) async {
    try {
      final currentFiles = state.getSectionFiles(fileType);
      final fileToRemove = currentFiles.firstWhere((file) => file.id == fileId);

      // Release temporary URL if it exists
      if (fileToRemove.tempUrl != null) {
        // Note: We would need the controller here, but for now we'll skip cleanup
        // This should be handled by the widget's dispose method
      }

      final updatedFiles =
          currentFiles.where((file) => file.id != fileId).toList();

      emit(_updateSectionData(
        state,
        fileType,
        Status.success,
        updatedFiles,
        null,
      ));
    } catch (e) {
      Log.error('Error removing file: $e');
      emit(_updateSectionData(
        state,
        fileType,
        Status.error,
        state.getSectionFiles(fileType),
        'Failed to remove file: ${e.toString()}',
      ));
    }
  }

  /// Clear error for specific section
  Future<void> _onErrorCleared(
    FileType fileType,
    Emitter<FileUploadState> emit,
  ) async {
    emit(_updateSectionData(
      state,
      fileType,
      Status.success,
      state.getSectionFiles(fileType),
      null,
    ));
  }

  /// Helper method to update section status only
  FileUploadState _updateSectionStatus(
    FileUploadState currentState,
    FileType fileType,
    Status status,
  ) {
    switch (fileType) {
      case FileType.pdf:
        return currentState.copyWith(pdfStatus: status);
      case FileType.txt:
        return currentState.copyWith(txtStatus: status);
      case FileType.image:
        return currentState.copyWith(imageStatus: status);
      case FileType.video:
        return currentState.copyWith(videoStatus: status);
    }
  }

  /// Helper method to update section data (status, files, error)
  FileUploadState _updateSectionData(
    FileUploadState currentState,
    FileType fileType,
    Status status,
    List<UploadedFile> files,
    String? error,
  ) {
    switch (fileType) {
      case FileType.pdf:
        return currentState.copyWith(
          pdfStatus: status,
          pdfFiles: files,
          pdfError: error,
        );
      case FileType.txt:
        return currentState.copyWith(
          txtStatus: status,
          txtFiles: files,
          txtError: error,
        );
      case FileType.image:
        return currentState.copyWith(
          imageStatus: status,
          imageFiles: files,
          imageError: error,
        );
      case FileType.video:
        return currentState.copyWith(
          videoStatus: status,
          videoFiles: files,
          videoError: error,
        );
    }
  }

  /// Public method to reload a specific file type (for retry operations)
  void reloadFileType(FileType fileType) {
    add(FileUploadEvent.loadSection(fileType));
  }

  /// Helper method to get file extension
  String _getFileExtension(String fileName) {
    final parts = fileName.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  /// Helper method to get MIME type from file extension
  String _getMimeTypeFromExtension(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return 'application/pdf';
      case 'txt':
        return 'text/plain';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'mp4':
        return 'video/mp4';
      case 'avi':
        return 'video/avi';
      case 'mov':
        return 'video/quicktime';
      default:
        return 'application/octet-stream';
    }
  }
}
