import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/fields.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/models/social_media_link.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_bloc.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_event.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/bloc/add_client_state.dart';

class SocialMediaLinksSection extends StatefulWidget {
  const SocialMediaLinksSection({super.key});

  @override
  State<SocialMediaLinksSection> createState() =>
      _SocialMediaLinksSectionState();
}

class _SocialMediaLinksSectionState extends State<SocialMediaLinksSection> {
  static const int _maxLinks = 7;
  final Map<int, String> _fieldValues = {};

  String _detectPlatform(String url) {
    if (url.isEmpty) {
      return 'website';
    }

    final cleanUrl = url.toLowerCase().trim();

    final domainRegex = RegExp(r'^(?:https?://)?(?:www\.)?([^/]+)');
    final match = domainRegex.firstMatch(cleanUrl);

    if (match == null) {
      return 'website';
    }

    var domain = match.group(1) ?? '';

    if (domain.startsWith('www.')) {
      domain = domain.substring(4);
    }

    final platformPatterns = {
      'facebook': RegExp(r'^(facebook\.com|fb\.com)$'),
      'instagram': RegExp(r'^(instagram\.com|ig\.com)$'),
      'twitter': RegExp(r'^(twitter\.com|x\.com)$'),
      'linkedin': RegExp(r'^linkedin\.com$'),
      'youtube': RegExp(r'^(youtube\.com|youtu\.be)$'),
      'tiktok': RegExp(r'^tiktok\.com$'),
      'pinterest': RegExp(r'^pinterest\.com$'),
      'snapchat': RegExp(r'^snapchat\.com$'),
      'telegram': RegExp(r'^(t\.me|telegram\.org)$'),
      'whatsapp': RegExp(r'^(wa\.me|whatsapp\.com)$'),
      'discord': RegExp(r'^discord\.(gg|com)$'),
      'reddit': RegExp(r'^reddit\.com$'),
      'github': RegExp(r'^github\.com$'),
    };

    for (final entry in platformPatterns.entries) {
      if (entry.value.hasMatch(domain)) {
        return entry.key;
      }
    }

    return 'website';
  }

  void _addNewField(BuildContext context, List<SocialMediaLink> currentLinks) {
    if (currentLinks.length < _maxLinks) {
      final newLinks = List<SocialMediaLink>.from(currentLinks);
      newLinks.add(const SocialMediaLink(platform: '', url: ''));

      // Add empty value for new field
      _fieldValues[currentLinks.length] = '';

      context.read<AddClientBloc>().add(
            AddClientEvent.socialLinksChanged(newLinks),
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

    context.read<AddClientBloc>().add(
          AddClientEvent.socialLinksChanged(newLinks),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddClientBloc, AddClientState>(
      builder: (context, state) {
        // Initialize field values from state if not already set
        for (var i = 0; i < state.socialLinks.length; i++) {
          if (!_fieldValues.containsKey(i)) {
            _fieldValues[i] = state.socialLinks[i].url;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    'Линкове към социални мрежи',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: xs,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                if (state.socialLinks.length < _maxLinks)
                  Padding(
                    padding: const EdgeInsets.only(top: micro, left: xs),
                    child: _HoverableIcon(
                      icon: Icons.add,
                      size: 18,
                      defaultColor: Colors.green,
                      hoverColor: Colors.green[700]!,
                      onTap: () => _addNewField(context, state.socialLinks),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: sm),
            // Social links list
            if (state.socialLinks.isNotEmpty)
              ...List.generate(
                state.socialLinks.length,
                (index) {
                  final link = state.socialLinks[index];
                  final currentValue = _fieldValues[index] ?? link.url;
                  final platform = _detectPlatform(currentValue);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: sm),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        const preferredWidth = 350.0;
                        const buttonWidth = 20.0; // Icon size
                        const spacingWidth = 8.0; // xxs spacing
                        final availableWidth =
                            constraints.maxWidth - buttonWidth - spacingWidth;
                        final fieldWidth = availableWidth > preferredWidth
                            ? preferredWidth
                            : availableWidth;

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: fieldWidth,
                              child: CustomTextFormField(
                                key: ValueKey('social_link_${link.url}_$index'),
                                hintText: 'Въведете линк към социална мрежа',
                                labelText: platform != 'website'
                                    ? '${platform.substring(0, 1).toUpperCase()}${platform.substring(1)}'
                                    : 'Link ${index + 1}',
                                value: currentValue,
                                onSaved: (value) {
                                  _fieldValues[index] = value?.trim() ?? '';

                                  if (index == state.socialLinks.length - 1) {
                                    final updatedLinks = <SocialMediaLink>[];

                                    for (var i = 0;
                                        i < state.socialLinks.length;
                                        i++) {
                                      final fieldValue = _fieldValues[i] ?? '';
                                      if (fieldValue.isNotEmpty) {
                                        updatedLinks.add(
                                          SocialMediaLink(
                                            platform:
                                                _detectPlatform(fieldValue),
                                            url: fieldValue,
                                          ),
                                        );
                                      }
                                    }
                                    context.read<AddClientBloc>().add(
                                          AddClientEvent.socialLinksChanged(
                                            updatedLinks,
                                          ),
                                        );
                                  }
                                },
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
                              child: _HoverableIcon(
                                icon: Icons.remove_circle_outline,
                                size: 20,
                                defaultColor: Colors.red,
                                hoverColor: Colors.red[700]!,
                                onTap: () => _removeField(
                                  context,
                                  state.socialLinks,
                                  index,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}

class _HoverableIcon extends StatefulWidget {
  const _HoverableIcon({
    required this.icon,
    required this.size,
    required this.defaultColor,
    required this.hoverColor,
    required this.onTap,
  });

  final IconData icon;
  final double size;
  final Color defaultColor;
  final Color hoverColor;
  final VoidCallback onTap;

  @override
  State<_HoverableIcon> createState() => _HoverableIconState();
}

class _HoverableIconState extends State<_HoverableIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          child: Icon(
            widget.icon,
            color: _isHovered ? widget.hoverColor : widget.defaultColor,
            size: widget.size,
          ),
        ),
      ),
    );
  }
}
