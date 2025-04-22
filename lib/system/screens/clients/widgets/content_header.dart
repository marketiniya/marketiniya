import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/add_client_screen.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({super.key});

  static const _searchFieldWidth = 360.0;
  static const _spacingBetweenFilterAndAdd = 56.0;
  static const _verticalOffset = -10.0;
  static const _filterButtonColor = Color(0xFF708445);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(180, 0, 180, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(
            width: 100,
            child: Divider(thickness: nano, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: lg),
            child: Row(
              children: [
                _buildSearchField(),
                const SizedBox(width: sm),
                _buildFilterButton(),
                const SizedBox(width: _spacingBetweenFilterAndAdd),
                _buildAddClientButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Клиенти',
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return const SizedBox(
      width: _searchFieldWidth,
      child: CustomTextFormField(
        labelText: 'Търси',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        keyboardType: TextInputType.name,
        suffixIcon: Icons.search,
        borderRadius: lg,
        filledColor: AppColors.mutedOlive,
      ),
    );
  }

  Widget _buildFilterButton() {
    return Transform.translate(
      offset: const Offset(none, _verticalOffset),
      child: Container(
        decoration: BoxDecoration(
          color: _filterButtonColor,
          borderRadius: BorderRadius.circular(xxsPlus),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAddClientButton(BuildContext context) {
    return Transform.translate(
      offset: const Offset(none, _verticalOffset),
      child: PrimaryButton.responsive(
        icon: const Icon(Icons.add),
        title: 'Добави Клиент',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddClientScreen(),
            ),
          );
        },
        backgroundColor: _filterButtonColor,
        activeTitleColor: Colors.white,
      ),
    );
  }
}
