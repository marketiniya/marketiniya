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

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final maxMargin = availableWidth * 0.08;
        final margin = maxMargin.clamp(5.0, 25.0);

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
                width: double.infinity,
                height: 65,
                padding: const EdgeInsets.only(
                    top: 18, bottom: 3, left: 10, right: 10,),
                child: Row(
                  children: [
                    AnimatedBorder(isVisible: isHovered, height: 40),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: margin),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
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
                      ),
                    ),
                    AnimatedBorder(isVisible: isHovered, height: 40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
