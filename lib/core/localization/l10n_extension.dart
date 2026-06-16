import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';

/// Ergonomic access to localized strings: `context.l10n.login`.
///
/// This is the ONLY sanctioned way to read user-facing text. Hardcoded string
/// literals in widgets are rejected by the `no_hardcoded_strings` lint.
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
