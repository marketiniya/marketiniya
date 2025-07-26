import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/enums/client_status.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.label,
    required this.flex,
    this.isHeaderCell = false,
    this.status,
    this.isCentered = false,
    this.booleanValue,
  });

  final String label;
  final double flex;
  final bool isHeaderCell;
  final ClientStatus? status;
  final bool isCentered;
  final bool? booleanValue;

  @override
  Widget build(BuildContext context) {
    String displayText;
    Color textColor;

    if (booleanValue != null) {
      // Handle boolean values (like hasBeenCalled)
      displayText = booleanValue! ? 'Да' : 'Не';
      textColor = booleanValue! ? Colors.green : Colors.red;
    } else if (status != null) {
      // Handle status values
      displayText = status!.label;
      textColor = status == ClientStatus.active ? Colors.green : Colors.red;
    } else {
      // Handle regular text
      displayText = label;
      textColor = Colors.black;
    }

    final textWidget = Text(
      displayText,
      style: TextStyle(
        fontSize: isHeaderCell ? xs : 14,
        fontWeight: FontWeight.w500,
        color: textColor,
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

