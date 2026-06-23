import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Rate-the-organiser modal (design `rate_organiser_modal` / `_tablet`):
/// a mascot, a 5-star rating and an optional comment. Launched from a
/// pocket/adashi detail. Presentation-only: returns the selected star count
/// (1–5) on submit, or null if dismissed. On phones it's a bottom sheet; on
/// tablets a centered dialog.
class RateOrganiserSheet extends StatefulWidget {
  const RateOrganiserSheet({required this.organiserName, super.key});

  final String organiserName;

  static Future<int?> show(
    BuildContext context, {
    required String organiserName,
  }) {
    if (context.isExpanded) {
      return showDialog<int>(
        context: context,
        builder: (_) => Dialog(
          insetPadding: const EdgeInsets.all(KpSpacing.xl),
          shape: const RoundedRectangleBorder(borderRadius: KpRadii.allXl),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: RateOrganiserSheet(organiserName: organiserName),
          ),
        ),
      );
    }
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
  void initState() {
    super.initState();
    _comment.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _comment.dispose();
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
          const Gap.s(),
          const _RatingMascot(),
          const Gap.m(),
          Text(
            context.l10n.rateOrganiserTitle,
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const Gap.xxs(),
          Text(
            context.l10n.rateOrganiserSubtitle,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap.l(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 1; i <= 5; i++)
                IconButton(
                  onPressed: () => setState(() => _stars = i),
                  iconSize: KpSpacing.xxl,
                  icon: Icon(
                    Icons.star_rounded,
                    color: i <= _stars
                        ? KpColors.gold500
                        : context.colorScheme.surfaceContainerHighest,
                  ),
                ),
            ],
          ),
          const Gap.l(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.l10n.rateOrganiserCommentLabel,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap.xs(),
          _CommentField(controller: _comment),
          const Gap.xxs(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              context.l10n.rateOrganiserCounter(_comment.text.length),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap.l(),
          KpButton(
            label: context.l10n.rateOrganiserSubmit,
            onPressed: _stars == 0
                ? null
                : () => Navigator.of(context).pop(_stars),
          ),
          const Gap.xs(),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.rateOrganiserCancel),
          ),
        ],
      ),
    );
  }
}

/// Mr K avatar with a heart badge (design `rate_organiser_modal`).
class _RatingMascot extends StatelessWidget {
  const _RatingMascot();

  static const double _size = 72;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: _size,
        height: _size,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 64,
              height: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                shape: BoxShape.circle,
                border: const Border(
                  bottom: BorderSide(color: KpColors.brand600, width: 4),
                ),
              ),
              child: Icon(
                Icons.face_rounded,
                color: context.colorScheme.onPrimary,
                size: KpSpacing.xl,
              ),
            ),
            Positioned(
              top: -KpSpacing.xxs,
              right: -KpSpacing.xxs,
              child: Container(
                padding: const EdgeInsets.all(KpSpacing.xxs),
                decoration: BoxDecoration(
                  color: KpColors.gold500,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colorScheme.surfaceContainerLowest,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: KpColors.gold600,
                  size: KpSpacing.s,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bordered comment textarea (design `rate_organiser_modal`).
class _CommentField extends StatelessWidget {
  const _CommentField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: TextField(
        controller: controller,
        maxLines: 4,
        maxLength: 500,
        style: context.textTheme.bodyMedium,
        decoration: InputDecoration(
          counterText: '',
          filled: false,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: KpSpacing.m),
          hintText: context.l10n.rateOrganiserCommentHint,
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
