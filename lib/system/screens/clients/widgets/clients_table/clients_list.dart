import 'package:flutter/material.dart';
import 'package:marketinya/core/extensions/context_extension.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/add_client_screen.dart';
import 'clients_table_row.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({
    super.key,
    required this.clients,
    required this.currentPage,
    required this.itemsPerPage,
  });

  final List<Client> clients;
  final int currentPage;
  final int itemsPerPage;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: clients.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) {
        final client = clients[index];
        final rowNumber = (currentPage - 1) * itemsPerPage + index + 1;
        return ClientsTableRow(
          client: client,
          rowNumber: rowNumber,
          onTap: () => context.push(AddClientScreen(client: client)),
        );
      },
    );
  }
}
