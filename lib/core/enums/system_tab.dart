import 'package:flutter/material.dart';

enum SystemTab {
  clients('Клиенти', Icons.group_outlined),
  team('Екип', Icons.workspaces_outlined),
  orders('Поръчки', Icons.shopping_bag_outlined),
  tasks('Задачи', Icons.paste),
  services('Услуги', Icons.design_services_outlined),
  calendar('Календар', Icons.calendar_month_outlined),
  labels('Етикети', Icons.bookmark_border),
  profile('Моя профил', Icons.account_circle_outlined),
  history('История', Icons.history);

  final String label;
  final IconData icon;

  const SystemTab(this.label, this.icon);
}
