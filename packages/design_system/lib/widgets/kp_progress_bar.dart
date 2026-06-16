import 'package:flutter/material.dart';

import '../colors/kp_colors.dart';
import '../extensions/context_extensions.dart';
import '../radius/kp_radii.dart';

/// Thick, rounded, "recessed" progress bar (design library: Progress Bars are
/// extra-thick 12–16px with a bright rounded indicator).
///
/// The track sits slightly inset; the indicator is fully rounded and defaults
/// to the brand colour. Pass [color] to tint per context (e.g. gold for a
/// resource goal, success for completion).
class KpProgressBar extends StatelessWidget {
  const KpProgressBar({
    required this.value,
    this.color,
    this.height = 14,
    super.key,
  });

  /// 0.0 – 1.0.
  final double value;
  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0);
    final indicator = color ?? context.colorScheme.primary;
    final track = context.isDarkMode
        ? KpColors.navySurfaceHigh
        : KpColors.neutral100;

    return ClipRRect(
      borderRadius: KpRadii.allS,
      child: Stack(
        children: [
          Container(height: height, color: track),
          FractionallySizedBox(
            widthFactor: clamped,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: indicator,
                borderRadius: KpRadii.allS,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
