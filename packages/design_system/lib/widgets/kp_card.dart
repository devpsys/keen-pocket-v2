import 'package:flutter/material.dart';

import '../colors/kp_colors.dart';
import '../extensions/context_extensions.dart';
import '../gradients/kp_gradients.dart';
import '../radius/kp_radii.dart';
import '../spacing/kp_spacing.dart';

/// The KeenPocket "chunky" card — the primary content container.
///
/// Design library spec: rounded `xl` corners, a thin top/side border and a
/// thick (~7px) flat-color bottom border that grounds the card with a tactile,
/// 3D feel (no blurry shadow). Three variants:
///
/// * [KpCard]              — white surface, neutral chunky border.
/// * [KpCard.financial]    — white→sky gradient ([KpGradients.card]).
/// * [KpCard.interactive]  — tappable; border turns brand on press/selection.
class KpCard extends StatefulWidget {
  const KpCard({
    required this.child,
    this.padding = const EdgeInsets.all(KpSpacing.m),
    this.gradient = false,
    this.onTap,
    this.selected = false,
    super.key,
  });

  /// Gradient financial card.
  const KpCard.financial({
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(KpSpacing.l),
    Key? key,
  }) : this(child: child, padding: padding, gradient: true, key: key);

  /// Selectable card — border switches to brand on press / when [selected].
  const KpCard.interactive({
    required Widget child,
    required VoidCallback onTap,
    EdgeInsetsGeometry padding = const EdgeInsets.all(KpSpacing.m),
    bool selected = false,
    Key? key,
  }) : this(
         child: child,
         onTap: onTap,
         selected: selected,
         padding: padding,
         key: key,
       );

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool gradient;
  final VoidCallback? onTap;
  final bool selected;

  @override
  State<KpCard> createState() => _KpCardState();
}

class _KpCardState extends State<KpCard> {
  static const double _bottomBorder = 7;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode;
    final highlighted = widget.selected || _pressed;

    final Color borderColor = highlighted
        ? context.colorScheme.primary
        : (dark ? KpColors.navyOutline : KpColors.neutral200);
    final Color surface = dark ? KpColors.navySurface : KpColors.neutral0;
    final gradient = widget.gradient
        ? (dark ? KpGradients.cardDark : KpGradients.card)
        : null;

    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 90),
      padding: widget.padding,
      decoration: BoxDecoration(
        color: gradient == null ? surface : null,
        gradient: gradient,
        borderRadius: KpRadii.allXl,
        border: Border(
          top: BorderSide(color: borderColor, width: 2),
          left: BorderSide(color: borderColor, width: 2),
          right: BorderSide(color: borderColor, width: 2),
          bottom: BorderSide(color: borderColor, width: _bottomBorder),
        ),
      ),
      child: widget.child,
    );

    if (widget.onTap == null) return card;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: card,
    );
  }
}
