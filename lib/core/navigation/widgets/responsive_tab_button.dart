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
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isHovered ? 2 : 0,
                      height: 40,
                      color: const Color.fromARGB(55, 158, 158, 158),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: margin),
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
                      width: isHovered ? 2 : 0,
                      height: 40,
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
