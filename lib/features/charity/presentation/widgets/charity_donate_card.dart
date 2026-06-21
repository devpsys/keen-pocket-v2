import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_fixtures.dart';

/// White candy card used across the charity drive (design `charity_donate_card`).
/// [bordered] swaps the phone's flat 7px bottom border for the tablet's full
/// 2px outline + 7px drop shadow (design `_tablet`).
class CharityCard extends StatelessWidget {
  const CharityCard({
    required this.child,
    this.padding,
    this.bordered = false,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: bordered
            ? Border.all(
                color: context.colorScheme.surfaceContainerHighest,
                width: 2,
              )
            : Border(
                bottom: BorderSide(
                  color: context.colorScheme.surfaceContainerHighest,
                  width: 7,
                ),
              ),
        boxShadow: bordered
            ? [
                BoxShadow(
                  color: context.colorScheme.surfaceContainerHighest,
                  offset: const Offset(0, 7),
                ),
              ]
            : [
                // Soft elevation (design `shadow-xl`) atop the candy bottom edge.
                BoxShadow(
                  color: context.colorScheme.shadow.withValues(alpha: 0.08),
                  blurRadius: 24,
                  spreadRadius: -4,
                  offset: const Offset(0, 12),
                ),
              ],
      ),
      child: child,
    );
  }
}

/// Bordered input (design uses 2px outline fields that focus to brand).
class CharityOutlinedField extends StatelessWidget {
  const CharityOutlinedField({
    required this.controller,
    this.hint,
    this.prefix,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    super.key,
  });

  final TextEditingController controller;
  final String? hint;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allM,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Row(
        children: [
          if (prefix != null) ...[prefix!, const Gap.s(horizontal: true)],
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              textAlign: textAlign,
              style: context.textTheme.titleMedium,
              decoration: InputDecoration(
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: KpSpacing.m,
                ),
                hintText: hint,
                hintStyle: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.outlineVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Hero: heart badge, drive title and subtitle (design `charity_donate_card`).
class CharityHero extends StatelessWidget {
  const CharityHero({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(KpSpacing.m),
          decoration: const BoxDecoration(
            color: KpColors.tertiary100,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: KpColors.tertiary100, offset: Offset(0, 4)),
            ],
          ),
          child: const Icon(
            Icons.favorite_rounded,
            color: KpColors.tertiary500,
            size: KpSpacing.xl,
          ),
        ),
        const Gap.m(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineMedium,
        ),
        const Gap.xs(),
        Text(
          context.l10n.charityHeroSubtitle,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// Financial goal card: progress + donation amount entry (design card 1).
class CharityFinancialCard extends StatefulWidget {
  const CharityFinancialCard({required this.drive, this.onDonate, super.key});

  final CharityView drive;
  final ValueChanged<Money>? onDonate;

  @override
  State<CharityFinancialCard> createState() => _CharityFinancialCardState();
}

class _CharityFinancialCardState extends State<CharityFinancialCard> {
  final _amount = TextEditingController();

  @override
  void dispose() {
    _amount.dispose();
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
    final d = widget.drive;
    final percent = (d.progress * 100).round();
    return CharityCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.payments_rounded, color: context.colorScheme.primary),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(
                  context.l10n.charityFinancialGoal,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
              _ReachedPill(percent: percent),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                context.l10n.charityRaised(d.raised.format()),
                style: context.textTheme.titleMedium,
              ),
              Text(
                context.l10n.charityGoal(d.goal.format()),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.outline,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(value: d.progress, height: 20),
          const Gap.l(),
          Text(
            context.l10n.charityEnterAmount,
            style: context.textTheme.labelLarge,
          ),
          const Gap.xs(),
          CharityOutlinedField(
            controller: _amount,
            hint: '5,000',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            prefix: Text(
              '₦',
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.outline,
              ),
            ),
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.charityDonateNow,
            icon: Icons.volunteer_activism_rounded,
            onPressed: _donate,
          ),
          const Gap.m(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerLow,
              borderRadius: KpRadii.allM,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  size: KpSpacing.m,
                  color: context.colorScheme.primary,
                ),
                const Gap.xs(horizontal: true),
                Flexible(
                  child: Text(
                    context.l10n.charitySecure.toUpperCase(),
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
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
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: const BoxDecoration(
        color: KpColors.brand100,
        borderRadius: BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        context.l10n.charityReached(percent),
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}

/// Resource goal card: item progress bars + a pledge entry (design card 2).
class CharityResourceCard extends StatefulWidget {
  const CharityResourceCard({required this.items, this.onPledge, super.key});

  final List<CharityResourceItem> items;
  final VoidCallback? onPledge;

  @override
  State<CharityResourceCard> createState() => _CharityResourceCardState();
}

class _CharityResourceCardState extends State<CharityResourceCard> {
  final _qty = TextEditingController();
  String? _selected;

  @override
  void dispose() {
    _qty.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CharityCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.inventory_2_rounded,
                color: context.colorScheme.tertiary,
              ),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(
                  context.l10n.charityResourceGoal,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.tertiary,
                  ),
                ),
              ),
            ],
          ),
          const Gap.l(),
          for (final item in widget.items) ...[
            _ResourceBar(item: item),
            const Gap.l(),
          ],
          const Divider(height: 1),
          const Gap.m(),
          Text(
            context.l10n.charityDonateItems,
            style: context.textTheme.labelLarge,
          ),
          const Gap.xs(),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: KpSpacing.m),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerLowest,
                    borderRadius: KpRadii.allM,
                    border: Border.all(
                      color: context.colorScheme.outlineVariant,
                      width: 2,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selected,
                      hint: Text(
                        context.l10n.charitySelectItem,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      items: [
                        for (final item in widget.items)
                          DropdownMenuItem(
                            value: item.name,
                            child: Text(item.name),
                          ),
                      ],
                      onChanged: (v) => setState(() => _selected = v),
                    ),
                  ),
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: CharityOutlinedField(
                  controller: _qty,
                  hint: context.l10n.charityQty,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.charityPledgeItems,
            variant: KpButtonVariant.secondary,
            icon: Icons.redeem_rounded,
            onPressed: widget.onPledge ?? () {},
          ),
        ],
      ),
    );
  }
}

