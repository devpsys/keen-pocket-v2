import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/contributions.dart';
import 'package:keenpockets/features/group_collaboration/group_collaboration.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_state.dart';
import 'package:keenpockets/features/pockets/presentation/view_models/shopping_item_view.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_shopping_section.dart';
import 'package:keenpockets/features/trust/trust.dart';

// PRESENTATION-ONLY placeholder data for the hub's composed sections.
typedef _Member = ({String name, int hands, bool kyc});
typedef _Contributor = ({String name, Money amount});
typedef _Contribution = ({String period, Money amount, bool paid});

const _organiserName = 'Musa';

const _contributions = <_Contribution>[
  (period: 'May 2024', amount: Money(500000), paid: true),
  (period: 'June 2024', amount: Money(500000), paid: false),
];

const _members = <_Member>[
  (name: 'Amaka', hands: 2, kyc: true),
  (name: 'David O.', hands: 1, kyc: false),
  (name: 'Sarah Bello', hands: 3, kyc: true),
];

const _topContributors = <_Contributor>[
  (name: 'Sarah Bello', amount: Money(4500000)),
  (name: 'Amaka', amount: Money(3000000)),
  (name: 'Musa', amount: Money(2500000)),
];

const _shoppingItems = <ShoppingItemView>[
  ShoppingItemView(
    id: 's1',
    name: 'Bulk Turkey (20kg)',
    category: 'Protein',
    unitPrice: Money(4500000),
    peopleSharing: 4,
    totalCost: Money(4500000),
    emoji: '🍗',
  ),
];

const _pendingDonor = (name: 'Bolanle Ade', amount: Money(1000000));

const _payout = (
  bank: 'Kuda Bank',
  nuban: '**** 8291',
  holder: 'Musa Ibrahim · Primary',
);

/// The pocket detail hub (design phase D — `pocket_detail_hub`). Assembles the
/// owning feature's page from cross-feature composables (map §3).
class PocketDetailPage extends StatelessWidget {
  const PocketDetailPage({required this.pocketId, super.key});

  final String pocketId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PocketDetailCubit>(
      create: (_) => getIt<PocketDetailCubit>()..load(pocketId),
      child: const _PocketDetailView(),
    );
  }
}

