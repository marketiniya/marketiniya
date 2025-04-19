import 'package:flutter/material.dart';

class SystemNavigationItem {
  final String label;
  final IconData icon;

  const SystemNavigationItem({
    required this.label,
    required this.icon,
  });
}

class SystemNavigationItems {
  static const List<SystemNavigationItem> items = [
    SystemNavigationItem(
      label: 'Клиенти',
      icon: Icons.people,
    ),
    SystemNavigationItem(
      label: 'Екип',
      icon: Icons.group,
    ),
    SystemNavigationItem(
      label: 'Поръчки',
      icon: Icons.shopping_cart,
    ),
    SystemNavigationItem(
      label: 'Задачи',
      icon: Icons.task,
    ),
    SystemNavigationItem(
      label: 'Услуги',
      icon: Icons.build,
    ),
    SystemNavigationItem(
      label: 'Календар',
      icon: Icons.calendar_today,
    ),
    SystemNavigationItem(
      label: 'Етикети',
      icon: Icons.label,
    ),
    SystemNavigationItem(
      label: 'Моя профил',
      icon: Icons.person,
    ),
    SystemNavigationItem(
      label: 'История',
      icon: Icons.history,
    ),
  ];

  SystemNavigationItems._();
}
