import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_create_fields.dart';

String _initials(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));
  if (parts.length >= 2) return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
  return name.isEmpty ? '?' : name.substring(0, 1).toUpperCase();
}

/// Tablet members roster (design `manage_adashi_tablet`).
class ManageTabletMembers extends StatelessWidget {
  const ManageTabletMembers({required this.manage, super.key});

  final AdashiManageView manage;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      Icons.groups_rounded,
                      color: context.colorScheme.primary,
                    ),
                    const Gap.s(horizontal: true),
                    Flexible(
                      child: Text(
                        context.l10n.adashiManageMembersTitle,
                        style: context.textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.s,
                  vertical: KpSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(KpRadii.pill),
                ),
                child: Text(
                  context.l10n.adashiManageMembersFraction(
                    manage.activeMembers,
                    manage.memberCount,
                  ),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const Gap.l(),
          _HeaderRow(),
          for (final m in manage.members) _MemberRow(member: m),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.labelSmall?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
      letterSpacing: 0.5,
    );
    return Container(
      padding: const EdgeInsets.only(bottom: KpSpacing.s),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              context.l10n.adashiManageColPos.toUpperCase(),
              style: style,
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              context.l10n.adashiManageColMember.toUpperCase(),
              style: style,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              context.l10n.adashiManageColStatus.toUpperCase(),
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}

class _MemberRow extends StatelessWidget {
  const _MemberRow({required this.member});

  final AdashiManageMember member;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.m),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              member.position.toString().padLeft(2, '0'),
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                // Design uses a plain placeholder tile (no portrait).
                Container(
                  width: KpSpacing.l,
                  height: KpSpacing.l,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerHigh,
                    borderRadius: KpRadii.allS,
                  ),
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: Text(
                    member.name,
                    style: context.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _StatusPill(status: member.status),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final ManageMemberStatus status;

  @override
  Widget build(BuildContext context) {
    final received = status == ManageMemberStatus.received;
    final base = received
        ? context.colorScheme.secondaryContainer
        : context.colorScheme.primaryContainer;
    final fg = received
        ? context.colorScheme.onSecondaryContainer
        : context.colorScheme.onPrimaryContainer;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: base.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(KpRadii.pill),
        border: Border.all(color: base),
      ),
      child: Text(
        received
            ? context.l10n.adashiManageStatusReceived
            : context.l10n.adashiManageStatusActive,
        style: context.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}

/// Tablet add-member form (email + rotation slot + send invite).
class ManageTabletAddMember extends StatelessWidget {
  const ManageTabletAddMember({required this.nextSlot, super.key});

  final int nextSlot;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.adashiManageAddMember,
            style: context.textTheme.headlineSmall,
          ),
          const Gap.m(),
          AdashiFieldLabel(context.l10n.adashiManageEmailLabel),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: adashiInput(
              context,
              hint: context.l10n.adashiManageEmailHint,
            ),
          ),
          const Gap.m(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AdashiFieldLabel(context.l10n.adashiManageRotationSlot),
                    DropdownButtonFormField<int>(
                      initialValue: nextSlot,
                      isExpanded: true,
                      decoration: adashiInput(context),
                      items: [
                        DropdownMenuItem<int>(
                          value: nextSlot,
                          child: Text(
                            context.l10n.adashiManageNextAvailable(
                              nextSlot.toString().padLeft(2, '0'),
                            ),
                          ),
                        ),
                      ],
                      onChanged: (_) {},
                    ),
                  ],
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: KpButton(
                  label: context.l10n.adashiManageSendInvite,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Tablet verify-payments card with the reconcile action.
class ManageTabletVerify extends StatelessWidget {
  const ManageTabletVerify({required this.pending, super.key});

  static const double _reconcileWidth = 200;

  final List<AdashiPendingPayment> pending;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      Icons.verified_user_rounded,
                      color: context.colorScheme.secondary,
                    ),
                    const Gap.s(horizontal: true),
                    Flexible(
                      child: Text(
                        context.l10n.adashiManageVerifyPayments,
                        style: context.textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              SizedBox(
                width: _reconcileWidth,
                child: KpButton(
                  label: context.l10n.adashiManageReconcile,
                  variant: KpButtonVariant.secondary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const Gap.m(),
          for (final p in pending) ...[_PaymentRow(payment: p), const Gap.s()],
        ],
      ),
    );
  }
}

class _PaymentRow extends StatelessWidget {
  const _PaymentRow({required this.payment});

  final AdashiPendingPayment payment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        borderRadius: KpRadii.allL,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surfaceContainerHighest,
            ),
            child: Text(
              _initials(payment.name),
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(payment.name, style: context.textTheme.bodyLarge),
                Text(
                  context.l10n.adashiManagePaymentSubtitle(
                    payment.amount.format(),
                  ),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          _CandyCircle(
            icon: Icons.close_rounded,
            bg: context.colorScheme.errorContainer,
            base: KpColors.error600,
            fg: context.colorScheme.error,
          ),
          const Gap.s(horizontal: true),
          _CandyCircle(
            icon: Icons.check_rounded,
            bg: context.colorScheme.primaryContainer,
            base: KpColors.brand600,
            fg: context.colorScheme.onPrimaryContainer,
          ),
        ],
      ),
    );
  }
}

