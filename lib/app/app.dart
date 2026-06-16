import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:keenpockets/core/design_system/design_system.dart';
import 'package:keenpockets/core/localization/generated/app_localizations.dart';
import 'router/app_router.dart';

/// Root widget. Owns theming, localization and routing. Holds no business
/// logic — feature screens get their state from their own Blocs.
class KeenPocketsApp extends StatefulWidget {
  const KeenPocketsApp({super.key});

  @override
  State<KeenPocketsApp> createState() => _KeenPocketsAppState();
}

class _KeenPocketsAppState extends State<KeenPocketsApp> {
  late final GoRouter _router = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      theme: KpTheme.light,
      darkTheme: KpTheme.dark,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}
