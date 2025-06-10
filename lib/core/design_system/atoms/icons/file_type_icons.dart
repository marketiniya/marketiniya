import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class FileTypeIcons {
  FileTypeIcons._();

  static Widget getIcon(String fileExtension, {double size = 24}) {
    // Map file extensions to section types
    String sectionType;
    final extension = fileExtension.toLowerCase();

    if (extension == 'pdf') {
      sectionType = 'pdf';
    } else if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'].contains(extension)) {
      sectionType = 'image';
    } else if (['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm', 'mkv'].contains(extension)) {
      sectionType = 'video';
    } else if (['txt', 'doc', 'docx'].contains(extension)) {
      sectionType = 'txt';
    } else {
      sectionType = 'unknown';
    }

    return getSectionIcon(sectionType, size: size);
  }

  /// Get icon for section type (used for placeholders)
  static Widget getSectionIcon(String sectionType, {double size = 24}) {
    IconData iconData;
    Color iconColor;

    switch (sectionType) {
      case 'pdf':
        iconData = FontAwesomeIcons.solidFilePdf;
        iconColor = Colors.red;
        break;
      case 'txt':
        iconData = FontAwesomeIcons.solidFileLines;
        iconColor = Colors.blue;
        break;
      case 'image':
        iconData = FontAwesomeIcons.solidFileImage;
        iconColor = Colors.green;
        break;
      case 'video':
        iconData = FontAwesomeIcons.solidFileVideo;
        iconColor = Colors.purple;
        break;
      default:
        iconData = FontAwesomeIcons.file;
        iconColor = AppColors.oliveGreen;
        break;
    }

    return FaIcon(
      iconData,
      size: size,
      color: iconColor,
    );
  }
}
