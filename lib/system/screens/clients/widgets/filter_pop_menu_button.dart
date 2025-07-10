import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

enum TableColumn {
  company('Фирма'),
  companyId('ЕИК'),
  name('Име'),
  phone('Телефон'),
  sector('Сектор'),
  status('Статус'),
  priority('Приоритет');

  const TableColumn(this.label);

  final String label;
}

class FilterPopMenuButton extends StatefulWidget {
  const FilterPopMenuButton({super.key});

  @override
  State<FilterPopMenuButton> createState() => _FilterPopMenuButtonState();
}

class _FilterPopMenuButtonState extends State<FilterPopMenuButton> {
  final GlobalKey<PopupMenuButtonState<String>> popupMenuKey = GlobalKey();

  final Map<TableColumn, bool> _columnVisibility = {
    TableColumn.company: true,
    TableColumn.companyId: true,
    TableColumn.name: true,
    TableColumn.phone: true,
    TableColumn.sector: true,
    TableColumn.status: true,
    TableColumn.priority: true,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: PopupMenuButton<String>(
        key: popupMenuKey,
        elevation: xxsPlus,
        shadowColor: Colors.black,
        tooltip: '',
        padding: EdgeInsets.zero,
        position: PopupMenuPosition.under,
        icon: Container(
          decoration: BoxDecoration(
            color: AppColors.oliveGreen,
            borderRadius: BorderRadius.circular(xs),
          ),
          child: IconButton(
            onPressed: () => popupMenuKey.currentState?.showButtonMenu(),
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.white,
            ),
          ),
        ),
        color: AppColors.lightOlive,
        constraints: const BoxConstraints(maxWidth: 200),
        itemBuilder: (context) => [
          const PopupMenuItem<String>(
            enabled: false,
            child: Center(
              child: Text(
                'Филтър',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const PopupMenuDivider(),
          // Checkboxes
          ..._columnVisibility.entries.map((entry) {
            return PopupMenuItem<String>(
              onTap: null,
              child: _FilterCheckboxItem(
                column: entry.key,
                isVisible: entry.value,
                onChanged: (value) {
                  setState(() {
                    _columnVisibility[entry.key] = value;
                  });
                },
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class _FilterCheckboxItem extends StatefulWidget {
  const _FilterCheckboxItem({
    required this.column,
    required this.isVisible,
    required this.onChanged,
  });

  final TableColumn column;
  final bool isVisible;
  final Function(bool) onChanged;

  @override
  State<_FilterCheckboxItem> createState() => _FilterCheckboxItemState();
}

class _FilterCheckboxItemState extends State<_FilterCheckboxItem> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isVisible;
  }

  @override
  void didUpdateWidget(_FilterCheckboxItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isVisible != widget.isVisible) {
      _isChecked = widget.isVisible;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: _toggleCheckbox,
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.column.label,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: xs,
                ),
              ),
            ),
          ),
          Checkbox(
            value: _isChecked,
            onChanged: (value) => _toggleCheckbox(),
            activeColor: AppColors.oliveGreen,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged(_isChecked);
  }
}
