import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

/// Semantic colors that don't fit Material's [ColorScheme] (success/warning/
/// info) exposed as a [ThemeExtension] so they switch with light/dark mode.
///
/// Read via `context.colors.success` (see extensions/context_extensions.dart).
@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    required this.successContainer,
    required this.warningContainer,
    required this.infoContainer,
  });

  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;
  final Color successContainer;
  final Color warningContainer;
  final Color infoContainer;

  static const AppSemanticColors light = AppSemanticColors(
    success: AppColors.success500,
    onSuccess: AppColors.neutral0,
    warning: AppColors.warning500,
    onWarning: AppColors.neutral900,
    info: AppColors.info500,
    onInfo: AppColors.neutral0,
    successContainer: AppColors.success100,
    warningContainer: AppColors.warning100,
    infoContainer: AppColors.info100,
  );

  static const AppSemanticColors dark = AppSemanticColors(
    success: AppColors.success500,
    onSuccess: AppColors.neutral0,
    warning: AppColors.warning500,
    onWarning: AppColors.neutral900,
    info: AppColors.brand300,
    onInfo: AppColors.neutral900,
    successContainer: Color(0xFF173B27),
    warningContainer: Color(0xFF3D3414),
    infoContainer: Color(0xFF13294B),
  );

  @override
  AppSemanticColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? successContainer,
    Color? warningContainer,
    Color? infoContainer,
  }) {
    return AppSemanticColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      successContainer: successContainer ?? this.successContainer,
      warningContainer: warningContainer ?? this.warningContainer,
      infoContainer: infoContainer ?? this.infoContainer,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
    );
  }
}