class _PocketDetailView extends StatelessWidget {
  const _PocketDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.pocketsTitle)),
      floatingActionButton: BlocBuilder<PocketDetailCubit, PocketDetailState>(
        builder: (context, state) {
          final pocket = state.pocket;
          if (pocket == null) return const SizedBox.shrink();
          return GroupChatFab(groupId: pocket.id, unreadCount: 3);
        },
      ),
      body: BlocBuilder<PocketDetailCubit, PocketDetailState>(
        builder: (context, state) {
          final pocket = state.pocket;
          return KpAsyncView(
            status: state.status,
            failure: KpErrorView(
              message:
                  state.failure?.localizedMessage(context) ??
                  context.l10n.errorGeneric,
              retryLabel: context.l10n.retry,
            ),
            loaded: (context) {
              if (pocket == null) return const SizedBox.shrink();
              return ListView(
                padding: const EdgeInsets.all(KpSpacing.l),
                children: [
                  _HeaderCard(pocket: pocket, role: state.role),
                  const Gap.m(),
                  const _PendingApprovals(),
                  const Gap.m(),
                  _ProgressCard(pocket: pocket),
                  const Gap.l(),
                  _ContributionsSection(pocket: pocket, role: state.role),
                  const Gap.l(),
                  const PocketShoppingSection(
                    items: _shoppingItems,
                    estimatedTotal: Money(4500000),
                  ),
                  const Gap.l(),
                  const _PayoutCard(),
                  const Gap.l(),
                  const _MembersSection(),
                  const Gap.l(),
                  const _TopContributorsCard(),
                  const Gap.l(),
                  const _GroupRulesCard(),
                  const Gap.xl(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.pocket, required this.role});

  final Pocket pocket;
  final PocketRole role;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: KpRadii.allXl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gradient banner with the status pill + reputation chip.
          Container(
            height: 72,
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [context.colorScheme.primary, context.colors.warning],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Pill(
                  label: context.l10n.pocketStatusOpen,
                  tone: _PillTone.success,
                ),
                const Spacer(),
                const ReputationChip(score: 48, band: '4.8'),
              ],
            ),
          ),
          Container(
            color: context.colorScheme.surface,
            padding: const EdgeInsets.all(KpSpacing.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pocket.name, style: context.textTheme.headlineMedium),
                const Gap.xxs(),
                Text(
                  context.l10n.pocketDetailHandDuration(
                    pocket.handPrice.format(),
                  ),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    const KycBadge(showLabel: false),
                    const Gap.xxs(horizontal: true),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _organiserName,
                            style: context.textTheme.labelLarge,
                          ),
                          Text(
                            context.l10n.pocketOrganiser,
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap.s(),
                Row(
                  children: [
                    Expanded(
                      child: KpButton(
                        label: context.l10n.pocketDetailRateAdmin,
                        variant: KpButtonVariant.ghost,
                        onPressed: () => RateOrganiserSheet.show(
                          context,
                          organiserName: _organiserName,
                        ),
                      ),
                    ),
                    const Gap.s(horizontal: true),
                    Expanded(
                      child: KpButton(
                        label: context.l10n.pocketDetailShare,
                        icon: Icons.share_rounded,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PendingApprovals extends StatelessWidget {
  const _PendingApprovals();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.errorContainer.withValues(alpha: 0.4),
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.error, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.pending_actions_rounded,
                color: context.colorScheme.error,
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.pocketDetailPendingApprovals,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
          const Gap.s(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _pendingDonor.name,
                      style: context.textTheme.bodyMedium,
                    ),
                    Text(
                      _pendingDonor.amount.format(),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              KpButton(
                label: context.l10n.pocketDetailMarkPaid,
                variant: KpButtonVariant.secondary,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.pocket});

  static const double _ringSize = 140;

  final Pocket pocket;

  @override
  Widget build(BuildContext context) {
    final progress = pocket.fillRate == 0 ? 0.5 : pocket.fillRate;
    return KpCard(
      child: Column(
        children: [
          SizedBox(
            width: _ringSize,
            height: _ringSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: KpSpacing.s,
                    strokeCap: StrokeCap.round,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                  ),
                ),
                Text(
                  '${(progress * 100).round()}%',
                  style: context.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const Gap.m(),
          Text(
            context.l10n.pocketDetailMyProgress,
            style: context.textTheme.titleMedium,
          ),
          const Gap.xs(),
          Text(
            context.l10n.pocketDetailProgressDesc(
              const Money(1500000).format(),
              const Money(3000000).format(),
            ),
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Gap.s(),
          _Pill(
            label: context.l10n.pocketDetailMonthsCompleted(3, 6),
            tone: _PillTone.info,
          ),
          const Gap.l(),
          ContributeButton(
            target: ContributionContext.pocket(pocket.id),
            variant: KpButtonVariant.secondary,
          ),
        ],
      ),
    );
  }
}

class _ContributionsSection extends StatelessWidget {
  const _ContributionsSection({required this.pocket, required this.role});

  final Pocket pocket;
  final PocketRole role;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.pocketDetailMyContributions,
              style: context.textTheme.titleLarge,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push<void>(
                MaterialPageRoute(
                  builder: (_) => InvoiceHistoryPage(
                    context: ContributionContext.pocket(pocket.id),
                    canVerify: role == PocketRole.organiser,
                  ),
                ),
              ),
              child: Text(
                context.l10n.pocketDetailViewAll,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        const Gap.s(),
        for (final c in _contributions) ...[
          _ContributionTile(contribution: c),
          const Gap.s(),
        ],
      ],
    );
  }
}

class _ContributionTile extends StatelessWidget {
  const _ContributionTile({required this.contribution});

  final _Contribution contribution;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_rounded,
            color: context.colorScheme.primary,
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contribution.period, style: context.textTheme.titleMedium),
                Text(
                  contribution.amount.format(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          _Pill(
            label: contribution.paid
                ? context.l10n.pocketDetailPaid
                : context.l10n.pocketDetailNotPaid,
            tone: contribution.paid ? _PillTone.success : _PillTone.warning,
          ),
        ],
      ),
    );
  }
}

class _MembersSection extends StatelessWidget {
  const _MembersSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.l10n.pocketDetailMembers,
          style: context.textTheme.titleLarge,
        ),
        const Gap.s(),
        KpCard(
          child: Column(
            children: [
              for (final m in _members)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: KpSpacing.xs),
                  child: Row(
                    children: [
                      CircleAvatar(child: Text(m.name.characters.first)),
                      const Gap.s(horizontal: true),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(m.name, style: context.textTheme.titleMedium),
                            Text(
                              context.l10n.pocketMemberHands(m.hands),
                              style: context.textTheme.labelSmall?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (m.kyc) const KycBadge(showLabel: false),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopContributorsCard extends StatelessWidget {
  const _TopContributorsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colors.warningContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.emoji_events_rounded, color: context.colors.warning),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.pocketDetailTopContributors,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
          const Gap.s(),
          for (var i = 0; i < _topContributors.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxs),
              child: Row(
                children: [
                  Text('${i + 1}', style: context.textTheme.titleMedium),
                  const Gap.s(horizontal: true),
                  Expanded(
                    child: Text(
                      _topContributors[i].name,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    _topContributors[i].amount.format(),
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _GroupRulesCard extends StatelessWidget {
  const _GroupRulesCard();

  @override
  Widget build(BuildContext context) {
    final rules = [
      context.l10n.pocketDetailRule1,
      context.l10n.pocketDetailRule2,
      context.l10n.pocketDetailRule3,
    ];
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.pocketDetailGroupRules,
            style: context.textTheme.titleLarge,
          ),
          const Gap.s(),
          for (final rule in rules)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: KpSpacing.m,
                    color: context.colorScheme.primary,
                  ),
                  const Gap.xs(horizontal: true),
                  Expanded(
                    child: Text(rule, style: context.textTheme.bodySmall),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _PayoutCard extends StatelessWidget {
  const _PayoutCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.primaryContainer,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_rounded,
                color: context.colorScheme.onPrimary,
                size: KpSpacing.l,
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.pocketDetailPayoutAccount,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Text(
            _payout.bank,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap.xxs(),
          Text(
            _payout.nuban,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap.xxs(),
          Text(
            _payout.holder,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

enum _PillTone { success, neutral, info, warning }

class _Pill extends StatelessWidget {
  const _Pill({required this.label, this.tone = _PillTone.neutral});

  final String label;
  final _PillTone tone;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color fg) = switch (tone) {
      _PillTone.success => (
        context.colors.successContainer,
        context.colors.success,
      ),
      _PillTone.warning => (
        context.colors.warningContainer,
        context.colors.warning,
      ),
      _PillTone.info => (
        context.colorScheme.primaryContainer,
        context.colorScheme.onPrimaryContainer,
      ),
      _PillTone.neutral => (
        context.colorScheme.surfaceContainerHighest,
        context.colorScheme.onSurfaceVariant,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}
