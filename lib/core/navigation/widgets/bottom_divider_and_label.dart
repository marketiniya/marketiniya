import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/navigation/widgets/centered_logo_section.dart';
import 'package:marketinya/core/navigation/widgets/divider_line.dart';

class BottomDividerAndLabel extends StatelessWidget {
  const BottomDividerAndLabel({
    super.key,
    required this.logoWidth,
    required this.dividerHeight,
  });

  final double logoWidth;
  final double dividerHeight;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoAreaWidth = logoWidth + lg;
    final availableWidth = screenWidth - logoAreaWidth;
    final sideWidth = availableWidth / nano;

    return Padding(
      padding: dimen.top.nano,
      child: Column(
        children: [
          Row(
            children: [
              DividerLine(width: sideWidth, height: dividerHeight),
              CenteredLogoSection(width: logoAreaWidth),
              DividerLine(width: sideWidth, height: dividerHeight),
            ],
          ),
           Padding(
            padding: dimen.top.nano,
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
