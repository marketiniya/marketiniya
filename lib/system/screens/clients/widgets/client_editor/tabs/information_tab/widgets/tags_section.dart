import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/button/square_add_button.dart';
import 'package:marketinya/core/models/tags.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({super.key});

  static const List<Tag> _tags = [
    Tag(id: '1', label: 'Важен клиент', color: Color(0xFFE57373)),
    Tag(id: '2', label: 'VIP', color: Color(0xFF81C784)),
    Tag(id: '3', label: 'Нов', color: Color(0xFF64B5F6)),
    Tag(id: '4', label: 'Потенциален', color: Color(0xFFFFB74D)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Етикети',
          style: TextStyle(
            fontSize: sm,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: xs),
        Row(
          children: [
            ..._tags.map((tag) => Padding(
              padding: const EdgeInsets.only(right: xs),
              child: Container(
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
              ),
            ),),
            SquareAddButton(
              onPressed: () {
                // TODO(Anybody): Implement add tag logic
              },
            ),
            const Spacer(), // This will push everything to align with the full width
          ],
        ),
      ],
    );
  }
}