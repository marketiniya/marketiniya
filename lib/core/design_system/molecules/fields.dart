import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/utils/validators/field_validators.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.padding = EdgeInsets.zero,
    this.borderRadius,
    this.labelText = '',
    this.helperText = '',
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.floatingLabelAlignment = FloatingLabelAlignment.start,
    this.hintText = '',
    this.filledColor,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
  });

  final EdgeInsetsGeometry padding;
  final double? borderRadius;
  final TextEditingController? controller;
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
        decoration: InputDecoration(
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

class CustomDropdownFormField<T> extends StatefulWidget {
  const CustomDropdownFormField({
    super.key,
    required this.padding,
    required this.borderRadius,
    required this.items,
    required this.dropdownValues,
    this.isExpanded = false,
    this.value,
    this.labelText = '',
    this.hintText = '',
    this.prefixIcon,
    this.focusNode,
    this.onSaved,
  });

  final FocusNode? focusNode;
  final EdgeInsetsGeometry padding;
  final IconData? prefixIcon;
  final bool isExpanded;
  final T? value;
  final List<T> items;
  final String labelText;
  final String hintText;
  final double borderRadius;
  final FormFieldSetter<T>? onSaved;
  final String Function(T item) dropdownValues;

  @override
  State<CustomDropdownFormField<T>> createState() =>
      _CustomDropdownFormFieldState<T>();
}

class _CustomDropdownFormFieldState<T>
    extends State<CustomDropdownFormField<T>> {
  T? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: DropdownButtonFormField<T>(
        validator: FieldValidators.notEmptyObject(),
        menuMaxHeight: imageWidth,
        focusNode: widget.focusNode,
        isExpanded: widget.isExpanded,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon),
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        value: _selectedValue,
        items: _dropdownItems(),
        onChanged: _onChanged,
        onSaved: widget.onSaved,
      ),
    );
  }

  void _onChanged(T? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  List<DropdownMenuItem<T>> _dropdownItems() {
    return widget.items
        .map(
          (item) => DropdownMenuItem(
            value: item,
            child: Text(
              widget.dropdownValues(item),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList();
  }
}
