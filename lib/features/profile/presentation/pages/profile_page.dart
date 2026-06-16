import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_state.dart';
import 'package:keenpockets/features/profile/presentation/view_models/profile_view.dart';

/// Profile hub: identity header + links to wallet, notifications, achievements
/// and logout. Navigation is provided by the caller (router/shell).
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    this.onOpenWallet,
    this.onOpenNotifications,
    this.onOpenAchievements,
    this.onOpenTrust,
    this.onOpenFriends,
    this.onOpenSchool,
    this.onOpenAdmin,
    this.onOpenLegal,
    this.onLogout,
    super.key,
  });

  final VoidCallback? onOpenWallet;
  final VoidCallback? onOpenNotifications;
  final VoidCallback? onOpenAchievements;
  final VoidCallback? onOpenTrust;
  final VoidCallback? onOpenFriends;
  final VoidCallback? onOpenSchool;
  final VoidCallback? onOpenAdmin;
  final VoidCallback? onOpenLegal;
  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) => getIt<ProfileCubit>()..load(),
      child: _ProfileView(
        onOpenWallet: onOpenWallet,
        onOpenNotifications: onOpenNotifications,
        onOpenAchievements: onOpenAchievements,
        onOpenTrust: onOpenTrust,
        onOpenFriends: onOpenFriends,
        onOpenSchool: onOpenSchool,
        onOpenAdmin: onOpenAdmin,
        onOpenLegal: onOpenLegal,
        onLogout: onLogout,
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({
    this.onOpenWallet,
    this.onOpenNotifications,
    this.onOpenAchievements,
    this.onOpenTrust,
    this.onOpenFriends,
    this.onOpenSchool,
    this.onOpenAdmin,
    this.onOpenLegal,
    this.onLogout,
  });

  final VoidCallback? onOpenWallet;
  final VoidCallback? onOpenNotifications;
  final VoidCallback? onOpenAchievements;
  final VoidCallback? onOpenTrust;
  final VoidCallback? onOpenFriends;
  final VoidCallback? onOpenSchool;
  final VoidCallback? onOpenAdmin;
  final VoidCallback? onOpenLegal;
  final VoidCallback? onLogout;

  // Single interpolation (reputation · keens) so it stays localized.
  String _metaLine(BuildContext context, ProfileView p) =>
      '${context.l10n.profileReputation}: ${p.reputation}  ·  ${context.l10n.profileKeens(p.keens)}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.profileTitle)),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            loaded: (context) {
              final p = state.profile;
              if (p == null) return const SizedBox.shrink();
              return ListView(
                children: [
                  const Gap.l(),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: KpSpacing.xl,
                          child: Text(
                            p.name.isNotEmpty ? p.name[0].toUpperCase() : '?',
                            style: context.textTheme.headlineMedium,
                          ),
                        ),
                        const Gap.s(),
                        Text(p.name, style: context.textTheme.titleLarge),
                        const Gap.xxs(),
                        Text(
                          _metaLine(context, p),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        if (p.kycVerified) ...[
                          const Gap.xxs(),
                          Text(
                            context.l10n.profileKycVerified,
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colors.success,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const Gap.l(),
                  _SettingTile(
                    icon: Icons.verified_user_outlined,
                    label: context.l10n.profileTrust,
                    onTap: onOpenTrust,
                  ),
                  _SettingTile(
                    icon: Icons.account_balance_wallet_outlined,
                    label: context.l10n.profileWallet,
                    onTap: onOpenWallet,
                  ),
                  _SettingTile(
                    icon: Icons.notifications_outlined,
                    label: context.l10n.profileNotifications,
                    onTap: onOpenNotifications,
                  ),
                  _SettingTile(
                    icon: Icons.emoji_events_outlined,
                    label: context.l10n.profileAchievements,
                    onTap: onOpenAchievements,
                  ),
                  _SettingTile(
                    icon: Icons.group_outlined,
                    label: context.l10n.profileFriends,
                    onTap: onOpenFriends,
                  ),
                  _SettingTile(
                    icon: Icons.school_outlined,
                    label: context.l10n.profileSchool,
                    onTap: onOpenSchool,
                  ),
                  _SettingTile(
                    icon: Icons.admin_panel_settings_outlined,
                    label: context.l10n.profileAdmin,
                    onTap: onOpenAdmin,
                  ),
                  _SettingTile(
                    icon: Icons.gavel_outlined,
                    label: context.l10n.profileLegal,
                    onTap: onOpenLegal,
                  ),
                  const Divider(),
                  _SettingTile(
                    icon: Icons.logout,
                    label: context.l10n.logout,
                    onTap: onLogout,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