class _CandyCircle extends StatelessWidget {
  const _CandyCircle({
    required this.icon,
    required this.bg,
    required this.base,
    required this.fg,
  });

  final IconData icon;
  final Color bg;
  final Color base;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: KpSpacing.xl,
      height: KpSpacing.xl,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bg,
        boxShadow: [BoxShadow(color: base, offset: const Offset(0, 3))],
      ),
      child: Icon(icon, size: KpSpacing.m, color: fg),
    );
  }
}

/// Tablet admin-overrides grid (3 columns).
class ManageTabletOverrides extends StatelessWidget {
  const ManageTabletOverrides({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <(IconData, String, Color)>[
      (
        Icons.swap_horiz_rounded,
        context.l10n.adashiManageSetReceiver,
        context.colorScheme.primary,
      ),
      (
        Icons.person_off_rounded,
        context.l10n.adashiManageDeactivate,
        context.colorScheme.error,
      ),
      (
        Icons.update_rounded,
        context.l10n.adashiManageReschedule,
        context.colorScheme.secondary,
      ),
      (
        Icons.edit_calendar_rounded,
        context.l10n.adashiManageCycleLength,
        context.colorScheme.primary,
      ),
      (
        Icons.history_rounded,
        context.l10n.adashiManageAuditLog,
        context.colorScheme.primary,
      ),
      (
        Icons.delete_forever_rounded,
        context.l10n.adashiManageDissolve,
        context.colorScheme.error,
      ),
    ];
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.adashiManageOverrides,
            style: context.textTheme.headlineSmall,
          ),
          const Gap.m(),
          for (var i = 0; i < items.length; i += 3) ...[
            if (i > 0) const Gap.m(),
            Row(
              children: [
                for (var c = 0; c < 3; c++) ...[
                  if (c > 0) const Gap.m(horizontal: true),
                  Expanded(
                    child: i + c < items.length
                        ? _OverrideButton(item: items[i + c])
                        : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _OverrideButton extends StatelessWidget {
  const _OverrideButton({required this.item});

  final (IconData, String, Color) item;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainerLowest,
      borderRadius: KpRadii.allL,
      child: InkWell(
        onTap: () {},
        borderRadius: KpRadii.allL,
        child: Container(
          padding: const EdgeInsets.all(KpSpacing.m),
          decoration: BoxDecoration(
            borderRadius: KpRadii.allL,
            border: Border.all(
              color: context.colorScheme.surfaceContainerHighest,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(item.$1, color: item.$3),
              const Gap.s(),
              Text(
                item.$2,
                textAlign: TextAlign.center,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Fixed bottom rail: export/clone actions + current-rotation progress.
class ManageTabletFooter extends StatelessWidget {
  const ManageTabletFooter({
    required this.currentSlot,
    required this.totalSlots,
    super.key,
  });

  static const double _barWidth = 128;

  final int currentSlot;
  final int totalSlots;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xl,
        vertical: KpSpacing.m,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: _FooterAction(
                    icon: Icons.download_rounded,
                    label: context.l10n.adashiManageExportLedger,
                  ),
                ),
                const Gap.l(horizontal: true),
                Flexible(
                  child: _FooterAction(
                    icon: Icons.content_copy_rounded,
                    label: context.l10n.adashiManageCloneSettings,
                  ),
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    context.l10n.adashiManageCurrentRotation,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    context.l10n.adashiManageSlot(currentSlot, totalSlots),
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const Gap.m(horizontal: true),
              SizedBox(
                width: _barWidth,
                child: KpProgressBar(
                  value: totalSlots == 0 ? 0 : currentSlot / totalSlots,
                  height: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterAction extends StatelessWidget {
  const _FooterAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: KpSpacing.l,
            color: context.colorScheme.onSurfaceVariant,
          ),
          const Gap.xs(horizontal: true),
          Flexible(
            child: Text(
              label,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
