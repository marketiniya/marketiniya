import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/system/screens/clients/bloc/client_bloc.dart';
import 'package:marketinya/system/screens/clients/bloc/client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_footer.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_header.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_row.dart';

class ContentTable extends StatefulWidget {
  const ContentTable({super.key});

  @override
  State<ContentTable> createState() => _ContentTableState();
}

class _ContentTableState extends State<ContentTable> {
  int _itemsPerPage = 15;
  int _currentPage = 1;

  List<Client> get _paginatedClients {
    final clients = context.read<ClientBloc>().state.clients;
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    return clients.sublist(
      startIndex,
      endIndex.clamp(0, clients.length),
    );
  }

  int get _totalPages {
    final clients = context.read<ClientBloc>().state.clients;
    return (clients.length / _itemsPerPage).ceil();
  }

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
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == Status.error) {
          return Center(
            child: Text(
              'Error: ${state.errorMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state.clients.isEmpty) {
          return const Center(
            child: Text('No clients found'),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ClientsTableHeader(),
              const SizedBox(height: xxs),
              _buildClientsList(),
              if (_totalPages > 0) ...[
                const SizedBox(height: xs),
                ClientsTableFooter(
                  itemsPerPage: _itemsPerPage,
                  currentPage: _currentPage,
                  totalPages: _totalPages,
                  onPageChanged: _onPageChanged,
                  onRowsPerPageChanged: _onRowsPerPageChanged,
                ),
                const SizedBox(height: xs),
              ],
            ],
          ),
        );
      },
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
        return ClientsTableRow(
          client: client,
          rowNumber: rowNumber,
          onTap: () {
            // Handle row tap
          },
        );
      },
    );
  }
}
