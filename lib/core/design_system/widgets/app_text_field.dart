import 'package:flutter/material.dart';

/// Themed text field. Label/hint/error are passed in already-localized by the
/// caller (so this widget stays free of hardcoded strings).
class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    this.hint,
    this.errorText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    super.key,
  });

  final String label;
  final String? hint;
  final String? errorText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
      ),
    );
  }
}
