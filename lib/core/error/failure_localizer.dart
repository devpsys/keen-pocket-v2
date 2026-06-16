import 'package:flutter/widgets.dart';

import '../localization/l10n_extension.dart';
import 'failures.dart';

/// Maps a [Failure] to a localized, user-facing message.
///
/// This is the bridge between the (non-localized) domain failure model and the
/// localization layer — keeping presentation free of hardcoded error strings.
extension FailureLocalizer on Failure {
  String localizedMessage(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      NetworkFailure() => l10n.errorNetwork,
      ServerFailure() => l10n.errorServer,
      AuthFailure() => l10n.errorUnauthorized,
      PermissionFailure() => l10n.errorPermission,
      FeatureDisabledFailure() => l10n.errorFeatureDisabled,
      CacheFailure() => l10n.errorCache,
      ValidationFailure() => l10n.errorValidation,
      UnexpectedFailure() => l10n.errorGeneric,
    };
  }
}
