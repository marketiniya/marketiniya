import 'package:file_picker/file_picker.dart' as picker;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/models/uploaded_file.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_item.dart';

class FileSectionContent extends StatelessWidget {
  const FileSectionContent({
    super.key,
    required this.files,
    required this.supportedFileType,
  });

  final List<UploadedFile> files;

  // Supported upload file type for the section
  final FileType supportedFileType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (files.length < 6)
          Center(
            child: Text(
              'Drag and drop files',
              style: TextStyle(
                fontSize: xxsPlus,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        Row(
          children: [
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: files.length,
                separatorBuilder: (_, index) => const SizedBox(width: sm),
                itemBuilder: (_, index) => FileItem(file: files[index]),
              ),
            ),
            Padding(
              padding: dimen.horizontal.xs,
              child: IconButton(
                onPressed: () => _pickFiles(context),
                icon: const Icon(
                  Icons.file_upload_outlined,
                  size: sm,
                  color: AppColors.lightOlive,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.oliveGreen,
                  padding: dimen.all.micro,
                  minimumSize: const Size(md, md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(micro),
                  ),
                  elevation: nano,
                  shadowColor: Colors.black.withValues(alpha: 0.1),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickFiles(BuildContext context) async {
    // Get allowed extensions for this file type
    final config = FileUploadConfigExtension.forFile(supportedFileType);

    // Configure file picker based on file type
    picker.FileType pickerType;
    List<String>? allowedExtensions;

    switch (supportedFileType) {
      case FileType.image:
        pickerType = picker.FileType.image;
        break;
      case FileType.video:
        pickerType = picker.FileType.video;
        break;
      case FileType.pdf:
        pickerType = picker.FileType.custom;
        allowedExtensions = config.allowedExtensions;
        break;
      case FileType.txt:
        pickerType = picker.FileType.custom;
        allowedExtensions = config.allowedExtensions;
        break;
    }

    // Pick files
    final result = await picker.FilePicker.platform.pickFiles(
      type: pickerType,
      allowedExtensions: allowedExtensions,
      allowMultiple: true,
      withData: true,
      withReadStream: false,
    );

    if (!context.mounted) {
      return;
    }

    if (result != null && result.files.isNotEmpty) {
      for (final file in result.files) {
        context.read<FileUploadBloc>().add(
              FileUploadEvent.filePicked(
                fileType: supportedFileType,
                file: file,
              ),
            );
      }
    }
  }
}
