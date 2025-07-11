import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/molecules/image/svg_image/svg_image.dart';

class MarketiniyaIcons {
  MarketiniyaIcons._();

  static Widget info({Color? color, double? width, double? height}) =>
      SvgImage.asset(
        'assets/icons/information.svg',
        width: width,
        height: height,
        color: color,
      );

  static Widget filter({Color? color, double? width, double? height}) =>
      SvgImage.asset(
        'assets/icons/filter.svg',
        width: width,
        height: height,
        color: color,
      );
}
