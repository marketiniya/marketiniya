import 'package:flutter/material.dart';
import 'package:marketinya/core/models/tags.dart';
import 'package:marketinya/system/screens/clients/widgets/tags_widget.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({super.key});

  static const List<Tag> _tags = [
    Tag(id: '1', label: 'Важен клиент', color: Color(0xFFE57373)),
    Tag(id: '2', label: 'ВИП', color: Color(0xFF81C784)),
    Tag(id: '3', label: 'Нов', color: Color(0xFF64B5F6)),
    Tag(id: '4', label: 'Потенциален', color: Color(0xFFFFB74D)),
    Tag(id: '5', label: 'Tag 5', color: Color(0xFFBA68C8)),
    Tag(id: '6', label: 'Tag 6', color: Color(0xFF4DB6AC)),
    Tag(id: '7', label: 'Tag 7', color: Color(0xFFFFB74D)),
    Tag(id: '8', label: 'Tag 8', color: Color(0xFF90A4AE)),
  ];

  @override
  Widget build(BuildContext context) {
    return TagsWidget(
      tags: _tags,
      onAddTag: () {
        // TODO: Implement add tag logic
      },
    );
  }
}