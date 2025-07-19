import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketinya/core/enums/status.dart';
import 'package:marketinya/system/screens/clients/bloc/client_bloc.dart';
import 'package:marketinya/system/screens/clients/bloc/client_state.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_content.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/clients_table_states.dart';

class ContentTable extends StatelessWidget {
  const ContentTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const ClientsTableLoadingState();
        }

        if (state.status == Status.error) {
          return const ClientsTableErrorState();
        }

        if (state.filteredClients.isEmpty) {
          return ClientsTableEmptyState(
            searchQuery: state.searchQuery,
          );
        }

        return ClientsTableContent(state: state);
      },
    );
  }
}
