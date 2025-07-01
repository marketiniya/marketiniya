import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/utils/image_utils.dart';

class CenteredLogoSection extends StatelessWidget {
  const CenteredLogoSection({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Padding(
          padding: dimen.horizontal.xxsPlus,
          child: SvgPicture.asset(ImageUtils.marketinyaLabelPath),
        ),
      ),
    );
  }
}
