import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/icons/file_type_icons.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/molecules/dialogs.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
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
                    onPressed: () => _deleteConfirmationDialog(context),
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

  void _deleteConfirmationDialog(BuildContext context) {
    final bloc = context.read<FileUploadBloc>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: const Text(
            'Сигурни ли сте, че искате да изтриете?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            file.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: PrimaryButton.responsive(
                    title: 'Да',
                    icon: const Icon(Icons.check, size: xs),
                    backgroundColor: AppColors.oliveGreen,
                    activeTitleColor: Colors.white,
                    overlayButtonColor: AppColors.oliveGreen.withValues(alpha: 0.8),
                    onPressed: () {
                      Navigator.of(context).pop();
                      bloc.add(
                        FileUploadEvent.fileRemoved(
                          fileType: file.fileType,
                          fileId: file.id,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: PrimaryButton.responsive(
                    title: 'Не',
                    icon: const Icon(Icons.close, size: xs),
                    backgroundColor: Colors.white,
                    activeTitleColor: AppColors.oliveGreen,
                    borderColor: Colors.grey.shade400,
                    overlayButtonColor: AppColors.lightBeige,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
