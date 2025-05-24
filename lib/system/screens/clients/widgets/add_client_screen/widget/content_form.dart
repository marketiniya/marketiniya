import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_event.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/bloc/add_client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/information_form.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/social_media_links_section.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/widget/tags_section.dart';

class ContentForm extends StatelessWidget {
  const ContentForm({
    super.key,
    required this.formKey,
    required this.state,
  });

  final GlobalKey<FormState> formKey;
  final AddClientState state;
  static const double _inputWidth = 360.0;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddClientBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InformationForm(state: state),
            const SizedBox(width: xxxl * 2),
            const TagsSection(),
            const SizedBox(width: xxxl * 2),
            const SocialMediaLinksSection(),
          ],
        ),
        Padding(
          padding: dimen.top.xs,
          child: SizedBox(
            width: _inputWidth * nano + lg,
            child: CustomTextFormField(
              value: state.description,
              padding: dimen.top.xxs,
              labelText: 'Описание',
              keyboardType: TextInputType.multiline,
              onSaved: (value) {
                if (value != null) {
                  bloc.add(AddClientEvent.descriptionChanged(value));
                }
              },
              validator: FieldValidators.combine([
                FieldValidators.notEmpty(),
              ]),
              contentPadding: dimen.horizontal.sm + dimen.vertical.sm,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filledColor: AppColors.lightOlive,
              borderRadius: lg,
              maxLines: 5,
            ),
          ),
        )
      ],
    );
  }
}
