import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/generated/app_localizations.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';

import 'router/app_router.dart';

/// Root widget. Owns theming, localization and routing, and provides the
/// app-wide [AuthBloc] (shared by the login screen and the shell's logout).
class KeenPocketsApp extends StatefulWidget {
  const KeenPocketsApp({super.key});

  @override
  State<KeenPocketsApp> createState() => _KeenPocketsAppState();
}

class _KeenPocketsAppState extends State<KeenPocketsApp> {
  late final GoRouter _router = createRouter(getIt<SessionManager>());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>(),
      child: MaterialApp.router(
        onGenerateTitle: (context) => AppLocalizations.of(context).appName,
        debugShowCheckedModeBanner: false,
        theme: KpTheme.light,
        darkTheme: KpTheme.dark,
        themeMode: ThemeMode.system,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _router,
      ),
    );
  }
}