class _ResourceBar extends StatelessWidget {
  const _ResourceBar({required this.item});

  final CharityResourceItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(item.icon, color: context.colorScheme.primary),
                const Gap.xs(horizontal: true),
                Text(item.name, style: context.textTheme.titleMedium),
              ],
            ),
            Text(
              context.l10n.charityItemsProgress(item.current, item.target),
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const Gap.s(),
        KpProgressBar(
          value: item.progress,
          color: item.tint.fill(context),
          height: 16,
        ),
      ],
    );
  }
}

/// Recent (anonymised) contributions (design card 6).
class CharityContributionsCard extends StatelessWidget {
  const CharityContributionsCard({
    required this.contributions,
    this.onViewAll,
    super.key,
  });

  final List<CharityContribution> contributions;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        // Grey panel so the white donor tiles read clearly (design uses a
        // tinted `surface-container` panel under `surface-lowest` tiles).
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  context.l10n.charityRecentContributions,
                  style: context.textTheme.titleLarge,
                ),
              ),
              GestureDetector(
                onTap: onViewAll,
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
          for (final c in contributions) ...[
            CharityDonorTile(contribution: c),
            if (c != contributions.last) const Gap.s(),
          ],
        ],
      ),
    );
  }
}

/// One anonymised donor row.
class CharityDonorTile extends StatelessWidget {
  const CharityDonorTile({required this.contribution, super.key});

  final CharityContribution contribution;

  @override
  Widget build(BuildContext context) {
    final c = contribution;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: KpRadii.allL,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: KpSpacing.l,
            backgroundColor: c.tint.container(context),
            child: Text(
              c.initial,
              style: context.textTheme.titleMedium?.copyWith(
                color: c.tint.onContainer(context),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c.maskedName, style: context.textTheme.labelLarge),
                Text(
                  c.valueLabel,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: c.tint.onContainer(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Mr K encouragement card (design `charity_donate_card`).
class CharityMascotTip extends StatelessWidget {
  const CharityMascotTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: const BoxDecoration(
        color: KpColors.brand100,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KpMascot.celebrate(size: 72),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.charityMascotTitle,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.charityMascotBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
