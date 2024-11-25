import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/image_utils.dart';

class MarketiniyaLogo extends StatelessWidget {
  const MarketiniyaLogo({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImageUtils.marketinyaLogoPath,
      width: width,
      height: height,
      semanticsLabel: 'Marketinya logo',
    );
  }
}
