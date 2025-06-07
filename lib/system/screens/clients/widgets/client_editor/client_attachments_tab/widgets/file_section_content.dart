import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/models/uploaded_file.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_item.dart';

class FileSectionContent extends StatelessWidget {
  const FileSectionContent({
    super.key,
    required this.files,
    required this.fileType,
  });

  final List<UploadedFile> files;
  final FileType fileType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              child: SizedBox(
                height: 76,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: files.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: sm),
                  itemBuilder: (context, index) => FileItem(
                    file: files[index],
                    fileType: fileType,
                  ),
                ),
              ),
            ),
            Padding(
              padding: dimen.horizontal.xs,
              child: IconButton(
                onPressed: () {},
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
}
