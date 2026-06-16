import 'package:flutter/material.dart';

/// Typography tokens — the single source of truth for text styles.
///
/// Widgets must read styles from the theme (`context.textTheme.bodyMedium` or
/// `Theme.of(context).textTheme`) rather than constructing `TextStyle(...)`
/// inline. This class only *defines* the scale; [buildTextTheme] wires it into
/// the [ThemeData].
@immutable
abstract final class AppTypography {
  const AppTypography._();

  /// Project font family. Replace with a bundled font once provided by design.
  static const String fontFamily = 'Roboto';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 57,
    height: 64 / 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  /// Builds a Material [TextTheme] whose colors default to [color].
  static TextTheme buildTextTheme(Color color) {
    final base = TextStyle(color: color);
    return TextTheme(
      displayLarge: displayLarge.merge(base),
      headlineLarge: headlineLarge.merge(base),
      headlineMedium: headlineMedium.merge(base),
      titleLarge: titleLarge.merge(base),
      titleMedium: titleMedium.merge(base),
      bodyLarge: bodyLarge.merge(base),
      bodyMedium: bodyMedium.merge(base),
      bodySmall: bodySmall.merge(base),
      labelLarge: labelLarge.merge(base),
      labelSmall: labelSmall.merge(base),
    );
  }
}
