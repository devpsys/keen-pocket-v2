import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_create_fields.dart';

/// Members table (design `manage_adashi`): Pos / Member / Status, with the
/// current receiver row highlighted.
class AdashiMembersTable extends StatelessWidget {
  const AdashiMembersTable({
    required this.memberCount,
    required this.members,
    super.key,
  });

  final int memberCount;
  final List<AdashiManageMember> members;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                context.l10n.adashiManageMembersTitle,
                style: context.textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
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
                context.l10n.adashiManageMembersCount(memberCount),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
        const Gap.m(),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLowest,
            borderRadius: KpRadii.allL,
            border: Border.all(
              color: context.colorScheme.surfaceContainerHighest,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              _HeaderRow(),
              for (final m in members) _MemberRow(member: m),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.labelMedium?.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(KpRadii.l),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(context.l10n.adashiManageColPos, style: style),
          ),
          Expanded(
            flex: 6,
            child: Text(context.l10n.adashiManageColMember, style: style),
          ),
          Expanded(
            flex: 4,
            child: Text(context.l10n.adashiManageColStatus, style: style),
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
    final receiver = member.isReceiver;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: receiver
            ? context.colorScheme.secondaryContainer.withValues(alpha: 0.2)
            : null,
        border: Border(
          top: BorderSide(
            color: context.colorScheme.surfaceContainer,
            width: 2,
          ),
          left: receiver
              ? BorderSide(color: context.colorScheme.secondary, width: 4)
              : BorderSide.none,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              member.position.toString().padLeft(2, '0'),
              style: context.textTheme.labelLarge?.copyWith(
                color: receiver
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: receiver
                          ? context.colorScheme.primary
                          : context.colorScheme.outlineVariant,
                      width: 2,
                    ),
                  ),
                  child: KpNetworkAvatar(url: member.avatarUrl, radius: 14),
                ),
                const Gap.xs(horizontal: true),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name,
                        style: context.textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (receiver) ...[
                        const Gap.xxs(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: KpSpacing.xs,
                            vertical: KpSpacing.xxs / 2,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: KpRadii.allXs,
                          ),
                          child: Text(
                            context.l10n.adashiManageReceiver.toUpperCase(),
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onPrimary,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 4, child: _StatusCell(member: member)),
        ],
      ),
    );
  }
}

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.member});

  final AdashiManageMember member;

  @override
  Widget build(BuildContext context) {
    if (member.status == ManageMemberStatus.received) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.s,
            vertical: KpSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.tertiaryContainer.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(KpRadii.pill),
            border: Border.all(color: context.colorScheme.tertiaryContainer),
          ),
          child: Text(
            context.l10n.adashiManageStatusReceived,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onTertiaryContainer,
            ),
          ),
        ),
      );
    }
    return Text(
      context.l10n.adashiManageStatusActive,
      style: context.textTheme.bodySmall?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

/// "Add Member" card with a phone field + invite CTA.
class AdashiAddMemberCard extends StatelessWidget {
  const AdashiAddMemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_add_rounded,
                color: context.colorScheme.primary,
              ),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.adashiManageAddMember,
                style: context.textTheme.headlineSmall,
              ),
            ],
          ),
          const Gap.m(),
          AdashiFieldLabel(context.l10n.adashiManagePhoneLabel),
          TextField(
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9+() -]')),
            ],
            decoration: adashiInput(
              context,
              hint: context.l10n.adashiManagePhoneHint,
            ),
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.adashiManageInvite.toUpperCase(),
            variant: KpButtonVariant.secondary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

/// "Verify Payments" section with approve / reject candy buttons.
class AdashiVerifyPayments extends StatelessWidget {
  const AdashiVerifyPayments({required this.pending, super.key});

  final List<AdashiPendingPayment> pending;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              Icons.pending_actions_rounded,
              color: context.colorScheme.tertiary,
            ),
            const Gap.s(horizontal: true),
            Text(
              context.l10n.adashiManageVerifyPayments,
              style: context.textTheme.headlineSmall,
            ),
          ],
        ),
        const Gap.m(),
        for (final p in pending) ...[_PendingRow(payment: p), const Gap.s()],
      ],
    );
  }
}

class _PendingRow extends StatelessWidget {
  const _PendingRow({required this.payment});

