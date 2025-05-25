import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/molecules/image/svg_image/svg_image.dart';

/// Centralized repository for images in `assets/images/tide_images` folder
///
/// Adding New Images:
/// 1. Place files in `assets/images/tide_images`
/// 2. Add static constants in alphabetical order
/// 3. Update PortalImagesDemo in KS
class MarketiniyaImages {
  static SvgImage marketiniyaLogo({double? width, double? height}) =>
      SvgImage.asset(
        'assets/marketinya-logo.svg',
        width: width,
        height: height,
      );

  static SvgImage marketiniyaLabelBacl({double? width, double? height, Color? color}) =>
      SvgImage.asset(
        'assets/marketiniya-label-black.svg',
        width: width,
        height: height,
        color: color,
      );
}
