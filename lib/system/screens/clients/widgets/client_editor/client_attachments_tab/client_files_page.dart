import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
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
                    Icons.picture_as_pdf,
                    showDivider: true,
                  ),
                  _buildFileSection(
                    'TXT',
                    Icons.description,
                    showDivider: true,
                  ),
                  _buildFileSection(
                    'Image',
                    Icons.image,
                    showDivider: true,
                  ),
                  _buildFileSection(
                    'Video',
                    Icons.videocam,
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
    String title,
    IconData icon, {
    bool showDivider = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
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
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // File placeholders
                    _buildFilePlaceholder('#FileName'),
                    const SizedBox(width: md),
                    _buildFilePlaceholder('#FileName'),
                    const SizedBox(width: md),
                    _buildFilePlaceholder('#FileName'),
                    const Spacer(),
                    // Drag and drop text
                    const Text(
                      'Drag and drop a file',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(width: md),
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
                      child: Icon(
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

  Widget _buildFilePlaceholder(String fileName) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.dustyOlive,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.oliveGreen.withOpacity(0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.download,
            size: 22,
            color: AppColors.oliveGreen,
          ),
          const SizedBox(height: micro),
          Text(
            fileName,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: AppColors.oliveGreen,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _StripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    const stripeWidth = 4.0;
    const stripeSpacing = 8.0;

    // Draw diagonal stripes
    for (var i = -size.height;
        i < size.width + size.height;
        i += stripeWidth + stripeSpacing) {
      final path = Path();
      path.moveTo(i, 0);
      path.lineTo(i + stripeWidth, 0);
      path.lineTo(i + stripeWidth + size.height, size.height);
      path.lineTo(i + size.height, size.height);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
