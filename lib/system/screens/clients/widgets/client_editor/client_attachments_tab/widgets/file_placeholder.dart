import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/icons/file_type_icons.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';

class FilePlaceholder extends StatelessWidget {
  const FilePlaceholder({
    super.key,
    required this.fileName,
    required this.fileType,
  });
  final String fileName;
  final String fileType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 90,
          height: 50,
          child: Center(
            child: FileTypeIcons.getSectionIcon(fileType, size: lg),
          ),
        ),
        const SizedBox(height: micro),
        SizedBox(
          width: 200,
          child: Text(
            fileName,
            style: const TextStyle(
              fontSize: xxsPlus,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
