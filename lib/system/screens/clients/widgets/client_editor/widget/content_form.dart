import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/widget/information_form.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/widget/social_media_links_section.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/widget/tags_section.dart';

class ContentForm extends StatelessWidget {
  const ContentForm({
    super.key,
    required this.formKey,
    required this.state,
  });

  final GlobalKey<FormState> formKey;
  final AddClientState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddClientBloc>();

    return SizedBox(
      height: 800,
      child: ListView(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final informationFormWidth = constraints.maxWidth * 0.28;
              final tagsWidth = constraints.maxWidth * 0.22;
              final spacing = constraints.maxWidth * 0.04;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: informationFormWidth,
                    child: InformationForm(state: state),
                  ),
                  SizedBox(width: spacing),
                  SizedBox(
                    width: tagsWidth,
                    child: const TagsSection(),
                  ),
                  SizedBox(width: spacing),
                  const Expanded(
                    child: SocialMediaLinksSection(),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: sm),
          Padding(
            padding: const EdgeInsets.only(right: 180),
            child: CustomTextFormField(
              value: state.description,
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
              contentPadding: const EdgeInsets.all(sm),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              borderRadius: xs,
              borderColor: AppColors.oliveGreen,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
