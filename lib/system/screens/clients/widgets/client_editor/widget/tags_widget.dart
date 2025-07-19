import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/square_add_button.dart';
import 'package:marketinya/core/models/tags.dart';

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
              fontSize: xs,
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < tags.length ~/ 2; i++) ...[
                            _buildTag(tags[i]),
                            const SizedBox(height: xs),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: xs),
                    Expanded(
                      child: Column(
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
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final tag in tags) ...[
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
          fontSize: xxsPlus,
          fontWeight: FontWeight.w500,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
