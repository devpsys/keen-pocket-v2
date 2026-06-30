import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/administration/presentation/admin_fixtures.dart';
import 'package:keenpockets/features/administration/presentation/view_models/admin_view.dart';

/// White "bento" card: 2px outline border + a flat 7px bottom shadow
/// (design `super_admin_console`).
BoxDecoration adminBentoCard(BuildContext context) {
  return BoxDecoration(
    color: context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
    boxShadow: [
      BoxShadow(
        color: context.colorScheme.outlineVariant,
        offset: const Offset(0, 7),
      ),
    ],
  );
}

/// Avatar background tint per [AdminAvatarTone] (design `super_admin_console`).
Color _toneBg(BuildContext context, AdminAvatarTone tone) {
  return switch (tone) {
    AdminAvatarTone.blue => context.colorScheme.primaryContainer,
    AdminAvatarTone.gold => context.colorScheme.secondaryContainer,
    AdminAvatarTone.teal => context.colorScheme.tertiaryContainer,
  };
}

String _roleLabel(BuildContext context, AdminUserRole role) {
  return switch (role) {
    AdminUserRole.standardUser => context.l10n.adminRoleStandardUser,
    AdminUserRole.educator => context.l10n.adminRoleEducator,
  };
}

/// Phone super-admin console (design `super_admin_console`).
class AdminConsoleView extends StatelessWidget {
  const AdminConsoleView({required this.admin, this.onCreateAdmin, super.key});

  final AdminView admin;
  final VoidCallback? onCreateAdmin;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxl,
      ),
      children: [
        AdminConsoleHeader(onCreateAdmin: onCreateAdmin),
        const Gap.l(),
        AdminUserManagementCard(admin: admin),
        const Gap.l(),
        AdminSchoolsCard(schools: admin.schools),
        const Gap.l(),
        AdminKeensEconomyCard(admin: admin),
        const Gap.l(),
        AdminQuickStats(admin: admin),
      ],
    );
  }
}

/// Title + subtitle + "Create Admin" CTA (design `super_admin_console`).
class AdminConsoleHeader extends StatelessWidget {
  const AdminConsoleHeader({this.onCreateAdmin, super.key});

  final VoidCallback? onCreateAdmin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.adminConsoleTitle,
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Gap.xxs(),
        Text(
          context.l10n.adminConsoleSubtitle,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap.m(),
        AdminCandyButton(
          label: context.l10n.adminCreateAdmin,
          icon: Icons.add_circle_rounded,
          face: KpColors.brand800,
          fg: context.colorScheme.onPrimary,
          depth: KpColors.brand900,
          onPressed: onCreateAdmin ?? () {},
        ),
      ],
    );
  }
}

/// User-management bento: search, user rows and a Mr. K feedback note.
class AdminUserManagementCard extends StatelessWidget {
  const AdminUserManagementCard({required this.admin, super.key});

  final AdminView admin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: adminBentoCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeading(
            icon: Icons.group_rounded,
            iconColor: context.colorScheme.primary,
            label: context.l10n.adminUserManagement,
          ),
          const Gap.m(),
          TextField(
            decoration: InputDecoration(
              hintText: context.l10n.adminSearchHint,
              prefixIcon: const Icon(Icons.search_rounded),
            ),
          ),
          const Gap.m(),
          for (final user in admin.users) ...[
            AdminUserRow(user: user),
            const Gap.s(),
          ],
          const Gap.xs(),
          AdminMascotNote(note: admin.mascotNote),
        ],
      ),
    );
  }
}

/// A single user row: avatar, identity, can-create flag and a grant/revoke CTA.
class AdminUserRow extends StatelessWidget {
  const AdminUserRow({required this.user, super.key});

  final AdminUserView user;

