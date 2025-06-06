import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class FileTypeIcons {
  FileTypeIcons._();

  static Widget getIcon(String fileType, {double size = 24}) {
    IconData iconData;
    Color iconColor;

    switch (fileType.toLowerCase()) {
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
