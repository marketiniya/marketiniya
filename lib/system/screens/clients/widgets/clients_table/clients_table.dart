import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/molecules/error_state/error_state_view.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/system/screens/clients/bloc/client_bloc.dart';
import 'package:marketinya/system/screens/clients/bloc/client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_footer.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_header.dart';
import 'clients_list.dart';

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
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: imageWidth),
            child: Center(
              child: CircularProgressIndicator(color: AppColors.oliveGreen),
            ),
          );
        }

        if (state.status == Status.error) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: imageWidth),
            child: Center(
              child: ErrorStateView(
                message: 'Something went wrong. Please try again.',
                onRetry: () =>
                    context.read<ClientBloc>().add(const ClientEvent.onLoad()),
              ),
            ),
          );
        }

        if (state.clients.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: imageWidth),
            child: Center(
              child: Text(
                'Няма намерени резултати..',
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ClientsTableHeader(),
              const SizedBox(height: xxs),
              ClientsList(
                clients: _paginatedClients,
                currentPage: _currentPage,
                itemsPerPage: _itemsPerPage,
              ),
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
}
