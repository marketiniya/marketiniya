import 'package:flutter/material.dart';

class ThreeColumnLayout extends StatelessWidget {
  const ThreeColumnLayout({
    super.key,
    required this.leftColumn,
    required this.centerColumn,
    required this.rightColumn,
  });

  final Widget leftColumn;
  final Widget centerColumn;
  final Widget rightColumn;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = constraints.maxWidth * 0.02;
        final totalSpacing = spacing * 2; // Two gaps between three columns
        final availableWidth = constraints.maxWidth - totalSpacing;
        final columnWidth = availableWidth / 3; // Equal width for all three columns

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: columnWidth,
              child: leftColumn,
            ),
            SizedBox(width: spacing),
            SizedBox(
              width: columnWidth,
              child: centerColumn,
            ),
            SizedBox(width: spacing),
            SizedBox(
              width: columnWidth,
              child: rightColumn,
            ),
          ],
        );
      },
    );
  }
}
