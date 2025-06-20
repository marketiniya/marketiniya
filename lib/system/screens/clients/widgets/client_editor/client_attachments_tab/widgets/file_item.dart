import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/icons/file_type_icons.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/bloc/file_upload_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/models/uploaded_file.dart';

class FileItem extends StatelessWidget {
  const FileItem({
    super.key,
    required this.file,
  });

  final UploadedFile file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: FileTypeIcons.getIcon(file.fileExtension, size: lg),
                ),
                Positioned(
                  top: none,
                  right: none,
                  child: IconButton(
                    onPressed: () => _removeFile(context),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: xxsPlus,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(xs, xs),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: xs),
          Text(
            file.name,
            style: const TextStyle(
              fontSize: xxsPlus,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            file.formattedSize,
            style: const TextStyle(
              fontSize: xxs,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _removeFile(BuildContext context) {
    context.read<FileUploadBloc>().add(
          FileUploadEvent.fileRemoved(
            fileType: file.fileType,
            fileId: file.id,
          ),
        );
  }
}
