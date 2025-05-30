import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/colors.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
    this.colors,
    this.width = double.infinity,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.height,
  });

  final double? width;
  final double? height;
  final Widget child;
  final Alignment begin;
  final Alignment end;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors ??
              [
                primary100.withValues(alpha: tiny),
                primary200,
                primary300,
              ],
          stops: const [0.5, 0.75, 1],
        ),
      ),
      child: child,
    );
  }
}
