import 'package:flutter/material.dart';

import 'package:keenpockets/core/design_system/design_system.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Placeholder destination after a successful login.
///
/// A real dashboard feature would follow the same data/domain/presentation
/// split as `authentication` (see docs/feature_creation_guide.md). It is kept
/// minimal here so the sample demonstrates a complete navigation loop.
class DashboardPage extends StatelessWidget {
  const DashboardPage({this.onLogout, super.key});

  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.dashboardTitle),
        actions: [
          IconButton(
            onPressed: onLogout,
            icon: const Icon(Icons.logout),
            tooltip: context.l10n.logout,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(KpSpacing.l),
          child: Text(
            context.l10n.welcome,
            style: context.textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
