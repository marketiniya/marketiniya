import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class FileSectionContainer extends StatelessWidget {
  const FileSectionContainer({
    super.key,
    required this.child,
    this.isDragOver = false,
    this.hasError = false,
  });

  final Widget child;
  final bool isDragOver;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 103),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(xxs),
        border: Border.all(
          color: isDragOver
              ? AppColors.oliveGreen
              : hasError
                  ? Colors.red
                  : Colors.grey.withValues(alpha: 0.3),
          width: isDragOver || hasError ? 2 : 1,
        ),
        color: isDragOver
            ? AppColors.oliveGreen.withValues(alpha: 0.1)
            : hasError
                ? Colors.red.withValues(alpha: 0.1)
                : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(xxs),
        child: CustomPaint(
          painter: _StripePainter(),
          child: Padding(
            padding: const EdgeInsets.all(xxsPlus),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _StripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw diagonal stripes only
    final stripePaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    const stripeWidth = nano;
    const stripeSpacing = xxs;

    for (var i = -size.height;
        i < size.width + size.height;
        i += stripeWidth + stripeSpacing) {
      final path = Path();
      path.moveTo(i, 0);
      path.lineTo(i + stripeWidth, 0);
      path.lineTo(i + stripeWidth + size.height, size.height);
      path.lineTo(i + size.height, size.height);
      path.close();
      canvas.drawPath(path, stripePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
