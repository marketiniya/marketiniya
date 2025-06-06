import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_placeholder.dart';

class FileSection extends StatelessWidget {
  const FileSection({
    super.key,
    required this.title,
    this.showDivider = true,
  });

  final String title;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: xs,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: xxsPlus),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(xxs),
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(xxs),
            child: CustomPaint(
              painter: _StripePainter(),
              child: Padding(
                padding: const EdgeInsets.all(xxsPlus),
                child: Row(
                  children: [
                    // File placeholders
                    FilePlaceholder(fileName: '#FileName', fileType: title),
                    const SizedBox(width: md),
                    FilePlaceholder(fileName: '#FileName', fileType: title),
                    const SizedBox(width: md),
                    FilePlaceholder(fileName: '#FileName', fileType: title),
                    const Spacer(),
                    // Upload icon
                    Container(
                      padding: const EdgeInsets.all(micro),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(micro),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.file_upload_outlined,
                        size: sm,
                        color: AppColors.oliveGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (showDivider) ...[
          Padding(
            padding: dimen.top.sm + dimen.bottom.xs,
            child: const Divider(
              height: 1,
              thickness: 1,
              color: Colors.black,
            ),
          ),
        ],
      ],
    );
  }
}

class _StripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw diagonal stripes
    final stripePaint = Paint()
      ..color = Colors.grey.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    const stripeWidth = micro;
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

    // Draw centered text
    const textStyle = TextStyle(
      fontSize: xs - nano,
      color: Colors.grey,
      fontWeight: FontWeight.w300,
    );

    const textSpan = TextSpan(
      text: 'Drag and drop a file',
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final textOffset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
