import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SvgImage extends Widget {
  const factory SvgImage.asset(
    String assetName, {
    String? package,
    Color? color,
    double? height,
    double? width,
    String? semanticsLabel,
    Widget? placeholder,
    Key? key,
  }) = _SvgAssetImage;

  String get assetName;

  Future<PictureInfo> get imageInfo;

  Color? get color;

  Widget? get placeholder;
}

class _SvgAssetImage extends StatelessWidget implements SvgImage {
  const _SvgAssetImage(
    this.assetName, {
    super.key,
    this.package,
    this.color,
    this.height,
    this.width,
    this.semanticsLabel,
    this.placeholder,
  });

  @override
  final String assetName;

  @override
  final Color? color;

  @override
  final Widget? placeholder;

  final String? package;
  final double? height;
  final double? width;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) => Semantics(
        label: semanticsLabel,
        child: _image,
      );

  SvgPicture get _image => SvgPicture.asset(
        assetName,
        package: package,
        colorFilter: color != null
            ? ui.ColorFilter.mode(color!, ui.BlendMode.srcIn)
            : null,
        height: height,
        width: width,
        excludeFromSemantics: true,
        placeholderBuilder: placeholder != null ? (_) => placeholder! : null,
      );

  @override
  Future<PictureInfo> get imageInfo => vg.loadPicture(_image.bytesLoader, null);
}
