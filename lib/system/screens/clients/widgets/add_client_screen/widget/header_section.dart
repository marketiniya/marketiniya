import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/primary_button/primary_button.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_event.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/content_form.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<AddClientFormState> formKey;

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
                icon: const Icon(Icons.check),
                title: 'Добави',
                onPressed: () {
                  final formState = formKey.currentState;

                  if (formState?.formKey.currentState?.validate() ?? false) {
                    formState?.formKey.currentState?.save();
                    context
                        .read<AddClientBloc>()
                        .add(const AddClientEvent.save());
                  }
                },
                backgroundColor: AppColors.oliveGreen,
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
        )
      ],
    );
  }
}
