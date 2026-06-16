import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';

/// Embeddable donate card for a pocket-scoped charity drive (map §3: composed
/// into `PocketDetailPage`). Shows progress toward the goal and collects a
/// donation amount. Presentation-only: [onDonate] receives the entered amount.
class CharityDonateCard extends StatefulWidget {
  const CharityDonateCard({required this.drive, this.onDonate, super.key});

  final CharityView drive;
  final ValueChanged<Money>? onDonate;

  @override
  State<CharityDonateCard> createState() => _CharityDonateCardState();
}

class _CharityDonateCardState extends State<CharityDonateCard> {
  final _amount = TextEditingController();

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  void _donate() {
    final naira = num.tryParse(_amount.text.trim()) ?? 0;
    if (naira <= 0) return;
    widget.onDonate?.call(Money.naira(naira));
    _amount.clear();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.drive;
    final percent = (d.progress * 100).round();
    return KpCard.financial(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.volunteer_activism_rounded,
                color: context.colorScheme.primary,
              ),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(d.title, style: context.textTheme.titleLarge),
              ),
              _ReachedPill(percent: percent),
            ],
          ),
          const Gap.m(),
          KpProgressBar(value: d.progress),
          const Gap.s(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.charityRaised(d.raised.format()),
                style: context.textTheme.titleMedium,
              ),
              Text(
                context.l10n.charityGoal(d.goal.format()),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.l(),
          Text(
            context.l10n.charityEnterAmount,
            style: context.textTheme.labelLarge,
          ),
          const Gap.xs(),
          KpTextField(
            label: context.l10n.contributeAmountLabel,
            controller: _amount,
            keyboardType: TextInputType.number,
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.charityDonateNow,
            icon: Icons.favorite_rounded,
            onPressed: _donate,
          ),
          const Gap.s(),
          Row(
            children: [
              Icon(
                Icons.shield_outlined,
                size: KpSpacing.m,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap.xxs(horizontal: true),
              Expanded(
                child: Text(
                  context.l10n.charitySecure,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReachedPill extends StatelessWidget {
  const _ReachedPill({required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        context.l10n.charityReached(percent),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
