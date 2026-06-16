import 'package:flutter/material.dart';

/// Typography tokens — the single source of truth for text styles.
///
/// Widgets must read styles from the theme (`context.textTheme.bodyMedium` or
/// `Theme.of(context).textTheme`) rather than constructing `TextStyle(...)`
/// inline. This class only *defines* the scale; [buildTextTheme] wires it into
/// the [ThemeData].
@immutable
abstract final class KpTypography {
  const KpTypography._();

  /// Brand typeface. Bundle the Nunito font files under `assets/fonts/` and
  /// declare them in `pubspec.yaml` to ship the real face; until then Flutter
  /// falls back to the platform default for this family name.
  static const String fontFamily = 'Nunito';

  // The design library mandates a "chunky" hierarchy: 800–900 weight headlines
  // with slight negative tracking, and a sturdy 600-weight body (no thin text).

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    height: 56 / 48,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.96, // ≈ -0.02em
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.64,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.48,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 28 / 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.1,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.5,
  );

  /// Uppercase action label for buttons + bottom-nav (spec `_2`: `nav-button`,
  /// 15/800, tracking 0.05em). Apply `.toUpperCase()` to the text.
  static const TextStyle navButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 1,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.75, // ≈ 0.05em
  );

  /// Uppercase micro-label for field labels / overlines (spec `_2`: `label-caps`,
  /// 12/800, tracking 0.08em). Apply `.toUpperCase()` to the text.
  static const TextStyle labelCaps = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.96, // ≈ 0.08em
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
