import 'package:flutter/material.dart';
import 'package:marketinya/core/navigation/widgets/animated_border.dart';

class ResponsiveTabButton extends StatefulWidget {
  const ResponsiveTabButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.onPressed,
    required this.fontSize,
  });

  final String label;
  final bool isActive;
  final VoidCallback onPressed;
  final double fontSize;

  @override
  State<ResponsiveTabButton> createState() => _ResponsiveTabButtonState();
}

class _ResponsiveTabButtonState extends State<ResponsiveTabButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(
              top: 18,
              bottom: 3,
              left: 10,
              right: 10,
            ),
            child: Row(
              children: [
                AnimatedBorder(isVisible: isHovered, height: 75),
                Expanded(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      color: _getButtonColor(widget.isActive, colorScheme),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
                AnimatedBorder(isVisible: isHovered, height: 75),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getButtonColor(bool isActive, ColorScheme colorScheme) {
    const hoverColor = Color.fromARGB(255, 158, 158, 158);

    if (isHovered) {
      return hoverColor;
    } else {
      return isActive ? colorScheme.secondary : colorScheme.primary;
    }
  }
}
