import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/allocate_fixtures.dart';

/// Summary header: mascot + verified badge, "Allocated X of Y", full progress.
class AllocateHeader extends StatelessWidget {
  const AllocateHeader({
    required this.allocated,
    required this.total,
    super.key,
  });

  final Money allocated;
  final Money total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 96,
              height: 96,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.primaryContainer,
              ),
              child: const KpMascot.celebrate(size: 72),
            ),
            Positioned(
              right: -KpSpacing.xs,
              top: -KpSpacing.xs,
              child: Container(
                padding: const EdgeInsets.all(KpSpacing.xxs),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.success,
                  border: Border.all(
                    color: context.colorScheme.surface,
                    width: 3,
                  ),
                ),
                child: Icon(
                  Icons.check_rounded,
                  size: KpSpacing.m,
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
        const Gap.m(),
        Text(
          context.l10n.allocateAllocatedOf(allocated.format(), total.format()),
          textAlign: TextAlign.center,
          style: context.textTheme.headlineMedium,
        ),
        const Gap.m(),
        KpProgressBar(
          value: total.kobo == 0 ? 0 : allocated.kobo / total.kobo,
          height: 16,
        ),
      ],
    );
  }
}

/// Info note that the contribution will be pending verification.
class AllocateNote extends StatelessWidget {
  const AllocateNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.12),
        borderRadius: KpRadii.allL,
        border: Border.all(
          color: context.colorScheme.primaryContainer.withValues(alpha: 0.4),
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, color: context.colorScheme.primary),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.allocatePendingNote,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tablet header: mascot + "Great Progress!" + allocated summary + gold bar.
class AllocateTabletHeader extends StatelessWidget {
  const AllocateTabletHeader({
    required this.allocated,
    required this.total,
    super.key,
  });

  static const double _barWidth = 256;

  final Money allocated;
  final Money total;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 96,
          height: 96,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.primaryContainer,
            border: const Border(
              bottom: BorderSide(color: KpColors.brand600, width: 4),
            ),
          ),
          child: const KpMascot.celebrate(size: 72),
        ),
        const Gap.l(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.allocateGreatProgress,
                style: context.textTheme.headlineLarge,
              ),
              const Gap.xxs(),
              Text.rich(
                TextSpan(
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  children: [
                    TextSpan(
                      text: context.l10n.allocateAllocatedSub(
                        allocated.format(),
                        total.format(),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap.s(),
              SizedBox(
                width: _barWidth,
                child: KpProgressBar(
                  value: total.kobo == 0 ? 0 : allocated.kobo / total.kobo,
                  color: context.colorScheme.secondary,
                  height: 16,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.history_rounded,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            KpIcons.notificationsOutlined,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// "Confirmation Required" gold banner (tablet, design `allocate_months_tablet`).
class AllocateConfirmationBanner extends StatelessWidget {
  const AllocateConfirmationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: const BoxDecoration(
        color: KpColors.gold100,
        borderRadius: KpRadii.allXl,
        border: Border(bottom: BorderSide(color: KpColors.gold600, width: 7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded, color: KpColors.gold600),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.allocateConfirmationTitle,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                Text(
                  context.l10n.allocateConfirmationBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurface,
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

/// Floating "Submit contribution" pill (tablet bottom-right).
class AllocateSubmitPill extends StatelessWidget {
  const AllocateSubmitPill({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: KpSpacing.xl,
          vertical: KpSpacing.m,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(KpRadii.pill),
          border: const Border(
            bottom: BorderSide(color: KpColors.brand600, width: 4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.send_rounded,
              color: context.colorScheme.onPrimaryContainer,
            ),
            const Gap.s(horizontal: true),
            Text(
              context.l10n.allocateSubmit,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "Months Pending" heading with a count pill.
class AllocateMonthsHeading extends StatelessWidget {
  const AllocateMonthsHeading({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.l10n.allocateMonthsPending,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap.m(horizontal: true),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.s,
            vertical: KpSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(KpRadii.pill),
          ),
          child: Text(
            context.l10n.allocateMonthsCount(count),
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

/// Phone month card: name + target/paid + tinted calendar + amount field.
class AllocateMonthCard extends StatelessWidget {
  const AllocateMonthCard({
    required this.month,
    required this.tint,
    required this.controller,
    super.key,
  });

  final AllocateMonth month;
  final Color tint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(month.name, style: context.textTheme.headlineSmall),
                    Text(
                      context.l10n.allocateMonthSubtitle(
                        month.target.format(),
                        month.paid,
                      ),
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: KpSpacing.xxl,
                height: KpSpacing.xxl,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.12),
                  borderRadius: KpRadii.allL,
                ),
                child: Icon(Icons.calendar_month_rounded, color: tint),
              ),
            ],
          ),
          const Gap.m(),
          _AmountField(controller: controller),
        ],
      ),
    );
  }
}

/// Tablet month card: status chip + target + amount field.
class AllocateMonthCardTablet extends StatelessWidget {
  const AllocateMonthCardTablet({
    required this.month,
    required this.controller,
    super.key,
  });

  final AllocateMonth month;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(month.name, style: context.textTheme.headlineSmall),
              _StatusChip(status: month.status),
            ],
          ),
          const Gap.s(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.allocateTargetLabel,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(month.target.format(), style: context.textTheme.labelLarge),
            ],
          ),
          const Gap.s(),
          _AmountField(controller: controller),
        ],
      ),
    );
  }
}

/// Ready / Pending / Edit status chip on a tablet month card.
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final AllocateMonthStatus status;

  @override
  Widget build(BuildContext context) {
    final (IconData icon, String label, Color color) = switch (status) {
      AllocateMonthStatus.ready => (
        Icons.check_circle_rounded,
        context.l10n.allocateMonthReady,
        context.colorScheme.primary,
      ),
      AllocateMonthStatus.pending => (
        Icons.pending_outlined,
        context.l10n.allocateMonthPendingStatus,
        context.colorScheme.onSurfaceVariant,
      ),
      AllocateMonthStatus.edit => (
        Icons.edit_rounded,
        context.l10n.allocateMonthEdit,
        context.colorScheme.onSurfaceVariant,
      ),
    };
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: KpSpacing.m, color: color),
        const Gap.xxs(horizontal: true),
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}

/// Shared ₦-prefixed allocation amount input.
class _AmountField extends StatelessWidget {
  const _AmountField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Text(
            '₦',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: '0.00',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
