import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/models/tags.dart';
import 'package:marketinya/system/screens/clients/widgets/square_add_button.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({
    super.key,
    required this.tags,
    required this.onAddTag,
  });

  final List<Tag> tags;
  final VoidCallback onAddTag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Етикети',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: sm),
        if (tags.isEmpty)
          SquareAddButton(onPressed: onAddTag)
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (tags.length > 4)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < tags.length ~/ 2; i++) ...[
                          _buildTag(tags[i]),
                          const SizedBox(height: xs),
                        ],
                      ],
                    ),
                    const SizedBox(width: xs),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = tags.length ~/ 2;
                            i < tags.length;
                            i++) ...[
                          _buildTag(tags[i]),
                          const SizedBox(height: xs),
                        ],
                      ],
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var tag in tags) ...[
                      _buildTag(tag),
                      const SizedBox(height: xs),
                    ],
                  ],
                ),
              const SizedBox(height: micro),
              SquareAddButton(onPressed: onAddTag),
            ],
          ),
      ],
    );
  }

  Widget _buildTag(Tag tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: sm, vertical: xxs),
      decoration: BoxDecoration(
        color: tag.color,
        borderRadius: BorderRadius.circular(xxs),
      ),
      child: Text(
        tag.label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
