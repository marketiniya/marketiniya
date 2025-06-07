import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_section_container.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_section_content.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_section_error_state.dart';

class FileSection extends StatefulWidget {
  const FileSection({
    super.key,
    required this.fileType,
  });

  final FileType fileType;

  @override
  State<FileSection> createState() => _FileSectionState();
}

class _FileSectionState extends State<FileSection> {
  late DropzoneViewController _dropzoneController;

  void _onDropzoneCreated(DropzoneViewController controller) {
    _dropzoneController = controller;
  }

  void _onDropFile(DropzoneFileInterface file) {
    context.read<FileUploadBloc>().add(
          FileUploadEvent.fileDropped(
            fileType: widget.fileType,
            file: file,
            controller: _dropzoneController,
          ),
        );
  }

  void _onHover() {
    context.read<FileUploadBloc>().add(
          FileUploadEvent.dragEntered(widget.fileType),
        );
  }

  void _onLeave() {
    context.read<FileUploadBloc>().add(
          FileUploadEvent.dragLeft(widget.fileType),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileUploadBloc, FileUploadState>(
      builder: (context, state) {
        final status = state.getSectionStatus(widget.fileType);
        final files = state.getSectionFiles(widget.fileType);
        final error = state.getSectionError(widget.fileType);
        final isDragOver = state.isDragOver &&
            state.currentDragSection == widget.fileType.value;

        if (status == Status.loading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.fileType.displayName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: xs),
              const FileSectionContainer(
                isDragOver: false,
                hasError: false,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.oliveGreen,
                  ),
                ),
              ),
              if (widget.fileType != FileType.video) ...[
                Padding(
                  padding: dimen.top.xs + dimen.bottom.xs,
                  child: const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
              ],
            ],
          );
        }
        if (status == Status.error) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.fileType.displayName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: xs),
              FileSectionContainer(
                isDragOver: false,
                hasError: true,
                child: FileSectionErrorState(
                  error: error,
                  fileType: widget.fileType,
                ),
              ),
              if (widget.fileType != FileType.video) ...[
                Padding(
                  padding: dimen.top.xs + dimen.bottom.xs,
                  child: const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
              ],
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.fileType.displayName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: xs),
            Stack(
              children: [
                // Dropzone for drag and drop
                SizedBox(
                  height: 100,
                  child: DropzoneView(
                    onCreated: _onDropzoneCreated,
                    onDropFile: _onDropFile,
                    onHover: _onHover,
                    onLeave: _onLeave,
                  ),
                ),
                // Content overlay with container styling
                FileSectionContainer(
                  isDragOver: isDragOver,
                  hasError: error != null,
                  child: FileSectionContent(
                    files: files,
                    fileType: widget.fileType,
                  ),
                ),
              ],
            ),

            // Always show divider except for last section
            if (widget.fileType != FileType.video) ...[
              Padding(
                padding: dimen.top.xs + dimen.bottom.xs,
                child: const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
