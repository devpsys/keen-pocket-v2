import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:keenpockets/core/design_system/design_system.dart';
import 'package:keenpockets/core/localization/generated/app_localizations.dart';

/// Wraps [widget] in the minimum app scaffolding (theme + localization) needed
/// for widget tests, so individual tests don't repeat the boilerplate.
extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }
}
