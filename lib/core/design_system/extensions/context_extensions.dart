import 'package:flutter/material.dart';

import '../themes/app_semantic_colors.dart';

/// Theme/media ergonomics: `context.colorScheme`, `context.textTheme`,
/// `context.colors`, `context.isDarkMode`, responsive helpers.
extension ThemeContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Project semantic colors (success/warning/info) — see [AppSemanticColors].
  AppSemanticColors get colors =>
      Theme.of(this).extension<AppSemanticColors>() ?? AppSemanticColors.light;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

/// Responsive sizing helpers driven by [MediaQuery] breakpoints.
extension ResponsiveContextX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  bool get isCompact => screenWidth < 600; // phones
  bool get isMedium => screenWidth >= 600 && screenWidth < 1024; // tablets
  bool get isExpanded => screenWidth >= 1024; // desktop / large tablets

  /// Picks a value for the current breakpoint, falling back to [compact].
  T responsive<T>({required T compact, T? medium, T? expanded}) {
    if (isExpanded) return expanded ?? medium ?? compact;
    if (isMedium) return medium ?? compact;
    return compact;
  }
}
