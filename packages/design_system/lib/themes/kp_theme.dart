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
    scaffoldBackground: KpColors.surface, // soft slate, cards float on top
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    scheme: _darkScheme,
    semantic: KpSemanticColors.dark,
    textColor: KpColors.neutral50,
    scaffoldBackground: KpColors.navyBackground,
  );

  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: KpColors.brand500,
    onPrimary: KpColors.neutral0,
    primaryContainer: KpColors.brand100,
    onPrimaryContainer: KpColors.brand900,
    // Secondary is the gold rewards accent (spec _1).
    secondary: KpColors.gold500,
    onSecondary: KpColors.neutral900,
    secondaryContainer: KpColors.gold100,
    onSecondaryContainer: KpColors.neutral900,
    error: KpColors.error500,
    onError: KpColors.neutral0,
    errorContainer: KpColors.error100,
    onErrorContainer: KpColors.neutral900,
    surface: KpColors.neutral0,
    onSurface: KpColors.neutral900,
    surfaceContainer: KpColors.surfaceContainer,
    surfaceContainerHighest: KpColors.surfaceContainerHighest,
    onSurfaceVariant: KpColors.neutral600,
    outline: KpColors.neutral300,
    outlineVariant: KpColors.neutral200,
  );

  // Dark mode shifts to a deep navy (spec _1): background #141e2a, surfaces
  // #202f3e, with the brand blue keeping its vibrance.
  static const ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: KpColors.brand400,
    onPrimary: KpColors.neutral900,
    primaryContainer: KpColors.brand800,
    onPrimaryContainer: KpColors.brand50,
    secondary: KpColors.gold500,
    onSecondary: KpColors.neutral900,
    secondaryContainer: KpColors.brand700,
    onSecondaryContainer: KpColors.brand50,
    error: KpColors.error500,
    onError: KpColors.neutral0,
    errorContainer: Color(0xFF4A1D1D),
    onErrorContainer: KpColors.error100,
    surface: KpColors.navyBackground,
    onSurface: KpColors.neutral50,
    surfaceContainer: KpColors.navySurface,
    surfaceContainerHighest: KpColors.navySurfaceHigh,
    onSurfaceVariant: KpColors.neutral300,
    outline: KpColors.navyOutline,
    outlineVariant: KpColors.navyOutline,
  );

  static ThemeData _build({
    required Brightness brightness,
    required ColorScheme scheme,
    required KpSemanticColors semantic,
    required Color textColor,
    required Color scaffoldBackground,
  }) {
    final textTheme = KpTypography.buildTextTheme(textColor);
    final inputFill = brightness == Brightness.light
        ? KpColors.neutral0
        : scheme.surfaceContainer;
    // Inputs use a thick 2px resting border with a brand glow on focus.
    OutlineInputBorder inputBorder(Color color, double width) =>
        OutlineInputBorder(
          borderRadius: KpRadii.allM,
          borderSide: BorderSide(color: color, width: width),
        );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: textTheme,
      fontFamily: KpTypography.fontFamily,
      extensions: <ThemeExtension<dynamic>>[semantic],
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackground,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: KpSpacing.m,
          vertical: KpSpacing.s,
        ),
        labelStyle: KpTypography.labelCaps.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        floatingLabelStyle: KpTypography.labelCaps.copyWith(
          color: scheme.primary,
        ),
        border: inputBorder(scheme.outline, 2),
        enabledBorder: inputBorder(scheme.outline, 2),
        focusedBorder: inputBorder(scheme.primary, 2),
        errorBorder: inputBorder(scheme.error, 2),
        focusedErrorBorder: inputBorder(scheme.error, 2),
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
        shape: RoundedRectangleBorder(borderRadius: KpRadii.allXl),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: true,
        shape: RoundedRectangleBorder(borderRadius: KpRadii.topSheet),
      ),
      dialogTheme: const DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: KpRadii.allXl),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        space: KpSpacing.m,
        thickness: 1,
      ),
    );
  }
}
