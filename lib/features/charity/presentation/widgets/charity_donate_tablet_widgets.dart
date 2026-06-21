import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_donate_card.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_fixtures.dart';

/// Tablet hero card: "Active Relief" badge, title, description, candy heart, the
/// financial goal bar and a 2-up resource bento (design `_tablet`).
class CharityDonateHeroTablet extends StatelessWidget {
  const CharityDonateHeroTablet({
    required this.drive,
    required this.resources,
    super.key,
  });

  final CharityView drive;
  final List<CharityResourceItem> resources;

  @override
  Widget build(BuildContext context) {
    return CharityCard(
      bordered: true,
      padding: const EdgeInsets.all(KpSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: KpSpacing.s,
                        vertical: KpSpacing.xxs,
                      ),
                      decoration: const BoxDecoration(
                        color: KpColors.gold500,
                        borderRadius: BorderRadius.all(
                          Radius.circular(KpRadii.pill),
                        ),
                      ),
                      child: Text(
                        context.l10n.charityActiveRelief,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: KpColors.gold600,
                        ),
                      ),
                    ),
                    const Gap.s(),
                    Text(drive.title, style: context.textTheme.headlineMedium),
                    const Gap.xs(),
                    Text(
                      context.l10n.charityDonateTabletDescription,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap.l(horizontal: true),
              Container(
                width: 88,
                height: 88,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: KpColors.tertiary100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: KpColors.tertiary500,
                  size: KpSpacing.xxl,
                ),
              ),
            ],
          ),
          const Gap.l(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                context.l10n.charityFinancialGoal,
                style: context.textTheme.labelLarge,
              ),
              Text(
                '${drive.raised.format()} / ${drive.goal.format()}',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(value: drive.progress, height: 16),
          const Gap.l(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < resources.length; i++) ...[
                if (i > 0) const Gap.m(horizontal: true),
                Expanded(child: _ResourceTile(item: resources[i])),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _ResourceTile extends StatelessWidget {
  const _ResourceTile({required this.item});

  final CharityResourceItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(item.icon, color: context.colorScheme.primary),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(item.name, style: context.textTheme.labelLarge),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(
            value: item.progress,
            color: item.tint.fill(context),
            height: 12,
          ),
          const Gap.xs(),
          Text(
            '${item.current}/${item.target}',
            textAlign: TextAlign.right,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Mr K feedback card (design `_tablet`): brand-tinted, mascot + impact note.
class CharityMascotFeedback extends StatelessWidget {
  const CharityMascotFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: KpColors.brand100,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.primaryContainer.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const KpMascot.celebrate(size: 64),
          const Gap.m(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.charityMascotImpact,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// "Make a Contribution" panel (design `_tablet`): money/resources tabs, amount,
/// quick chips, a note and the donate CTA.
class CharityContributionPanel extends StatefulWidget {
  const CharityContributionPanel({this.onDonate, super.key});

  final ValueChanged<Money>? onDonate;

  @override
  State<CharityContributionPanel> createState() =>
      _CharityContributionPanelState();
}

class _CharityContributionPanelState extends State<CharityContributionPanel> {
  final _amount = TextEditingController();
  final _note = TextEditingController();
  var _money = true;

  @override
  void dispose() {
    _amount.dispose();
    _note.dispose();
    super.dispose();
  }

  void _donate() {
    final naira = num.tryParse(_amount.text.replaceAll(',', '').trim()) ?? 0;
    if (naira <= 0) return;
    widget.onDonate?.call(Money.naira(naira));
    _amount.clear();
  }

  @override
  Widget build(BuildContext context) {
    return CharityCard(
      bordered: true,
      padding: const EdgeInsets.all(KpSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.charityMakeContribution,
            style: context.textTheme.headlineSmall,
          ),
          const Gap.l(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.xxs),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerLow,
              borderRadius: KpRadii.allM,
            ),
            child: Row(
              children: [
                _tab(
                  context,
                  label: context.l10n.charityTabMoney,
                  active: _money,
                  onTap: () => setState(() => _money = true),
                ),
                const Gap.xxs(horizontal: true),
                _tab(
                  context,
                  label: context.l10n.charityTabResources,
                  active: !_money,
                  onTap: () => setState(() => _money = false),
                ),
              ],
            ),
          ),
          const Gap.l(),
          Text(
            context.l10n.charityEnterAmountTablet,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xs(),
          CharityOutlinedField(
            controller: _amount,
            hint: '50.00',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            prefix: Text(
              '₦',
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap.m(),
          Wrap(
            spacing: KpSpacing.s,
            runSpacing: KpSpacing.s,
            children: [
              for (final amount in kCharityQuickAdds)
                _QuickChip(
                  label: Money.naira(amount).formatShort(),
                  onTap: () => _amount.text = '$amount',
                ),
            ],
          ),
          const Gap.l(),
          Text(
            context.l10n.charityAddNote,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xs(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: KpSpacing.m),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerLow,
              borderRadius: KpRadii.allM,
              border: Border.all(
                color: context.colorScheme.outlineVariant,
                width: 2,
              ),
            ),
            child: TextField(
              controller: _note,
              maxLines: 3,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: KpSpacing.m,
                ),
                hintText: context.l10n.charityAddNoteHint,
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.outlineVariant,
                ),
              ),
            ),
          ),
          const Gap.l(),
          KpButton(
            label: context.l10n.charityDonateNow,
            icon: Icons.volunteer_activism_rounded,
            onPressed: _donate,
          ),
          const Gap.s(),
          Text(
            context.l10n.charitySecuredPay,
            textAlign: TextAlign.center,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(
    BuildContext context, {
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active
                ? context.colorScheme.surfaceContainerLowest
                : KpColors.transparent,
            borderRadius: KpRadii.allS,
            border: active
                ? Border(
                    bottom: BorderSide(
                      color: context.colorScheme.primary,
                      width: 2,
                    ),
                  )
                : null,
          ),
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: active
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  const _QuickChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: KpSpacing.l,
          vertical: KpSpacing.xs,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
          border: Border.all(
            color: context.colorScheme.outlineVariant,
            width: 2,
          ),
        ),
        child: Text(label, style: context.textTheme.labelLarge),
      ),
    );
  }
}

/// "Recent Heroes" list (design `_tablet`).
class CharityRecentHeroes extends StatelessWidget {
  const CharityRecentHeroes({required this.heroes, this.onSeeAll, super.key});

  final List<CharityHeroEntry> heroes;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return CharityCard(
      bordered: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.charityRecentHeroes,
                style: context.textTheme.headlineSmall,
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: Text(
                  context.l10n.charityViewAll,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const Gap.m(),
          for (final hero in heroes) ...[
            _HeroTile(hero: hero),
            if (hero != heroes.last) const Gap.s(),
          ],
        ],
      ),
    );
  }
}

class _HeroTile extends StatelessWidget {
  const _HeroTile({required this.hero});

  final CharityHeroEntry hero;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: KpSpacing.l,
          backgroundColor: hero.tint.container(context),
          child: Text(
            hero.initial,
            style: context.textTheme.titleMedium?.copyWith(
              color: hero.tint.onContainer(context),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const Gap.s(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hero.name, style: context.textTheme.labelLarge),
              Text(
                hero.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const Gap.s(horizontal: true),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              hero.isResource
                  ? context.l10n.charityResourceLabel
                  : hero.valueLabel,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            Text(
              hero.timeAgo,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
