import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/models/client.dart';
import 'package:marketinya/system/screens/clients/widgets/clients_table/cell.dart';

class ClientsTableRow extends StatelessWidget {
  const ClientsTableRow({
    super.key,
    required this.client,
    required this.rowNumber,
    this.onTap,
  });

  final Client client;
  final int rowNumber;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: micro,
          horizontal: xs,
        ),
        child: Row(
          children: [
            Cell(label: rowNumber.toString(), flex: 0.5),
            Cell(label: client.name, flex: 1),
            Cell(label: client.companyName, flex: 1.6),
            Cell(label: client.priorityLevel.label, flex: 1, isCentered: true),
            Cell(label: client.department.label, flex: 0.7),
            Cell(label: client.phone, flex: 0.6),
            Cell(label: '', flex: 1, booleanValue: client.hasBeenCalled, isCentered: true),
            Cell(label: client.email, flex: 1.5),
            Cell(label: '', flex: 1, status: client.status),
          ],
        ),
      ),
    );
  }
}
