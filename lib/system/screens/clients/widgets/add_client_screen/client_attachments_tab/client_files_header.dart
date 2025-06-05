import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/extensions/context_extension.dart';

class ClientFilesHeader extends StatelessWidget {
  const ClientFilesHeader({super.key});

  static const double _buttonWidth = 120.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: _buttonWidth,
              child: PrimaryButton.responsive(
                icon: const Icon(Icons.arrow_back),
                title: 'Назад',
                backgroundColor: AppColors.oliveGreen,
                activeTitleColor: Colors.white,
                onPressed: () => context.pop(),
              ),
            ),
          ],
        ),
        const SizedBox(height: lg),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Профил на клиента',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              width: imageWidth + lg,
              child: Divider(thickness: nano, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
