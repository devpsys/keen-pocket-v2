import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/pages/contribute_page.dart';

/// Reusable "Contribute" call-to-action exported by the `contributions` feature
/// and composed onto pocket/adashi detail hubs (map §3). Opens the contribute
/// flow for [target]; calls [onContributed] when a contribution succeeds.
class ContributeButton extends StatelessWidget {
  const ContributeButton({
    required this.target,
    this.onContributed,
    this.icon = Icons.add_rounded,
    super.key,
  });

  final ContributionContext target;
  final VoidCallback? onContributed;
  final IconData icon;

  Future<void> _open(BuildContext context) async {
    final paid = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (_) => ContributePage(context: target)),
    );
    if (paid ?? false) onContributed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return KpButton(
      label: context.l10n.contributeTitle,
      icon: icon,
      onPressed: () => _open(context),
    );
  }
}
