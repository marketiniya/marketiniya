import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.title,
    required this.child,
    this.actionButton,
  });

  final String title;
  final Widget child;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: xs,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            if (actionButton != null) ...[
              const SizedBox(width: xs),
              actionButton!,
            ],
          ],
        ),
        const SizedBox(height: sm),
        child,
      ],
    );
  }
}
