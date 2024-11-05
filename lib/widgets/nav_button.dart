import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String label;
  final String activeTab;
  final VoidCallback onPressed;
  final double fontSize;

  const NavButton({
    super.key,
    required this.label,
    required this.activeTab,
    required this.onPressed,
    required this.fontSize,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isActive = widget.activeTab == widget.label;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 1300;

    return Padding(
      padding: EdgeInsets.only(top: isSmallScreen ? 45 : 15),
      child: MouseRegion(
        onEnter: (_) {
          if (!isSmallScreen) {
            setState(() => isHovered = true);
          }
        },
        onExit: (_) {
          if (!isSmallScreen) {
            setState(() => isHovered = false);
          }
        },
        child: isSmallScreen
            ? _buildSmallScreenButton(isActive, colorScheme)
            : _buildLargeScreenButton(isActive, colorScheme),
      ),
    );
  }

  Widget _buildSmallScreenButton(bool isActive, ColorScheme colorScheme) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.label,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: _getButtonColor(isActive, colorScheme),
        ),
      ),
    );
  }

  Widget _buildLargeScreenButton(bool isActive, ColorScheme colorScheme) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Left hover line
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isHovered ? 1 : 0,
              height: widget.fontSize * 4,
              color: const Color.fromARGB(55, 158, 158, 158),
              margin: const EdgeInsets.only(right: 100),
            ),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: _getButtonColor(isActive, colorScheme),
              ),
            ),
            // Right hover line
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isHovered ? 1 : 0,
              height: widget.fontSize * 4,
              color: const Color.fromARGB(55, 158, 158, 158),
              margin: const EdgeInsets.only(left: 100),
            ),
          ],
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
