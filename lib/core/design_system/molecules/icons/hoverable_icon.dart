import 'package:flutter/material.dart';

class HoverableIcon extends StatefulWidget {
  const HoverableIcon({
    super.key,
    required this.icon,
    required this.size,
    required this.defaultColor,
    required this.hoverColor,
    required this.onTap,
  });

  final IconData icon;
  final double size;
  final Color defaultColor;
  final Color hoverColor;
  final VoidCallback onTap;

  @override
  State<HoverableIcon> createState() => _HoverableIconState();
}

class _HoverableIconState extends State<HoverableIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          child: Icon(
            widget.icon,
            color: _isHovered ? widget.hoverColor : widget.defaultColor,
            size: widget.size,
          ),
        ),
      ),
    );
  }
}
