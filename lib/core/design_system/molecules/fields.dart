import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.contentPadding,
    this.borderRadius,
    this.labelText = '',
    this.helperText = '',
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.floatingLabelAlignment = FloatingLabelAlignment.start,
    this.hintText = '',
    this.filledColor,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController? controller;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final FocusNode? focusNode;
  final String labelText;
  final String? helperText;
  final FloatingLabelBehavior floatingLabelBehavior;
  final FloatingLabelAlignment floatingLabelAlignment;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color? filledColor;
  final int? maxLines;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        style: const TextStyle(color: Colors.black),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.black),
          helperText: widget.helperText,
          hintText: widget.hintText,
          floatingLabelBehavior: widget.floatingLabelBehavior,
          floatingLabelAlignment: widget.floatingLabelAlignment,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: _buildSuffixIcon(),
          filled: widget.filledColor != null,
          fillColor: widget.filledColor,
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder? _buildBorder() {
    final borderRadius = widget.borderRadius;

    if (borderRadius == null) {
      return null;
    }

    final filledColor = widget.filledColor;

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: filledColor != null
          ? BorderSide(color: filledColor)
          : const BorderSide(),
    );
  }

  Widget? _buildSuffixIcon() {
    // If it's a password field, show toggle visibility button
    if (widget.obscureText && widget.suffixIcon == null) {
      return Padding(
        padding: dimen.horizontal.micro,
        child: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: _togglePasswordVisibility,
        ),
      );
    }

    return widget.suffixIcon != null ? Icon(widget.suffixIcon) : null;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

class CustomDropdownMenu<T> extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.labelText,
    required this.labelBuilder,
    this.width = 360.0,
  });

  final T value;
  final List<T> items;
  final Function(T?) onChanged;
  final String labelText;
  final String Function(T) labelBuilder;
  final double width;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      width: width,
      initialSelection: value,
      enableFilter: true,
      textStyle: const TextStyle(color: Colors.black),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: dimen.horizontal.sm,
        filled: true,
        fillColor: AppColors.lightOlive,
        labelStyle: const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lg),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lg),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lg),
          borderSide: BorderSide.none,
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.lightBeige),
        fixedSize: WidgetStateProperty.resolveWith((states) {
          if (items.length > 5) {
            return const Size(360, 240);
          }
          return null;
        }),
      ),
      dropdownMenuEntries: items
          .map(
            (item) => DropdownMenuEntry<T>(
              value: item,
              label: labelBuilder(item),
              trailingIcon: item == value
                  ? const Icon(Icons.check_box, color: AppColors.oliveGreen)
                  : const SizedBox(width: 24),
            ),
          )
          .toList(),
      onSelected: onChanged,
    );
  }
}
