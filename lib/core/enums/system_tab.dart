import 'package:flutter/material.dart';

enum SystemTab {
  clients('Клиенти', Icons.group_outlined, true),
  team('Екип', Icons.workspaces_outlined, false),
  orders('Поръчки', Icons.shopping_bag_outlined, false),
  tasks('Задачи', Icons.paste, false),
  services('Услуги', Icons.design_services_outlined, false),
  calendar('Календар', Icons.calendar_month_outlined, false),
  labels('Етикети', Icons.bookmark_border, false),
  profile('Моя профил', Icons.account_circle_outlined, false),
  history('История', Icons.history, false);

  final String label;
  final IconData icon;
  final bool isEnabled;

  const SystemTab(this.label, this.icon, this.isEnabled);
}
