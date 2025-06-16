import 'package:flutter/material.dart';

class ContactButton extends StatefulWidget {
  const ContactButton({
    super.key,
    required this.isActive,
    required this.onPressed,
    required this.fontSize,
  });

  final bool isActive;
  final VoidCallback onPressed;
  final double fontSize;

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 180;
        final buttonHeight = isSmallScreen ? 45.0 : 52.0;
        final fontSize =
            isSmallScreen ? widget.fontSize * 0.9 : widget.fontSize;
        final horizontalMargin = isSmallScreen ? 6.0 : 12.0;

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.onPressed,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isSmallScreen ? 200 : 350,
              ),
              child: Container(
                height: buttonHeight,
                margin: EdgeInsets.only(
                  left: horizontalMargin,
                  right: horizontalMargin,
                  top: 8,
                  bottom: 0,
                ),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? Theme.of(context)
                          .colorScheme
                          .secondary
                          .withValues(alpha: 0.8)
                      : Theme.of(context)
                          .colorScheme
                          .secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Свържи се с нас',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: _isHovered
                          ? Colors.black.withValues(alpha: 0.8)
                          : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