  static const double _avatar = 44;
  static const double _actionWidth = 92;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: _avatar,
            height: _avatar,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: _toneBg(context, user.tone),
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.outlineVariant,
                width: 2,
              ),
            ),
            child: KpNetworkImage(
              url: user.avatarUrl,
              width: _avatar,
              height: _avatar,
              fit: BoxFit.cover,
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  _roleLabel(context, user.role).toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const Gap.xxs(),
                Text(user.email, style: context.textTheme.bodySmall),
                Text(
                  user.phone,
                  style: context.textTheme.bodySmall?.copyWith(
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
              Icon(
                user.canCreateSchool
                    ? Icons.check_circle_rounded
                    : Icons.cancel_rounded,
                color: user.canCreateSchool
                    ? KpColors.gold600
                    : context.colorScheme.error,
              ),
              const Gap.s(),
              SizedBox(
                width: _actionWidth,
                child: user.canCreateSchool
                    ? AdminCandyButton(
                        label: context.l10n.adminRevoke,
                        face: context.colorScheme.tertiaryContainer,
                        fg: context.colorScheme.onTertiaryContainer,
                        depth: context.colorScheme.tertiary,
                        dense: true,
                        onPressed: () {},
                      )
                    : AdminCandyButton(
                        label: context.l10n.adminGrant,
                        face: context.colorScheme.primary,
                        fg: context.colorScheme.onPrimaryContainer,
                        depth: KpColors.brand800,
                        dense: true,
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

/// Mr. K feedback fragment under the user table (design `super_admin_console`).
class AdminMascotNote extends StatelessWidget {
  const AdminMascotNote({required this.note, super.key});

  final String note;

  static const double _avatar = 56;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        children: [
          Container(
            width: _avatar,
            height: _avatar,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.primaryContainer,
                width: 4,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(KpSpacing.xs),
              child: KpNetworkImage(url: kAdminMascotUrl, fit: BoxFit.contain),
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Text(
              note,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Schools bento with status-pilled school items (design `super_admin_console`).
class AdminSchoolsCard extends StatelessWidget {
  const AdminSchoolsCard({required this.schools, super.key});

  final List<AdminSchoolView> schools;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: adminBentoCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _CardHeading(
                  icon: Icons.school_rounded,
                  iconColor: KpColors.gold600,
                  label: context.l10n.adminSchools,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.l10n.adminViewAll,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const Gap.s(),
          for (var i = 0; i < schools.length; i++) ...[
            if (i != 0) const Gap.s(),
            AdminSchoolItem(school: schools[i]),
          ],
        ],
      ),
    );
  }
}

class AdminSchoolItem extends StatelessWidget {
  const AdminSchoolItem({required this.school, super.key});

  final AdminSchoolView school;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  school.name,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              _SchoolStatusPill(isOpen: school.isOpen),
            ],
          ),
          const Gap.xs(),
          Row(
            children: [
              Icon(
                Icons.person_rounded,
                size: 16,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap.xxs(horizontal: true),
              Text(
                school.owner,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SchoolStatusPill extends StatelessWidget {
  const _SchoolStatusPill({required this.isOpen});

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: isOpen
            ? context.colorScheme.secondaryContainer
            : context.colorScheme.outlineVariant,
        borderRadius: KpRadii.allXs,
      ),
      child: Text(
        (isOpen ? context.l10n.adminSchoolOpen : context.l10n.adminSchoolClosed)
            .toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: isOpen
              ? context.colorScheme.onSecondaryContainer
              : context.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// Keens-economy bento: coins toggle, cost inputs and a save CTA.
class AdminKeensEconomyCard extends StatelessWidget {
  const AdminKeensEconomyCard({required this.admin, super.key});

  final AdminView admin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: adminBentoCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CardHeading(
            icon: Icons.monetization_on_rounded,
            iconColor: KpColors.gold500,
            label: context.l10n.adminKeensEconomy,
          ),
          const Gap.m(),
          _CoinsToggle(enabled: admin.coinsEnabled),
          const Gap.m(),
          _KeensCostField(
            icon: Icons.account_balance_wallet_rounded,
            iconColor: context.colorScheme.primary,
            label: context.l10n.adminPocketCost,
            value: admin.pocketCost,
          ),
          const Gap.m(),
          _KeensCostField(
            icon: Icons.pets_rounded,
            iconColor: context.colorScheme.tertiary,
            label: context.l10n.adminAdashisCost,
            value: admin.adashiCost,
          ),
          const Gap.m(),
          _KeensCostField(
            icon: Icons.school_rounded,
            iconColor: KpColors.gold600,
            label: context.l10n.adminSchoolsCost,
            value: admin.schoolCost,
          ),
          const Gap.l(),
          AdminCandyButton(
            label: context.l10n.adminSaveEconomy,
            face: context.colorScheme.primary,
            fg: context.colorScheme.onPrimaryContainer,
            depth: KpColors.brand800,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _CoinsToggle extends StatelessWidget {
  const _CoinsToggle({required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.adminCoinsEnabled,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  context.l10n.adminCoinsToggle,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Switch(value: enabled, onChanged: (_) {}),
        ],
      ),
    );
  }
}

class _KeensCostField extends StatelessWidget {
  const _KeensCostField({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: iconColor),
            const Gap.xs(horizontal: true),
            Text(
              label,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const Gap.xs(),
        TextFormField(
          initialValue: '$value',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.w800,
          ),
          decoration: InputDecoration(
            suffixText: context.l10n.adminKeensUnit,
            suffixStyle: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

/// Two quick-stat tiles ("1.2k Daily Users" / "48 Schools").
class AdminQuickStats extends StatelessWidget {
  const AdminQuickStats({required this.admin, super.key});

  final AdminView admin;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _QuickStat(
              value: admin.dailyUsers,
              label: context.l10n.adminDailyUsers,
              bg: context.colorScheme.primary,
              depth: KpColors.brand900,
              fg: context.colorScheme.onPrimary,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: _QuickStat(
              value: '${admin.schoolsCount}',
              label: context.l10n.adminSchoolsStat,
              bg: KpColors.gold600,
              depth: context.colorScheme.onSecondaryContainer,
              fg: context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickStat extends StatelessWidget {
  const _QuickStat({
    required this.value,
    required this.label,
    required this.bg,
    required this.depth,
    required this.fg,
  });

  final String value;
  final String label;
  final Color bg;
  final Color depth;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: KpRadii.allL,
        border: Border(bottom: BorderSide(color: depth, width: 4)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: context.textTheme.headlineMedium?.copyWith(
              color: fg,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap.xxs(),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: context.textTheme.labelSmall?.copyWith(
              color: fg.withValues(alpha: 0.8),
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Section heading: a coloured icon + title (design `super_admin_console`).
class _CardHeading extends StatelessWidget {
  const _CardHeading({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const Gap.s(horizontal: true),
        Flexible(
          child: Text(
            label,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

/// Candy button with caller-controlled face/fg/depth colours (design
/// `super_admin_console` candy-button).
class AdminCandyButton extends StatelessWidget {
  const AdminCandyButton({
    required this.label,
    required this.face,
    required this.fg,
    required this.depth,
    required this.onPressed,
    this.icon,
    this.dense = false,
    super.key,
  });

  final String label;
  final Color face;
  final Color fg;
  final Color depth;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: face,
        borderRadius: KpRadii.allM,
        border: Border(bottom: BorderSide(color: depth, width: 4)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onPressed,
          borderRadius: KpRadii.allM,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: KpSpacing.m,
              vertical: dense ? KpSpacing.xs : KpSpacing.s + KpSpacing.xxs,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: KpSpacing.l, color: fg),
                  const Gap.xs(horizontal: true),
                ],
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (dense
                                ? context.textTheme.labelMedium
                                : context.textTheme.labelLarge)
                            ?.copyWith(color: fg, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
