import 'package:flutter/widgets.dart';

import '../colors/kp_colors.dart';

/// Elevation/shadow tokens. Source of truth for `boxShadow` lists.
@immutable
abstract final class KpShadows {
  const KpShadows._();

  static const List<BoxShadow> none = <BoxShadow>[];

  static const List<BoxShadow> low = <BoxShadow>[
    BoxShadow(color: Color(0x14000000), blurRadius: 4, offset: Offset(0, 1)),
  ];

  static const List<BoxShadow> medium = <BoxShadow>[
    BoxShadow(color: Color(0x1F000000), blurRadius: 12, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> high = <BoxShadow>[
    BoxShadow(color: Color(0x29000000), blurRadius: 24, offset: Offset(0, 8)),
  ];

  /// Soft brand-tinted "inner glow" for the page/cards — a large-blur wash of
  /// the primary at ~10% opacity (spec `_1`, Elevation & Depth).
  static const List<BoxShadow> brandGlow = <BoxShadow>[
    BoxShadow(color: Color(0x1A1CB0F6), blurRadius: 28, offset: Offset(0, 10)),
  ];

  /// Pop-over / modal elevation: soft, high-spread shadow that lifts sheets and
  /// dialogs above the flat 3D base UI (spec `_2`: 0 10px 25px rgba(30,41,59,.1)).
  static const List<BoxShadow> modal = <BoxShadow>[
    BoxShadow(color: Color(0x1A1E293B), blurRadius: 25, offset: Offset(0, 10)),
  ];
}

/// Material elevation tokens (dp). Use with `Material`/`Card` `elevation`.
@immutable
abstract final class KpElevation {
  const KpElevation._();

  static const double none = 0;
  static const double low = 1;
  static const double medium = 4;
  static const double high = 8;
}

/// Re-export so widgets can read a brand-tinted shadow without touching colors.
const Color kScrimColor = KpColors.neutral1000;
