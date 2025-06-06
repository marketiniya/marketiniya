import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/icons/file_type_icons.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/client_files_header.dart';

class ClientFilesPage extends StatelessWidget {
  const ClientFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ClientFilesHeader(),
        const SizedBox(height: lg),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 180),
            child: ListView(
              children: [
                  _buildFileSection(
                    'PDF',
                    showDivider: true,
                  ),
                  _buildFileSection(
                    'TXT',
                    showDivider: true,
                  ),
                  _buildFileSection(
                    'Image',
                    showDivider: true,
                  ),
                  _buildFileSection(
                    'Video',
                    showDivider: false,
                  ),
                  const SizedBox(height: lg),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFileSection(
    String title, {
    bool showDivider = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: xxsPlus),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomPaint(
              painter: _StripePainter(),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // File placeholders
                    _buildFilePlaceholder('#FileName', title),
                    const SizedBox(width: md),
                    _buildFilePlaceholder('#FileName', title),
                    const SizedBox(width: md),
                    _buildFilePlaceholder('#FileName', title),
                    const Spacer(),
                    // Upload icon
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
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
                        size: 24,
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

  Widget _buildFilePlaceholder(String fileName, String fileType) {
    return Column(
      children: [
        SizedBox(
          width: 70,
          height: 50,
          child: Center(
            child: FileTypeIcons.getIcon(fileType, size: 40),
          ),
        ),
        const SizedBox(height: micro),
        SizedBox(
          width: 70,
          child: Text(
            fileName,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
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

    const stripeWidth = 4.0;
    const stripeSpacing = 8.0;

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
      fontSize: 14,
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
