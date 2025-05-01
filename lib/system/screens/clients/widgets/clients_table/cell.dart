import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/enums/client_status.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.label,
    required this.flex,
    this.isHeaderCell = false,
    this.status,
  });

  final String label;
  final double flex;
  final bool isHeaderCell;
  final ClientStatus? status;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: (flex * 10).toInt(),
      child: Text(
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
      ),
    );
  }
}
