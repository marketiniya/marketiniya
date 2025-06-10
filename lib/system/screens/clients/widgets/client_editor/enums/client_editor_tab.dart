import 'package:flutter/material.dart';

enum ClientEditorTab {
  information(0, 'Инфо', Icons.info_outline),
  attachments(1, 'Прикачени файлове', Icons.attach_file_outlined);

  const ClientEditorTab(this.tabIndex, this.label, this.icon);

  final int tabIndex;
  final String label;
  final IconData icon;
}
