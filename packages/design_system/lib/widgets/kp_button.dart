import 'package:flutter/material.dart';

import '../colors/kp_colors.dart';
import '../extensions/context_extensions.dart';
import '../radius/kp_radii.dart';
import '../spacing/kp_spacing.dart';
import '../typography/kp_typography.dart';

/// Visual styles for [KpButton].
enum KpButtonVariant {
  /// Brand-blue candy button — the main call to action.
  primary,

  /// Gold candy button — rewards / celebratory actions.
  secondary,

  /// Flat 2px-outlined button — secondary actions, no 3D effect.
  ghost,
}

/// The signature KeenPocket "candy" button.
///
/// Resting, it sits on a solid darker base that reads as a 4px bottom border;
/// on press the face drops [_depth]px and the base collapses, simulating a
/// physical click (design library, Components → Buttons). Loading state and
/// icon spacing are handled internally so screens never wire them by hand.
class KpButton extends StatefulWidget {
  const KpButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.variant = KpButtonVariant.primary,
    this.caps = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final KpButtonVariant variant;

  /// Render the label uppercase with the `nav-button` style (design default for
  /// primary actions). Off by default so callers keep control of casing.
  final bool caps;

  @override
  State<KpButton> createState() => _KpButtonState();
}

class _KpButtonState extends State<KpButton> {
  static const double _depth = 4;
  static const double _minHeight = 48;
  bool _pressed = false;

  bool get _enabled => !widget.isLoading && widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final ghost = widget.variant == KpButtonVariant.ghost;

    final (Color face, Color base, Color fg) = switch (widget.variant) {
      KpButtonVariant.primary => (
        scheme.primary,
        KpColors.brand600,
        scheme.onPrimary,
      ),
      KpButtonVariant.secondary => (
        KpColors.gold500,
        KpColors.gold600,
        KpColors.neutral900,
      ),
      KpButtonVariant.ghost => (
        KpColors.transparent,
        KpColors.transparent,
        scheme.primary,
      ),
    };

    final pressed = _pressed && _enabled;
    final opacity = _enabled ? 1.0 : 0.5;

    Widget content = widget.isLoading
        ? SizedBox(
            height: KpSpacing.l,
            width: KpSpacing.l,
            child: CircularProgressIndicator(strokeWidth: 2, color: fg),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: KpSpacing.l, color: fg),
                const Gap.xs(horizontal: true),
              ],
              Text(
                widget.caps ? widget.label.toUpperCase() : widget.label,
                style:
                    (widget.caps
                            ? KpTypography.navButton
                            : KpTypography.labelLarge)
                        .copyWith(color: fg),
              ),
            ],
          );

    final face_ = Container(
      constraints: const BoxConstraints(
        minHeight: _minHeight,
        minWidth: double.infinity,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: face,
        borderRadius: KpRadii.allM,
        border: ghost ? Border.all(color: KpColors.neutral300, width: 2) : null,
      ),
      child: content,
    );

    // Ghost is flat — no 3D base (kept the same height as candy buttons).
    if (ghost) {
      return Opacity(
        opacity: opacity,
        child: _tappable(
          Padding(
            padding: const EdgeInsets.only(bottom: _depth),
            child: face_,
          ),
        ),
      );
    }

    // The darker [base] sits behind the face; resting, it peeks out [_depth]px
    // at the bottom as the chunky border. On press the padding collapses, so
    // the face covers the base and the button visibly compresses.
    return Opacity(
      opacity: opacity,
      child: _tappable(
        AnimatedContainer(
          duration: const Duration(milliseconds: 60),
          decoration: BoxDecoration(color: base, borderRadius: KpRadii.allM),
          padding: EdgeInsets.only(bottom: pressed ? 0 : _depth),
          child: face_,
        ),
      ),
    );
  }

  Widget _tappable(Widget child) => GestureDetector(
    onTapDown: _enabled ? (_) => setState(() => _pressed = true) : null,
    onTapUp: _enabled ? (_) => setState(() => _pressed = false) : null,
    onTapCancel: _enabled ? () => setState(() => _pressed = false) : null,
    onTap: _enabled ? widget.onPressed : null,
    child: child,
  );
}
