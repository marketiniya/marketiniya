import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/icons/marketiniya_icons.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/bloc/client_bloc.dart';
import 'package:marketinya/system/screens/clients/bloc/client_state.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

enum Filter {
  company('Фирма'),
  companyId('ЕИК'),
  name('Име'),
  phone('Телефон'),
  sector('Сектор'),
  status('Статус'),
  priority('Приоритет');

  const Filter(this.label);

  final String label;

  // All filter options enabled by default
  static const List<Filter> defaultSelected = Filter.values;
}

class FilterMultiDropdown extends StatelessWidget {
  const FilterMultiDropdown({super.key});

  List<DropdownItem<Filter>> get _dropdownItems => Filter.values
      .map(
        (column) => DropdownItem<Filter>(
          label: column.label,
          value: column,
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            width: imageWidth,
            height: 45,
            child: Stack(
              children: [
                MultiDropdown<Filter>(
                  items: _dropdownItems
                      .map(
                        (item) => DropdownItem<Filter>(
                          label: item.label,
                          value: item.value,
                          selected: state.selectedFilters.contains(item.value),
                        ),
                      )
                      .toList(),
                  enabled: true,
                  fieldDecoration: FieldDecoration(
                    backgroundColor: AppColors.dustyOlive,
                    hintText: '',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: xs,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Padding(
                      padding: dimen.right.xxs,
                      child: Container(
                        padding: dimen.all.micro,
                        child: MarketiniyaIcons.filter(),
                      ),
                    ),
                    showClearIcon: true,
                    animateSuffixIcon: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(lg),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(lg),
                      borderSide: BorderSide.none,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: xs,
                      vertical: xxs,
                    ),
                  ),
                  chipDecoration: const ChipDecoration(
                    backgroundColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Colors.transparent,
                      fontSize: 0,
                    ),
                    deleteIcon: Icon(
                      Icons.close,
                      color: Colors.transparent,
                      size: 0,
                    ),
                    spacing: 0,
                    runSpacing: 0,
                    wrap: false,
                    borderRadius: BorderRadius.zero,
                  ),
                  dropdownDecoration: const DropdownDecoration(
                    backgroundColor: AppColors.lightOlive,
                    elevation: xxsPlus,
                    maxHeight: 600,
                    borderRadius: BorderRadius.all(Radius.circular(xs)),
                    header: Padding(
                      padding: EdgeInsets.all(xs),
                      child: Text(
                        'Филтър',
                        style: TextStyle(
                          fontSize: xs,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  dropdownItemDecoration: const DropdownItemDecoration(
                    selectedIcon: Icon(
                      Icons.check_box,
                      color: AppColors.oliveGreen,
                    ),
                    backgroundColor: AppColors.lightOlive,
                    selectedBackgroundColor: AppColors.dustyOlive,
                    textColor: Colors.black,
                    selectedTextColor: Colors.black,
                  ),
                  onSelectionChange: (selectedItems) {
                    // One-line solution: Convert selected items directly to List<FilterOption>
                    context.read<ClientBloc>().add(
                      ClientEvent.onFilterChanged(selectedItems.cast<Filter>()),
                    );
                  },
                ),
                Positioned(
                  left: 12,
                  top: 0,
                  bottom: 0,
                  child: IgnorePointer(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _getSelectedFiltersLabel(state.selectedFilters),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: xs,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getSelectedFiltersLabel(List<Filter> selectedFilters) {
    if (selectedFilters.isEmpty) {
      return 'Филтър (0)';
    } else if (selectedFilters.length == Filter.values.length) {
      return 'Всички филтри (${selectedFilters.length})';
    } else {
      return 'Избрани филтри (${selectedFilters.length})';
    }
  }
}
