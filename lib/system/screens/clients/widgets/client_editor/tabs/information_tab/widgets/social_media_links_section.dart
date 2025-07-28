import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/molecules/icons/hoverable_icon.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/models/social_media_link.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/client_editor_state.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/shared/layout/form_section.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/constants/social_media_constants.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/services/platform_detector_service.dart';

class SocialMediaLinksSection extends StatefulWidget {
  const SocialMediaLinksSection({super.key});

  @override
  State<SocialMediaLinksSection> createState() =>
      _SocialMediaLinksSectionState();
}

class _SocialMediaLinksSectionState extends State<SocialMediaLinksSection> {
  final Map<int, String> _fieldValues = {};

  void _addNewField(BuildContext context, List<SocialMediaLink> currentLinks) {
    if (currentLinks.length < SocialMediaConstants.maxLinks) {
      final newLinks = List<SocialMediaLink>.from(currentLinks);
      newLinks.add(const SocialMediaLink(platform: '', url: ''));

      _fieldValues[currentLinks.length] = '';

      context.read<ClientEditorBloc>().add(
            ClientEditorEvent.socialLinksChanged(newLinks),
          );
    }
  }

  void _removeField(
    BuildContext context,
    List<SocialMediaLink> currentLinks,
    int index,
  ) {
    final newLinks = List<SocialMediaLink>.from(currentLinks);
    newLinks.removeAt(index);

    // Clear field values and let them be re-initialized from the new state
    _fieldValues.clear();

    context.read<ClientEditorBloc>().add(
          ClientEditorEvent.socialLinksChanged(newLinks),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientEditorBloc, ClientEditorState>(
      builder: (context, state) {
        _initializeFieldValues(state);

        return FormSection(
          title: 'Линкове към социални мрежи',
          actionButton: state.socialLinks.length < SocialMediaConstants.maxLinks
              ? Padding(
                  padding: const EdgeInsets.only(top: micro),
                  child: HoverableIcon(
                    icon: Icons.add,
                    size: 18,
                    defaultColor: Colors.green,
                    hoverColor: Colors.green[700]!,
                    onTap: () => _addNewField(context, state.socialLinks),
                  ),
                )
              : null,
          child: state.socialLinks.isEmpty
              ? const SizedBox.shrink()
              : Column(
                  children: List.generate(
                    state.socialLinks.length,
                    (index) {
                      final link = state.socialLinks[index];
                      final currentValue = _fieldValues[index] ?? link.url;
                      final platform =
                          PlatformDetectorService.detectPlatform(currentValue);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: sm),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                key: ValueKey('social_link_${link.url}_$index'),
                                hintText: 'Въведете линк към социална мрежа',
                                labelText:
                                    PlatformDetectorService.formatPlatformLabel(
                                        platform, index,),
                                value: currentValue,
                                onSaved: (value) =>
                                    _handleFieldSave(value, index, state),
                                validator: FieldValidators.combine([
                                  FieldValidators.notEmpty(),
                                  FieldValidators.url(),
                                ]),
                                borderRadius: xs,
                                borderColor: AppColors.oliveGreen,
                              ),
                            ),
                            const SizedBox(width: xxs),
                            Padding(
                              padding: const EdgeInsets.only(top: xxsPlus),
                              child: HoverableIcon(
                                icon: Icons.remove_circle_outline,
                                size: 20,
                                defaultColor: Colors.red,
                                hoverColor: Colors.red[700]!,
                                onTap: () => _removeField(
                                    context, state.socialLinks, index,),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }

  void _initializeFieldValues(ClientEditorState state) {
    for (var i = 0; i < state.socialLinks.length; i++) {
      if (!_fieldValues.containsKey(i)) {
        _fieldValues[i] = state.socialLinks[i].url;
      }
    }
  }

  void _handleFieldSave(String? value, int index, ClientEditorState state) {
    _fieldValues[index] = value?.trim() ?? '';

    if (index == state.socialLinks.length - 1) {
      final updatedLinks = <SocialMediaLink>[];

      for (var i = 0; i < state.socialLinks.length; i++) {
        final fieldValue = _fieldValues[i] ?? '';
        if (fieldValue.isNotEmpty) {
          updatedLinks.add(
            SocialMediaLink(
              platform: PlatformDetectorService.detectPlatform(fieldValue),
              url: fieldValue,
            ),
          );
        }
      }
      context.read<ClientEditorBloc>().add(
            ClientEditorEvent.socialLinksChanged(updatedLinks),
          );
    }
  }
}
