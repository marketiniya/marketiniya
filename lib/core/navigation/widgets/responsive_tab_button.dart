import 'package:flutter/material.dart';

class ResponsiveTabButton extends StatefulWidget {
  const ResponsiveTabButton({
    super.key,
    required this.label,
    required this.activeTab,
    required this.onPressed,
    required this.fontSize,
  });

  final String label;
  final String activeTab;
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
    final isActive = widget.label == widget.activeTab;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive margins based on available width
        final availableWidth = constraints.maxWidth;
        final maxMargin = availableWidth * 0.15; // 15% of available width
        final margin = maxMargin.clamp(10.0, 50.0); // Between 10px and 50px

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
                height: 80, // Bigger box height
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 8), // More padding
                child: Row(
                  children: [
                    // Left hover line - positioned at the start with more height
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isHovered ? 2 : 0, // Thicker line
                      height: 60, // Bigger border height
                      color: const Color.fromARGB(55, 158, 158, 158),
                    ),
                    // Text centered with normal margins
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: margin),
                        // Normal margins
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            widget.label,
                            style: TextStyle(
                              fontSize: widget.fontSize,
                              color: _getButtonColor(isActive, colorScheme),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isHovered ? 2 : 0, // Thicker line
                      height: 60, // Bigger border height
                      color: const Color.fromARGB(55, 158, 158, 158),
                    ),
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