  final AdashiPendingPayment payment;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.m),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(payment.name, style: context.textTheme.labelLarge),
                Text(
                  payment.amount.format(),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          _CandyCircle(
            icon: Icons.check_rounded,
            bg: context.colors.success,
            base: KpColors.success600,
            fg: context.colorScheme.onPrimary,
          ),
          const Gap.s(horizontal: true),
          _CandyCircle(
            icon: Icons.close_rounded,
            bg: context.colorScheme.error,
            base: KpColors.error600,
            fg: context.colorScheme.onError,
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

/// Big "Reconcile & Rotate" CTA + caption.
class AdashiReconcileButton extends StatelessWidget {
  const AdashiReconcileButton({required this.nextPosition, super.key});

  final int nextPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KpButton(
          label: context.l10n.adashiManageReconcile,
          icon: Icons.sync_rounded,
          onPressed: () {},
        ),
        const Gap.s(),
        Text(
          context.l10n.adashiManageReconcileCaption(
            nextPosition.toString().padLeft(2, '0'),
          ),
          textAlign: TextAlign.center,
          style: context.textTheme.labelSmall?.copyWith(
            fontStyle: FontStyle.italic,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// Admin overrides grid + "Mark Dispute".
class AdashiAdminOverrides extends StatelessWidget {
  const AdashiAdminOverrides({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <(IconData, String, Color?)>[
      (
        Icons.priority_high_rounded,
        context.l10n.adashiManageSetReceiver,
        context.colorScheme.primary,
      ),
      (
        Icons.block_rounded,
        context.l10n.adashiManageDeactivate,
        context.colorScheme.error,
      ),
      (Icons.edit_note_rounded, context.l10n.adashiManageAdjContrib, null),
      (
        Icons.format_list_numbered_rounded,
        context.l10n.adashiManageSetPosition,
        null,
      ),
      (Icons.pause_circle_rounded, context.l10n.adashiManagePauseCircle, null),
      (Icons.payments_rounded, context.l10n.adashiManageMarkPayout, null),
    ];
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.adashiManageOverrides,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall,
          ),
          const Gap.m(),
          for (var i = 0; i < items.length; i += 2) ...[
            if (i > 0) const Gap.s(),
            Row(
              children: [
                Expanded(child: _OverrideButton(item: items[i])),
                const Gap.s(horizontal: true),
                Expanded(
                  child: i + 1 < items.length
                      ? _OverrideButton(item: items[i + 1])
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ],
          const Gap.m(),
          KpButton(
            label: context.l10n.adashiManageMarkDispute.toUpperCase(),
            icon: Icons.warning_rounded,
            variant: KpButtonVariant.error,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _OverrideButton extends StatelessWidget {
  const _OverrideButton({required this.item});

  final (IconData, String, Color?) item;

  @override
  Widget build(BuildContext context) {
    final tint = item.$3 ?? context.colorScheme.onSurfaceVariant;
    return Material(
      color: context.colorScheme.surfaceContainerLowest,
      borderRadius: KpRadii.allM,
      child: InkWell(
        onTap: () {},
        borderRadius: KpRadii.allM,
        child: Container(
          padding: const EdgeInsets.all(KpSpacing.s),
          decoration: BoxDecoration(
            borderRadius: KpRadii.allM,
            border: Border.all(
              color: context.colorScheme.outlineVariant,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(item.$1, color: tint),
              const Gap.xs(),
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

/// Settings toggles + secondary actions (bank, rules, clone, export).
class AdashiManageToggles extends StatelessWidget {
  const AdashiManageToggles({
    required this.publicVisibility,
    required this.onPublicVisibility,
    required this.showPayoutNames,
    required this.onShowPayoutNames,
    super.key,
  });

  final bool publicVisibility;
  final ValueChanged<bool> onPublicVisibility;
  final bool showPayoutNames;
  final ValueChanged<bool> onShowPayoutNames;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ToggleRow(
          label: context.l10n.adashiManagePublicVisibility,
          value: publicVisibility,
          onChanged: onPublicVisibility,
        ),
        const Gap.s(),
        _ToggleRow(
          label: context.l10n.adashiManageShowPayoutNames,
          value: showPayoutNames,
          onChanged: onShowPayoutNames,
        ),
        const Gap.s(),
        _ActionTile(
          icon: Icons.account_balance_rounded,
          label: context.l10n.adashiManageBankDetails,
        ),
        const Gap.s(),
        _ActionTile(
          icon: Icons.gavel_rounded,
          label: context.l10n.adashiManageCircleRules,
        ),
        const Gap.s(),
        Row(
          children: [
            Expanded(
              child: _ActionTile(
                icon: Icons.content_copy_rounded,
                label: context.l10n.adashiManageClone,
                center: true,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: _ActionTile(
                icon: Icons.description_rounded,
                label: context.l10n.adashiManageExport,
                center: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allL,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: context.textTheme.labelLarge)),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    this.center = false,
  });

  final IconData icon;
  final String label;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainerHigh,
      borderRadius: KpRadii.allM,
      child: InkWell(
        onTap: () {},
        borderRadius: KpRadii.allM,
        child: Padding(
          padding: const EdgeInsets.all(KpSpacing.m),
          child: Row(
            mainAxisAlignment: center
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Icon(icon, color: context.colorScheme.primary),
              const Gap.s(horizontal: true),
              Text(label, style: context.textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}

/// Mr K feedback footer.
class AdashiManageMascot extends StatelessWidget {
  const AdashiManageMascot({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Column(
        children: [
          const KpMascot.think(size: 96),
          const Gap.m(),
          Text(
            context.l10n.adashiManageMascotTip,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
