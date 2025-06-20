import 'dart:async';

import 'package:file_picker/file_picker.dart' as picker;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:injectable/injectable.dart';
import 'package:marketinya/core/config/log.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/repositories/attachment_repository.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/models/uploaded_file.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/services/file_validation_service.dart';

class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  FileUploadBloc(
    this._attachmentRepository,
    this._fileValidationService,
    @factoryParam this.clientId,
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

    add(const FileUploadEvent.loadAllSections());
  }

  final AttachmentRepository _attachmentRepository;
  final FileValidationService _fileValidationService;
  final String clientId;

  /// Load all sections when tab opens
  Future<void> _onLoadAllSections(
    Emitter<FileUploadState> emit,
  ) async {
    // Set all sections to loading
    emit(
      state.copyWith(
        pdfStatus: Status.loading,
        txtStatus: Status.loading,
        imageStatus: Status.loading,
        videoStatus: Status.loading,
      ),
    );

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
    try {
      emit(_updateSectionStatus(state, fileType, Status.loading));

      final files = await _attachmentRepository.loadAttachments(
        clientId: clientId,
        fileType: fileType,
      );

      emit(_updateSectionData(state, fileType, Status.success, files, null));
    } catch (e) {
      Log.error('Error loading files for ${fileType.value}: $e');
      emit(
        _updateSectionData(
          state,
          fileType,
          Status.error,
          [],
          'Failed to load files: $e',
        ),
      );
    }
  }

  /// Handle file dropped in specific section
  Future<void> _onFileDropped(
    FileType fileType,
    DropzoneFileInterface file,
    DropzoneViewController controller,
    Emitter<FileUploadState> emit,
  ) async {
    emit(
      _updateSectionStatus(
        state.copyWith(
          isDragOver: false,
          currentDragSection: null,
        ),
        fileType,
        Status.loading,
      ),
    );

    try {
      final config = FileUploadConfigExtension.forFile(fileType);
      final validationError = await _fileValidationService.validateFile(
        file,
        controller,
        config,
      );

      if (validationError != null) {
        throw Exception(validationError.message);
      }

      final fileName = await controller.getFilename(file);
      final fileSize = await controller.getFileSize(file);
      final mimeType = await controller.getFileMIME(file);
      final lastModified = await controller.getFileLastModified(file);
      final tempUrl = await controller.createFileUrl(file);
      final fileData = await controller.getFileData(file);

      final uploadedFile = await _attachmentRepository.uploadFile(
        clientId: clientId,
        fileType: fileType,
        fileName: fileName,
        fileSize: fileSize,
        mimeType: mimeType,
        lastModified: lastModified,
        fileData: fileData,
        tempUrl: tempUrl,
      );

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
    } catch (e) {
      Log.error('Error uploading dropped file: $e');
      emit(
        _updateSectionData(
          state,
          fileType,
          Status.error,
          state.getSectionFiles(fileType),
          e.toString(),
        ),
      );
    }
  }

  /// Handle file picked from system via file picker
  Future<void> _onFilePicked(
    FileType fileType,
    picker.PlatformFile file,
    Emitter<FileUploadState> emit,
  ) async {
    try {
      emit(_updateSectionStatus(state, fileType, Status.loading));

      final config = FileUploadConfigExtension.forFile(fileType);
      _validateFileSize(file, config);

      final fileBytes = file.bytes;
      if (fileBytes == null) {
        throw Exception('Failed to read file data');
      }

      final uploadedFile = await _attachmentRepository.uploadFile(
        clientId: clientId,
        fileType: fileType,
        fileName: file.name,
        fileSize: file.size,
        mimeType: _getMimeTypeFromExtension(_getFileExtension(file.name)),
        lastModified: DateTime.now(),
        fileData: fileBytes,
      );

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
    } catch (e) {
      Log.error('Error uploading file: $e');
      emit(
        _updateSectionData(
          state,
          fileType,
          Status.error,
          state.getSectionFiles(fileType),
          e.toString(),
        ),
      );
    }
  }

  /// Handle drag enter for specific section
  Future<void> _onDragEntered(
    FileType fileType,
    Emitter<FileUploadState> emit,
  ) async {
    emit(
      state.copyWith(
        isDragOver: true,
        currentDragSection: fileType.value,
      ),
    );
  }

  /// Handle drag leave for specific section
  Future<void> _onDragLeft(
    FileType fileType,
    Emitter<FileUploadState> emit,
  ) async {
    emit(
      state.copyWith(
        isDragOver: false,
        currentDragSection: null,
      ),
    );
  }

  /// Remove file from specific section
  Future<void> _onFileRemoved(
    FileType fileType,
    String fileId,
    Emitter<FileUploadState> emit,
  ) async {
    emit(_updateSectionStatus(state, fileType, Status.loading));

    try {
      await _attachmentRepository.removeFile(
        clientId: clientId,
        fileType: fileType,
        fileId: fileId,
      );

      final currentFiles = state.getSectionFiles(fileType);
      final updatedFiles =
          currentFiles.where((file) => file.id != fileId).toList();

      emit(
        _updateSectionData(
          state,
          fileType,
          Status.success,
          updatedFiles,
          null,
        ),
      );
    } catch (e) {
      Log.error('Error removing file: $e');
      emit(
        _updateSectionData(
          state,
          fileType,
          Status.error,
          state.getSectionFiles(fileType),
          e.toString(),
        ),
      );
    }
  }

  /// Clear error for specific section
  Future<void> _onErrorCleared(
    FileType fileType,
    Emitter<FileUploadState> emit,
  ) async {
    emit(
      _updateSectionData(
        state,
        fileType,
        Status.success,
        state.getSectionFiles(fileType),
        null,
      ),
    );
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

  /// Validate file against configuration
  void _validateFileSize(picker.PlatformFile file, FileUploadConfig config) {
    if (file.size > config.maxFileSize) {
      throw Exception(
        'File size exceeds maximum allowed size of ${config.maxFileSize ~/ (1024 * 1024)}MB',
      );
    }

    final fileExtension = _getFileExtension(file.name);
    if (!config.allowedExtensions.contains(fileExtension)) {
      throw Exception(
        'File type not allowed. Allowed types: ${config.allowedExtensions.join(', ')}',
      );
    }
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
