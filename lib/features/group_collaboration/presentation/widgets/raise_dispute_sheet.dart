import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Raise-a-dispute modal (design `disputes_hub`): a subject + description form
/// with an admin-review notice. Launched from the disputes hub. Presentation-only:
/// returns true on submit, null if dismissed. Bottom sheet on phones, centered
/// dialog on tablets.
class RaiseDisputeSheet extends StatefulWidget {
  const RaiseDisputeSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    if (context.isExpanded) {
      return showDialog<bool>(
        context: context,
        builder: (_) => Dialog(
          insetPadding: const EdgeInsets.all(KpSpacing.xl),
          shape: const RoundedRectangleBorder(borderRadius: KpRadii.allXl),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: const RaiseDisputeSheet(),
          ),
        ),
      );
    }
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const RaiseDisputeSheet(),
    );
  }

  @override
  State<RaiseDisputeSheet> createState() => _RaiseDisputeSheetState();
}

class _RaiseDisputeSheetState extends State<RaiseDisputeSheet> {
  final _subject = TextEditingController();
  final _description = TextEditingController();

  @override
  void initState() {
    super.initState();
    _subject.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _subject.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Row(
            children: [
              Text('⚖️', style: context.textTheme.titleLarge),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.disputesRaise,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.l(),
          _FieldLabel(context.l10n.disputesSubject),
          const Gap.xs(),
          TextField(
            controller: _subject,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: context.l10n.disputesSubjectHint,
            ),
          ),
          const Gap.m(),
          _FieldLabel(context.l10n.disputesDescription),
          const Gap.xs(),
          TextField(
            controller: _description,
            minLines: 4,
            maxLines: 6,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: context.l10n.disputesDescriptionHint,
            ),
          ),
          const Gap.m(),
          _InfoNote(text: context.l10n.disputesRaiseInfo),
          const Gap.l(),
          KpButton(
            label: context.l10n.disputesSubmit,
            onPressed: _subject.text.trim().isEmpty
                ? null
                : () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.labelLarge?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _InfoNote extends StatelessWidget {
  const _InfoNote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer.withValues(alpha: 0.15),
        borderRadius: KpRadii.allM,
        border: Border.all(color: context.colorScheme.secondaryContainer),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.onSecondaryContainer,
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              text,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
