import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Renders a bundled legal document (Terms / Privacy). Body is a placeholder
/// until the real text is bundled.
class LegalDocumentPage extends StatelessWidget {
  const LegalDocumentPage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(KpSpacing.l),
        child: Text(
          context.l10n.legalPlaceholderBody,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
