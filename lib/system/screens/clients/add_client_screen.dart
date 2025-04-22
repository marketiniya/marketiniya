import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/models/tags.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_drawer.dart';
import 'package:marketinya/system/screens/clients/widgets/tags_widget.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  static const double _buttonWidth = 120.0;
  static const double _inputWidth = 360.0;
  static const Color _inputColor = Color(0xFFD9D9C6);

  // Example tags list - this should come from your database
  static const List<Tag> _tags =  [
    Tag(id: '1', label: 'Важен клиент', color: const Color(0xFFE57373)),
    Tag(id: '2', label: 'ВИП', color: const Color(0xFF81C784)),
    Tag(id: '3', label: 'Нов', color: const Color(0xFF64B5F6)),
    Tag(id: '4', label: 'Потенциален', color: const Color(0xFFFFB74D)),
    Tag(id: '5', label: 'Tag 5', color: const Color(0xFFBA68C8)),
    Tag(id: '6', label: 'Tag 6', color: const Color(0xFF4DB6AC)),
    Tag(id: '7', label: 'Tag 7', color: const Color(0xFFFFB74D)),
    Tag(id: '8', label: 'Tag 8', color: const Color(0xFF90A4AE)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClientsDrawer(),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(180, xl, 180, lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: xl),
                    _buildHeader(context),
                    const SizedBox(height: lg),
                    _buildForm(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: _buttonWidth,
              child: PrimaryButton.responsive(
                icon: const Icon(Icons.check),
                title: 'Добави',
                onPressed: () {
                  // TODO: Implement add client logic
                  Navigator.of(context).pop();
                },
                backgroundColor: const Color(0xFF708445),
                activeTitleColor: Colors.white,
              ),
            ),
            const SizedBox(width: md),
            SizedBox(
              width: _buttonWidth,
              child: PrimaryButton.responsive(
                icon: const Icon(Icons.close),
                title: 'Отказ',
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
              width: 240,
              child: Divider(thickness: nano, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: _inputWidth,
                  child: CustomTextFormField(
                    labelText: 'Име / Фирма',
                    keyboardType: TextInputType.name,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filledColor: _inputColor,
                    borderRadius: lg,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: _inputWidth,
                  child: CustomTextFormField(
                    labelText: 'ЕГН / ЕИК',
                    keyboardType: TextInputType.number,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filledColor: _inputColor,
                    borderRadius: lg,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: _inputWidth,
                  child: CustomTextFormField(
                    labelText: 'Сектор',
                    suffixIcon: Icons.arrow_drop_down,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filledColor: _inputColor,
                    borderRadius: lg,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: _inputWidth,
                  child: CustomTextFormField(
                    labelText: 'Статус',
                    suffixIcon: Icons.arrow_drop_down,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filledColor: _inputColor,
                    borderRadius: lg,
                  ),
                ),
              ],
            ),
            const SizedBox(width: lg),
            TagsWidget(
              tags: _tags,
              onAddTag: () {
                // TODO: Implement add tag logic
              },
            ),
          ],
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: _inputWidth * 2 + lg,
              child: CustomTextFormField(
                labelText: 'Описание',
                filledColor: _inputColor,
                borderRadius: lg,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
