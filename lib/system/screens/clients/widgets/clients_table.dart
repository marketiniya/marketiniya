import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/system/screens/clients/models/client_model.dart';
import 'package:marketinya/system/screens/clients/widgets/pagination.dart';

class ContentTable extends StatefulWidget {
  const ContentTable({super.key});

  @override
  State<ContentTable> createState() => _ContentTableState();
}

class _ContentTableState extends State<ContentTable> {
  static const List<int> _availableRowsPerPage = [10, 15, 25, 50, 100];
  static const _rowTextStyle = TextStyle(
    color: Colors.black87,
    fontSize: xxsPlus,
  );
  static const _headerTextStyle = TextStyle(
    fontSize: xs,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const _cellTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.black87,
  );

  int _itemsPerPage = 15;
  int _currentPage = 1;

  List<ClientModel> get _paginatedClients {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    return sampleClients.sublist(
      startIndex,
      endIndex.clamp(0, sampleClients.length),
    );
  }

  int get _totalPages => (sampleClients.length / _itemsPerPage).ceil();

  void _onPageChanged(int page) => setState(() => _currentPage = page);

  void _onRowsPerPageChanged(int? value) {
    if (value != null) {
      setState(() {
        _itemsPerPage = value;
        _currentPage = 1;
      });
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 180),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const SizedBox(height: xxs),
          _buildClientsList(),
          if (_totalPages > none) ...[
            const SizedBox(height: xs),
            _buildTableFooter(),
            const SizedBox(height: xs),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.mutedOlive,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: xxs,
        horizontal: xs,
      ),
      child: Row(
        children: [
          _buildHeaderCell('№', 0.5),
          _buildHeaderCell('Клиентски номер', 1),
          _buildHeaderCell('Име/Фирма', 2),
          _buildHeaderCell('ЕГН/ЕИК', 1),
          _buildHeaderCell('Сектор', 1),
          _buildHeaderCell('Статус', 1),
        ],
      ),
    );
  }

  Widget _buildClientsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _paginatedClients.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) {
        final client = _paginatedClients[index];
        final rowNumber = (_currentPage - 1) * _itemsPerPage + index + 1;
        return InkWell(
          onTap: () {
            // Handle row tap
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: micro,
              horizontal: xs,
            ),
            child: Row(
              children: [
                _buildCell(rowNumber.toString(), 0.5),
                _buildCell(client.clientNumber, 1),
                _buildCell(client.name, 2),
                _buildCell(client.identifier, 1),
                _buildCell(client.sector, 1),
                _buildStatusCell(client.isActive ? 'Активен' : 'Неактивен', 1),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTableFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRowsPerPageSelector(),
        Pagination(
          currentPage: _currentPage,
          totalPages: _totalPages,
          onPageChanged: _onPageChanged,
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
              value: _itemsPerPage,
              isDense: true,
              focusColor: Colors.transparent,
              items: _availableRowsPerPage.map(_buildDropdownItem).toList(),
              onChanged: _onRowsPerPageChanged,
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

  Widget _buildHeaderCell(String text, double flex) {
    return Expanded(
      flex: (flex * 10).toInt(),
      child: Text(text, style: _headerTextStyle),
    );
  }

  Widget _buildCell(String text, double flex) {
    return Expanded(
      flex: (flex * 10).toInt(),
      child: Text(text, style: _cellTextStyle),
    );
  }

  Widget _buildStatusCell(String status, double flex) {
    final isActive = status == 'Активен';
    return Expanded(
      flex: (flex * 10).toInt(),
      child: Text(
        status,
        style: _cellTextStyle.copyWith(
          color: isActive ? Colors.green : Colors.red,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
