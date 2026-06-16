import 'package:flutter/widgets.dart';

import '../colors/app_colors.dart';

/// Elevation/shadow tokens. Source of truth for `boxShadow` lists.
@immutable
abstract final class AppShadows {
  const AppShadows._();

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
}

/// Material elevation tokens (dp). Use with `Material`/`Card` `elevation`.
@immutable
abstract final class AppElevation {
  const AppElevation._();

  static const double none = 0;
  static const double low = 1;
  static const double medium = 4;
  static const double high = 8;
}

/// Re-export so widgets can read a brand-tinted shadow without touching colors.
const Color kScrimColor = AppColors.neutral1000;
