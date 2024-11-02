import 'package:flutter/material.dart';

class SpaceBox extends StatelessWidget {
  const SpaceBox({super.key, required this.height, required this.color});
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: height, color: color);
  }
}
