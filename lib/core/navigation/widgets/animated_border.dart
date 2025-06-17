import 'package:flutter/material.dart';

class AnimatedBorder extends StatelessWidget {
  const AnimatedBorder({
    super.key,
    required this.isVisible,
    required this.height,
  });

  final bool isVisible;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isVisible ? 2 : 0,
      height: height,
      color: const Color.fromARGB(55, 158, 158, 158),
    );
  }
}
