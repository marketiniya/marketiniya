import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/widgets/file_placeholder.dart';

class FileSection extends StatefulWidget {
  const FileSection({
    super.key,
    required this.title,
    this.showDivider = true,
  });

  final String title;
  final bool showDivider;

  @override
  State<FileSection> createState() => _FileSectionState();
}

class _FileSectionState extends State<FileSection> {
  late DropzoneViewController _dropzoneController;
  bool _isDragOver = false;
  final List<String> _uploadedFiles = [];

  void _onDropzoneCreated(DropzoneViewController controller) {
    _dropzoneController = controller;
  }

  Future<void> _onDrop(dynamic event) async {
    setState(() {
      _isDragOver = false; // Remove highlight immediately on drop
    });

    try {
      print('File dropped in ${widget.title} section');
      setState(() {
        _uploadedFiles.add('dropped_file_${DateTime.now().millisecondsSinceEpoch}');
      });
    } catch (e) {
      print('Error handling dropped file: $e');
    }
  }

  void _onHover() {
    setState(() {
      _isDragOver = true;
    });
  }

  void _onLeave() {
    setState(() {
      _isDragOver = false;
    });
  }

  void _handleUploadClick() async {
    try {
      final files = await _dropzoneController.pickFiles(multiple: true);
      if (files.isNotEmpty) {
        setState(() {
          _uploadedFiles.addAll(files.map((f) => 'picked_file_${DateTime.now().millisecondsSinceEpoch}'));
        });
        print('Files picked for ${widget.title} section: ${files.length}');
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: xs),
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isDragOver
                ? AppColors.oliveGreen
                : Colors.grey.withOpacity(0.3),
              width: _isDragOver ? 2 : 1,
            ),
            color: _isDragOver
              ? AppColors.oliveGreen.withOpacity(0.1)
              : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                // Dropzone for drag and drop
                DropzoneView(
                  onCreated: _onDropzoneCreated,
                  onDrop: _onDrop,
                  onHover: _onHover,
                  onLeave: _onLeave,
                ),
                // Content overlay with stripes
                CustomPaint(
                  painter: _StripePainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        // File placeholders
                        FilePlaceholder(fileName: '#FileName', fileType: widget.title),
                        const SizedBox(width: md),
                        FilePlaceholder(fileName: '#FileName', fileType: widget.title),
                        const SizedBox(width: md),
                        FilePlaceholder(fileName: '#FileName', fileType: widget.title),
                        const Spacer(),
                        // Drag and drop text (inline)
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
                        GestureDetector(
                          onTap: _handleUploadClick,
                          child: Container(
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.showDivider) ...[
          Padding(
            padding: dimen.top.xs + dimen.bottom.xs,
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
    // Draw diagonal stripes only
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
