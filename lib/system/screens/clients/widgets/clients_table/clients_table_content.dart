import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/bloc/client_bloc.dart';
import 'package:marketinya/system/screens/clients/bloc/client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_list.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_constants.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_footer.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_header.dart';

class ClientsTableContent extends StatelessWidget {
  const ClientsTableContent({
    super.key,
    required this.state,
  });

  final ClientState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ClientsTableConstants.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ClientsTableHeader(),
          const SizedBox(height: xxs),
          Expanded(
            child: SingleChildScrollView(
              child: ClientsList(
                clients: state.paginatedClients,
                currentPage: state.currentPage,
                itemsPerPage: state.itemsPerPage,
              ),
            ),
          ),
          if (state.totalPages > 0) ...[
            const SizedBox(height: xs),
            ClientsTableFooter(
              itemsPerPage: state.itemsPerPage,
              currentPage: state.currentPage,
              totalPages: state.totalPages,
              onPageChanged: (page) {
                context.read<ClientBloc>().add(ClientEvent.onPageChanged(page));
              },
              onRowsPerPageChanged: (itemsPerPage) {
                if (itemsPerPage != null) {
                  context.read<ClientBloc>().add(
                    ClientEvent.onItemsPerPageChanged(itemsPerPage),
                  );
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
            ),
            const SizedBox(height: sm),
          ],
        ],
      ),
    );
  }
}
