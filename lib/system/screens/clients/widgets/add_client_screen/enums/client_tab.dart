import 'package:flutter/material.dart';

enum ClientTab {
  information(0, 'Клиенти', Icons.group),
  attachments(1, 'Прикачени файлове', Icons.attach_file_outlined);

  const ClientTab(this.tabIndex, this.label, this.icon);

  final int tabIndex;
  final String label;
  final IconData icon;
}
