import 'package:flutter/material.dart';

class TabButtonWrapper extends StatefulWidget {
  const TabButtonWrapper({
    super.key,
    required this.isActive,
    required this.onTap,
    required this.child,
    this.isContactButton = false,
  });

  final bool isActive;
  final VoidCallback onTap;
  final Widget child;
  final bool isContactButton;

  @override
  State<TabButtonWrapper> createState() => _TabButtonWrapperState();
}

class _TabButtonWrapperState extends State<TabButtonWrapper> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.isContactButton ? 60 : 50, // More height for contact button
          width: widget.isContactButton ? 180 : null, // Less width for contact button
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: widget.isContactButton
              ? _isHovered
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.2) // More transparent on hover
                  : Theme.of(context).colorScheme.secondary.withValues(alpha:0.9) // Always primary color for contact button
              : _isHovered
                  ? Colors.green.withValues(alpha:0.1)
                  : Colors.transparent,
            borderRadius: BorderRadius.circular(
              widget.isContactButton ? 16 : 8,
            ),
            border: _isHovered
                ? Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            )
                : widget.isContactButton && widget.isActive
                ? Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            )
                : widget.isActive
                ? Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            )
                : null,


          ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
