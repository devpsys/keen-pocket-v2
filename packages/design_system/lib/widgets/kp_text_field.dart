import 'package:flutter/material.dart';

/// Themed text field. Label/hint/error are passed in already-localized by the
/// caller (so this widget stays free of hardcoded strings).
///
/// When [obscureText] is set, a show/hide eye toggle is rendered automatically
/// (design library: password fields expose visibility).
class KpTextField extends StatefulWidget {
  const KpTextField({
    required this.label,
    this.hint,
    this.errorText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
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

  /// Optional trailing icon (ignored for obscured fields, which render the eye).
  final Widget? suffixIcon;

  @override
  State<KpTextField> createState() => _KpTextFieldState();
}

class _KpTextFieldState extends State<KpTextField> {
  late bool _obscured = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    final Widget? suffix = widget.obscureText
        ? IconButton(
            icon: Icon(
              _obscured
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
            ),
            onPressed: () => setState(() => _obscured = !_obscured),
          )
        : widget.suffixIcon;

    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _obscured,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        errorText: widget.errorText,
        suffixIcon: suffix,
      ),
    );
  }
}
