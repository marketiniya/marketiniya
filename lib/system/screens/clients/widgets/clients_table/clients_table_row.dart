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
            Cell(label: rowNumber.toString(), flex: 0.4, isCentered: true),
            Cell(label: client.name, flex: 1.0),
            Cell(label: client.companyName, flex: 2.5),
            Cell(label: client.priorityLevel.label, flex: 1.0, isCentered: true),
            Cell(label: client.department.label, flex: 1.0, isCentered: true),
            Cell(label: client.phone, flex: 1.0, isCentered: true),
            Cell(label: '', flex: 1.0, booleanValue: client.hasBeenCalled, isCentered: true),
            Cell(label: client.email, flex: 1.5),
            Cell(label: '', flex: 1.0, status: client.status, isCentered: true),
          ],
        ),
      ),
    );
  }
}
