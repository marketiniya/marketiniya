import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/navigation/widgets/centered_logo_section.dart';
import 'package:marketinya/core/navigation/widgets/divider_line.dart';

class BottomDividerAndLabel extends StatelessWidget {
  const BottomDividerAndLabel({
    super.key,
    required this.labelLogoWidth,
    required this.dividerHeight,
  });

  final double labelLogoWidth;
  final double dividerHeight;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - labelLogoWidth;
    final sideWidth = availableWidth / nano;

    return Padding(
      padding: dimen.top.nano,
      child: Column(
        children: [
          Row(
            children: [
              DividerLine(width: sideWidth, height: dividerHeight),
              CenteredLogoSection(width: labelLogoWidth),
              DividerLine(width: sideWidth, height: dividerHeight),
            ],
          ),
          Padding(
            padding: dimen.top.xxsPlus,
            child: const Text(
              'По-добър маркетинг – по-добри резултати!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                fontFamily: 'GothamPro',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
