import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/shared/layout/three_column_layout.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/widgets/form_columns/left_column_form.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/widgets/form_columns/middle_column_form.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/widgets/social_media_links_section.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/widgets/tags_section.dart';

class ContentForm extends StatelessWidget {
  const ContentForm({
    super.key,
    required this.formKey,
    required this.state,
  });

  final GlobalKey<FormState> formKey;
  final ClientEditorState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ThreeColumnLayout(
          leftColumn: LeftColumnForm(state: state),
          centerColumn: MiddleColumnForm(state: state),
          rightColumn: const SocialMediaLinksSection(),
        ),
        const SizedBox(height: sm),
        const TagsSection(),
        const SizedBox(height: sm),
        CustomTextFormField(
          value: state.description,
          labelText: 'Описание',
          keyboardType: TextInputType.multiline,
          onSaved: (value) {
            if (value != null) {
              context.read<ClientEditorBloc>().add(
                    ClientEditorEvent.descriptionChanged(value),
                  );
            }
          },
          contentPadding: const EdgeInsets.all(sm),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          borderRadius: xs,
          borderColor: AppColors.oliveGreen,
          maxLines: 3,
        ),
      ],
    );
  }
}
