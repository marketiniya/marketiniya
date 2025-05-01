import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/pagination.dart';

class ClientsTableFooter extends StatelessWidget {
  const ClientsTableFooter({
    super.key,
    required this.itemsPerPage,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    required this.onRowsPerPageChanged,
  });

  final int itemsPerPage;
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int?> onRowsPerPageChanged;

  static const List<int> _availableRowsPerPage = [10, 15, 25, 50, 100];
  static const _rowTextStyle = TextStyle(
    color: Colors.black87,
    fontSize: xxsPlus,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRowsPerPageSelector(),
        Pagination(
          currentPage: currentPage,
          totalPages: totalPages,
          onPageChanged: onPageChanged,
        ),
      ],
    );
  }

  Widget _buildRowsPerPageSelector() {
    return Row(
      children: [
        const Text('Редове на страница:', style: _rowTextStyle),
        const SizedBox(width: xxs),
        Container(
          height: sm,
          padding: const EdgeInsets.symmetric(horizontal: xxs),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: itemsPerPage,
              isDense: true,
              focusColor: Colors.transparent,
              items: _availableRowsPerPage.map(_buildDropdownItem).toList(),
              onChanged: onRowsPerPageChanged,
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<int> _buildDropdownItem(int count) {
    return DropdownMenuItem(
      value: count,
      child: Text(count.toString(), style: _rowTextStyle),
    );
  }
}
