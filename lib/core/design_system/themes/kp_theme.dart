import 'package:flutter/material.dart';

import '../colors/kp_colors.dart';
import '../radius/kp_radii.dart';
import '../spacing/kp_spacing.dart';
import '../typography/kp_typography.dart';
import 'kp_semantic_colors.dart';

/// Assembles light and dark [ThemeData] from the design tokens.
///
/// This is the only place tokens are turned into a Flutter theme. Widgets read
/// everything they need from `Theme.of(context)` / `context.*` extensions.
@immutable
abstract final class KpTheme {
  const KpTheme._();

  static ThemeData get light => _build(
    brightness: Brightness.light,
    scheme: _lightScheme,
    semantic: KpSemanticColors.light,
    textColor: KpColors.neutral900,
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    scheme: _darkScheme,
    semantic: KpSemanticColors.dark,
    textColor: KpColors.neutral50,
  );

  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: KpColors.brand500,
    onPrimary: KpColors.neutral0,
    primaryContainer: KpColors.brand100,
    onPrimaryContainer: KpColors.brand900,
    secondary: KpColors.brand700,
    onSecondary: KpColors.neutral0,
    secondaryContainer: KpColors.brand50,
    onSecondaryContainer: KpColors.brand800,
    error: KpColors.error500,
    onError: KpColors.neutral0,
    errorContainer: KpColors.error100,
    onErrorContainer: KpColors.neutral900,
    surface: KpColors.neutral0,
    onSurface: KpColors.neutral900,
    surfaceContainerHighest: KpColors.neutral100,
    onSurfaceVariant: KpColors.neutral600,
    outline: KpColors.neutral300,
    outlineVariant: KpColors.neutral200,
  );

  static const ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: KpColors.brand300,
    onPrimary: KpColors.neutral900,
    primaryContainer: KpColors.brand800,
    onPrimaryContainer: KpColors.brand50,
    secondary: KpColors.brand200,
    onSecondary: KpColors.neutral900,
    secondaryContainer: KpColors.brand700,
    onSecondaryContainer: KpColors.brand50,
    error: KpColors.error500,
    onError: KpColors.neutral0,
    errorContainer: Color(0xFF4A1D1D),
    onErrorContainer: KpColors.error100,
    surface: KpColors.neutral900,
    onSurface: KpColors.neutral50,
    surfaceContainerHighest: KpColors.neutral800,
    onSurfaceVariant: KpColors.neutral300,
    outline: KpColors.neutral600,
    outlineVariant: KpColors.neutral700,
  );

  static ThemeData _build({
    required Brightness brightness,
    required ColorScheme scheme,
    required KpSemanticColors semantic,
    required Color textColor,
  }) {
    final textTheme = KpTypography.buildTextTheme(textColor);
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: textTheme,
      fontFamily: KpTypography.fontFamily,
      extensions: <ThemeExtension<dynamic>>[semantic],
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: KpSpacing.m,
          vertical: KpSpacing.s,
        ),
        border: const OutlineInputBorder(
          borderRadius: KpRadii.allM,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: KpRadii.allM,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: KpRadii.allM,
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: KpRadii.allM,
          borderSide: BorderSide(color: scheme.error, width: 1),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: const RoundedRectangleBorder(borderRadius: KpRadii.allM),
          textStyle: textTheme.labelLarge,
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: KpRadii.allL),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        space: KpSpacing.m,
        thickness: 1,
      ),
    );
  }
}
