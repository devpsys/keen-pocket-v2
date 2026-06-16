import 'package:flutter/widgets.dart';

/// Corner-radius scale. Source of truth for all rounded corners.
/// Raw radius literals in widgets are rejected by `no_arbitrary_spacing`'s
/// sibling conventions — always use these tokens.
@immutable
abstract final class KpRadii {
  const KpRadii._();

  static const double none = 0;
  static const double xs = 4;
  static const double s = 8;
  static const double m = 12; // controls: buttons + inputs (spec _2: ~0.8rem)
  static const double l = 16;
  static const double xl = 24; // cards / large containers (spec _1)
  static const double sheet = 22; // bottom-sheet top corners (spec _2: 1.4rem)
  static const double pill = 999;

  static const Radius radiusXs = Radius.circular(xs);
  static const Radius radiusS = Radius.circular(s);
  static const Radius radiusM = Radius.circular(m);
  static const Radius radiusL = Radius.circular(l);
  static const Radius radiusXl = Radius.circular(xl);
  static const Radius radiusSheet = Radius.circular(sheet);

  static const BorderRadius allXs = BorderRadius.all(radiusXs);
  static const BorderRadius allS = BorderRadius.all(radiusS);
  static const BorderRadius allM = BorderRadius.all(radiusM);
  static const BorderRadius allL = BorderRadius.all(radiusL);
  static const BorderRadius allXl = BorderRadius.all(radiusXl);

  /// Top-only rounding for bottom sheets / full-screen modals.
  static const BorderRadius topSheet = BorderRadius.only(
    topLeft: radiusSheet,
    topRight: radiusSheet,
  );
}
