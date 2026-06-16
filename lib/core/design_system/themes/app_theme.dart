import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../radius/app_radius.dart';
import '../spacing/app_spacing.dart';
import '../typography/app_typography.dart';
import 'app_semantic_colors.dart';

/// Assembles light and dark [ThemeData] from the design tokens.
///
/// This is the only place tokens are turned into a Flutter theme. Widgets read
/// everything they need from `Theme.of(context)` / `context.*` extensions.
@immutable
abstract final class AppTheme {
  const AppTheme._();

  static ThemeData get light => _build(
    brightness: Brightness.light,
    scheme: _lightScheme,
    semantic: AppSemanticColors.light,
    textColor: AppColors.neutral900,
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    scheme: _darkScheme,
    semantic: AppSemanticColors.dark,
    textColor: AppColors.neutral50,
  );

  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.brand500,
    onPrimary: AppColors.neutral0,
    primaryContainer: AppColors.brand100,
    onPrimaryContainer: AppColors.brand900,
    secondary: AppColors.brand700,
    onSecondary: AppColors.neutral0,
    secondaryContainer: AppColors.brand50,
    onSecondaryContainer: AppColors.brand800,
    error: AppColors.error500,
    onError: AppColors.neutral0,
    errorContainer: AppColors.error100,
    onErrorContainer: AppColors.neutral900,
    surface: AppColors.neutral0,
    onSurface: AppColors.neutral900,
    surfaceContainerHighest: AppColors.neutral100,
    onSurfaceVariant: AppColors.neutral600,
    outline: AppColors.neutral300,
    outlineVariant: AppColors.neutral200,
  );

  static const ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.brand300,
    onPrimary: AppColors.neutral900,
    primaryContainer: AppColors.brand800,
    onPrimaryContainer: AppColors.brand50,
    secondary: AppColors.brand200,
    onSecondary: AppColors.neutral900,
    secondaryContainer: AppColors.brand700,
    onSecondaryContainer: AppColors.brand50,
    error: AppColors.error500,
    onError: AppColors.neutral0,
    errorContainer: Color(0xFF4A1D1D),
    onErrorContainer: AppColors.error100,
    surface: AppColors.neutral900,
    onSurface: AppColors.neutral50,
    surfaceContainerHighest: AppColors.neutral800,
    onSurfaceVariant: AppColors.neutral300,
    outline: AppColors.neutral600,
    outlineVariant: AppColors.neutral700,
  );

  static ThemeData _build({
    required Brightness brightness,
    required ColorScheme scheme,
    required AppSemanticColors semantic,
    required Color textColor,
  }) {
    final textTheme = AppTypography.buildTextTheme(textColor);
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      textTheme: textTheme,
      fontFamily: AppTypography.fontFamily,
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
          horizontal: AppSpacing.m,
          vertical: AppSpacing.s,
        ),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.allM,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.allM,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.allM,
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.allM,
          borderSide: BorderSide(color: scheme.error, width: 1),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.allM),
          textStyle: textTheme.labelLarge,
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.allL),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        space: AppSpacing.m,
        thickness: 1,
      ),
    );
  }
}
