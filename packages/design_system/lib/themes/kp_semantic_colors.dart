import 'package:flutter/material.dart';

import '../colors/kp_colors.dart';

/// Semantic colors that don't fit Material's [ColorScheme] (success/warning/
/// info) exposed as a [ThemeExtension] so they switch with light/dark mode.
///
/// Read via `context.colors.success` (see extensions/context_extensions.dart).
@immutable
class KpSemanticColors extends ThemeExtension<KpSemanticColors> {
  const KpSemanticColors({
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

  static const KpSemanticColors light = KpSemanticColors(
    success: KpColors.success500,
    onSuccess: KpColors.neutral0,
    warning: KpColors.warning500,
    onWarning: KpColors.neutral900,
    info: KpColors.info500,
    onInfo: KpColors.neutral0,
    successContainer: KpColors.success100,
    warningContainer: KpColors.warning100,
    infoContainer: KpColors.info100,
  );

  static const KpSemanticColors dark = KpSemanticColors(
    success: KpColors.success500,
    onSuccess: KpColors.neutral0,
    warning: KpColors.warning500,
    onWarning: KpColors.neutral900,
    info: KpColors.brand300,
    onInfo: KpColors.neutral900,
    successContainer: Color(0xFF173B27),
    warningContainer: Color(0xFF3D3414),
    infoContainer: Color(0xFF13294B),
  );

  @override
  KpSemanticColors copyWith({
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
    return KpSemanticColors(
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
  KpSemanticColors lerp(ThemeExtension<KpSemanticColors>? other, double t) {
    if (other is! KpSemanticColors) return this;
    return KpSemanticColors(
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
