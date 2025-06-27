import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';

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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 220,
          ),
          child: Container(
            height: 55.0,
            margin: dimen.vertical.xxsPlus + dimen.top.xxs + dimen.bottom.none,
            decoration: BoxDecoration(
              color: _isHovered
                  ? Theme.of(context)
                      .colorScheme
                      .secondary
                      .withValues(alpha: 0.8)
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                'Свържи се с нас',
                style: TextStyle(
                  fontSize: widget.fontSize,
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
  }
}
