import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/cell.dart';

class ClientsTableHeader extends StatelessWidget {
  const ClientsTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.dustyOlive,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: xxs,
        horizontal: xs,
      ),
      child: const Row(
        children: [
          Cell(label: '№', flex: 0.5, isHeaderCell: true),
          Cell(label: 'Фирма', flex: 2, isHeaderCell: true),
          Cell(label: 'ЕИК', flex: 1, isHeaderCell: true),
          Cell(label: 'Име', flex: 1, isHeaderCell: true),
          Cell(label: 'Телефон', flex: 1, isHeaderCell: true),
          Cell(label: 'Сектор', flex: 1, isHeaderCell: true),
          Cell(label: 'Статус', flex: 1, isHeaderCell: true),
          Cell(label: 'Приоритет', flex: 0.75, isHeaderCell: true, isCentered: true),
        ],
      ),
    );
  }
}
