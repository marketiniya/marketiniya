import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/dimensions.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.value,
    this.padding = EdgeInsets.zero,
    this.contentPadding,
    this.borderRadius,
    this.labelText = '',
    this.helperText,
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
    this.textInputAction,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.enabled = true,
    this.errorText,
  });

  /// The initial value of the text field
  final String? value;

  /// The padding around the text field
  final EdgeInsetsGeometry padding;

  /// The padding inside the text field
  final EdgeInsetsGeometry? contentPadding;

  /// The border radius of the text field
  final double? borderRadius;

  /// The focus node for the text field
  final FocusNode? focusNode;

  /// The label text shown above the text field
  final String labelText;

  /// The helper text shown below the text field
  final String? helperText;

  /// The behavior of the floating label
  final FloatingLabelBehavior floatingLabelBehavior;

  /// The alignment of the floating label
  final FloatingLabelAlignment floatingLabelAlignment;

  /// The hint text shown when the text field is empty
  final String hintText;

  /// The icon shown before the text field
  final IconData? prefixIcon;

  /// The icon shown after the text field
  final IconData? suffixIcon;

  /// Called when the text field's value changes
  final ValueChanged<String>? onChanged;

  /// Called when the form is saved
  final FormFieldSetter<String>? onSaved;

  /// Validates the text field's value
  final FormFieldValidator<String>? validator;

  /// The keyboard type for the text field
  final TextInputType keyboardType;

  /// Whether the text field should obscure its text
  final bool obscureText;

  /// The background color of the text field
  final Color? filledColor;

  /// The maximum number of lines for the text field
  final int? maxLines;

  /// Whether the text field is read-only
  final bool readOnly;

  /// Called when the text field is tapped
  final VoidCallback? onTap;

  /// The action button on the keyboard
  final TextInputAction? textInputAction;

  /// Called when the user submits the text field
  final ValueChanged<String>? onFieldSubmitted;

  /// Whether the text field should be focused on first build
  final bool autofocus;

  /// Whether the text field is enabled
  final bool enabled;

  /// The error text to display
  final String? errorText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late bool _obscureText;
  String? _lastValue;

  @override
  void initState() {
    super.initState();
    _lastValue = widget.value;
    _controller = TextEditingController(text: widget.value);
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void didUpdateWidget(CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && widget.value != _lastValue) {
      _lastValue = widget.value;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _controller.text = widget.value ?? '';
        }
      });
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: _controller,
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
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.black),
          helperText: widget.helperText,
          errorText: widget.errorText,
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
          errorBorder: _buildErrorBorder(),
          focusedErrorBorder: _buildErrorBorder(),
          disabledBorder: _buildBorder(),
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

  OutlineInputBorder? _buildErrorBorder() {
    final borderRadius = widget.borderRadius;
    if (borderRadius == null) {
      return null;
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: Colors.red),
    );
  }

  Widget? _buildSuffixIcon() {
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
    required this.onSelected,
    required this.labelText,
    required this.labelBuilder,
    this.width = 360.0,
  });

  final T value;
  final List<T> items;
  final Function(T?) onSelected;
  final String labelText;
  final String Function(T) labelBuilder;
  final double width;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      width: width,
      label: Text(labelText),
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
                  : const SizedBox(width: sm),
            ),
          )
          .toList(),
      onSelected: onSelected,
    );
  }
}
