import 'package:flutter/widgets.dart';

import '../colors/kp_colors.dart';

/// Gradient tokens. Source of truth for `Gradient` fills.
///
/// The signature "financial card" fill from the design library
/// (`linear-gradient(177deg, #ffffff, #f5fbff)`) — a near-vertical white→sky
/// wash that gives cards a soft, tactile sheen.
@immutable
abstract final class KpGradients {
  const KpGradients._();

  /// 177° ≈ almost straight down, tilted 3° — matches the design spec.
  static const LinearGradient card = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[KpColors.cardGradientTop, KpColors.cardGradientBottom],
  );

  /// Dark-mode counterpart: deep-navy surface wash.
  static const LinearGradient cardDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[KpColors.navySurfaceHigh, KpColors.navySurface],
  );
}
