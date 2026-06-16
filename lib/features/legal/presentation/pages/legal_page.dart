import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/legal/presentation/pages/legal_document_page.dart';

/// Legal hub: Terms, Privacy, and the (store-required) delete-account entry.
class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  void _openDoc(BuildContext context, String title) {
    Navigator.of(context).push<void>(
      MaterialPageRoute(builder: (_) => LegalDocumentPage(title: title)),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.l10n.legalDeleteAccount),
        content: Text(dialogContext.l10n.legalDeleteWarning),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(dialogContext.l10n.retry),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.legalTitle)),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(context.l10n.legalTerms),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openDoc(context, context.l10n.legalTerms),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(context.l10n.legalPrivacy),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openDoc(context, context.l10n.legalPrivacy),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.delete_outline,
              color: context.colorScheme.error,
            ),
            title: Text(
              context.l10n.legalDeleteAccount,
              style: TextStyle(color: context.colorScheme.error),
            ),
            onTap: () => _confirmDelete(context),
          ),
        ],
      ),
    );
  }
}
