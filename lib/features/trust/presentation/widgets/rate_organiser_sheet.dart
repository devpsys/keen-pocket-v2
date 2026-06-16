import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Modal bottom sheet to rate a group organiser (map §3 — launched from a
/// pocket/adashi detail). Presentation-only: returns the selected star count
/// (1–5) on submit, or null if dismissed.
class RateOrganiserSheet extends StatefulWidget {
  const RateOrganiserSheet({required this.organiserName, super.key});

  final String organiserName;

  static Future<int?> show(
    BuildContext context, {
    required String organiserName,
  }) {
    return showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => RateOrganiserSheet(organiserName: organiserName),
    );
  }

  @override
  State<RateOrganiserSheet> createState() => _RateOrganiserSheetState();
}

class _RateOrganiserSheetState extends State<RateOrganiserSheet> {
  final _comment = TextEditingController();
  int _stars = 0;

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: KpSpacing.l,
        right: KpSpacing.l,
        top: KpSpacing.s,
        bottom: KpSpacing.l + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.trustRateTitle(widget.organiserName),
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const Gap.l(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 1; i <= 5; i++)
                IconButton(
                  onPressed: () => setState(() => _stars = i),
                  icon: Icon(
                    i <= _stars
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    size: KpSpacing.xl,
                    color: context.colors.warning,
                  ),
                ),
            ],
          ),
          const Gap.m(),
          KpTextField(
            label: context.l10n.trustRateCommentHint,
            controller: _comment,
          ),
          const Gap.l(),
          KpButton(
            label: context.l10n.trustRateSubmit,
            onPressed: _stars == 0
                ? null
                : () => Navigator.of(context).pop(_stars),
          ),
        ],
      ),
    );
  }
}
