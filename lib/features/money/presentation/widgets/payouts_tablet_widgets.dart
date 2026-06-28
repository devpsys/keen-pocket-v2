import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_state.dart';
import 'package:keenpockets/features/money/presentation/view_models/payout_view.dart';
import 'package:keenpockets/features/money/presentation/widgets/payouts_widgets.dart';

/// Tablet "Payouts & Bank Hub" (design `payouts_bank_hub_tablet`): a payout-form
/// + payouts-received column on the left and a collections / mascot / total
/// column on the right. The nav rail is provided by `AppTabletShell`.
class PayoutsTabletView extends StatelessWidget {
  const PayoutsTabletView({required this.state, super.key});

  final PayoutsState state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const _PayoutAccountCard(),
                  const Gap.l(),
                  _PayoutsReceivedCard(payouts: state.payouts),
                ],
              ),
            ),
            const Gap.l(horizontal: true),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CollectionsHeader(),
                  const Gap.m(),
                  for (final c in state.tabletCollections) ...[
                    _CollectionCard(collection: c),
                    const Gap.m(),
                  ],
                  if (state.mascotTip != null) ...[
                    const Gap.xs(),
                    _MascotCard(tip: state.mascotTip!),
                  ],
                  if (state.totalCollected != null) ...[
                    const Gap.l(),
                    _TotalCollectedCard(total: state.totalCollected!),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PayoutAccountCard extends StatefulWidget {
  const _PayoutAccountCard();

  @override
  State<_PayoutAccountCard> createState() => _PayoutAccountCardState();
}

class _PayoutAccountCardState extends State<_PayoutAccountCard> {
  final _nuban = TextEditingController();

  @override
  void dispose() {
    _nuban.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: payoutCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: KpSpacing.xl,
                height: KpSpacing.xl,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer.withValues(
                    alpha: 0.2,
                  ),
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(
                  Icons.account_balance_rounded,
                  color: context.colorScheme.primary,
                ),
              ),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.payoutsMyAccount,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.l(),
          Text(
            context.l10n.payoutsSelectReceivingBank,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          BankDropdown(hint: context.l10n.payoutsSelectReceivingBank),
          const Gap.m(),
          Text(
            context.l10n.payoutsNubanLabel,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          TextField(
            controller: _nuban,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: context.l10n.payoutsNubanHintTablet,
            ),
          ),
          const Gap.l(),
          KpButton(label: context.l10n.payoutsUpdateDetails, onPressed: () {}),
        ],
      ),
    );
  }
}

class _PayoutsReceivedCard extends StatelessWidget {
  const _PayoutsReceivedCard({required this.payouts});

  final List<PayoutView> payouts;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: payoutCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.history_rounded,
                    color: context.colorScheme.primary,
                  ),
                  const Gap.s(horizontal: true),
                  Text(
                    context.l10n.payoutsReceived,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(context.l10n.payoutsViewAll),
              ),
            ],
          ),
          const Gap.s(),
          for (final p in payouts) _TabletPayoutRow(payout: p),
        ],
      ),
    );
  }
}

class _TabletPayoutRow extends StatelessWidget {
  const _TabletPayoutRow({required this.payout});

  final PayoutView payout;

  @override
  Widget build(BuildContext context) {
    final s = payoutStatusStyle(context, payout.status);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
      child: Row(
        children: [
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: s.bg, shape: BoxShape.circle),
            child: Icon(payoutStatusIcon(payout.status), color: s.fg),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payout.amount.format(),
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  '${payout.dateLabel} • ${payout.bankName}',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          PayoutStatusPill(status: payout.status, label: s.label),
        ],
      ),
    );
  }
}

class _CollectionsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: KpSpacing.xl,
          height: KpSpacing.xl,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.colorScheme.tertiaryContainer.withValues(alpha: 0.3),
            borderRadius: KpRadii.allM,
          ),
          child: Icon(
            Icons.savings_rounded,
            color: context.colorScheme.tertiary,
          ),
        ),
        const Gap.s(horizontal: true),
        Text(
          context.l10n.payoutsPocketCollections,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _CollectionCard extends StatelessWidget {
  const _CollectionCard({required this.collection});

  final PayoutCollectionView collection;

  @override
  Widget build(BuildContext context) {
    final pct = (collection.percent * 100).round();
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  collection.name.toUpperCase(),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              _BankChip(bank: collection.bankName),
            ],
          ),
          const Gap.xs(),
          Text(
            collection.amount.format(),
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                collection.progressLabel ??
                    context.l10n.payoutsCollectionProgress,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '$pct%',
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.xs(),
          KpProgressBar(
            value: collection.percent,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _BankChip extends StatelessWidget {
  const _BankChip({required this.bank});

  final String bank;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        bank,
        style: context.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _MascotCard extends StatelessWidget {
  const _MascotCard({required this.tip});

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.2),
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lightbulb_rounded,
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Text(
              tip,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalCollectedCard extends StatelessWidget {
  const _TotalCollectedCard({required this.total});

  final Money total;

  @override
  Widget build(BuildContext context) {
    final onDark = context.colorScheme.onInverseSurface;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.inverseSurface,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.payoutsTotalCollected.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: onDark.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  total.format(),
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: onDark,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.trending_up_rounded,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
