import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/add_client_screen/enums/client_status.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.label,
    required this.flex,
    this.isHeaderCell = false,
    this.status,
    this.isCentered = false,
  });

  final String label;
  final double flex;
  final bool isHeaderCell;
  final ClientStatus? status;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      status?.label ?? label,
      style: TextStyle(
        fontSize: isHeaderCell ? xs : 14,
        fontWeight: FontWeight.w500,
        color: status != null
            ? status == ClientStatus.active
            ? Colors.green
            : Colors.red
            : Colors.black,
      ),
    );

    return Expanded(
      flex: (flex * 10).toInt(),
      child: isCentered ? Center(child: textWidget) : Align(
        alignment: Alignment.centerLeft,
        child: textWidget,
      ),
    );
  }
}

