import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: xl, horizontal: 180),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Клиенти',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            width: 100,
            child: Divider(thickness: 2, color: Colors.black),
          ),
          Padding(
            padding: dimen.vertical.lg,
            child: Row(
              children: [
                const SizedBox(
                  width: 360,
                  child: CustomTextFormField(
                    labelText: 'Търси',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    keyboardType: TextInputType.name,
                    suffixIcon: Icons.search,
                    borderRadius: lg,
                    filledColor: AppColors.mutedOlive,
                  ),
                ),
                const SizedBox(width: 24),
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF708445),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 56),
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: PrimaryButton.responsive(
                    icon: const Icon(Icons.add),
                    title: 'Добави Клиент',
                    onPressed: () {},
                    backgroundColor: const Color(0xFF708445),
                    activeTitleColor: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
