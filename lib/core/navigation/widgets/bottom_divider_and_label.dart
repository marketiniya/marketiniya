import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/utils/image_utils.dart';

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
    final logoAreaWidth = logoWidth + 40;
    final availableWidth = screenWidth - logoAreaWidth;
    final sideWidth = availableWidth / 2;

    return Padding(
      padding: const EdgeInsets.only(top: 4), // Reduced padding to bring divider closer to logo
      child: Column(
        children: [
          Row(
            children: [
              // Left divider line
              Container(
                width: sideWidth,
                height: dividerHeight,
                color: Theme.of(context).colorScheme.secondary,
              ),
              // Center area with logo space and label
              SizedBox(
                width: logoAreaWidth,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(ImageUtils.marketinyaLabelPath),
                  ),
                ),
              ),
              // Right divider line
              Container(
                width: sideWidth,
                height: dividerHeight,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
           Padding(
            padding: const EdgeInsets.only(top: 2),
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
