import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:keenpockets/features/profile/presentation/cubit/profile_state.dart';
import 'package:keenpockets/features/profile/presentation/pages/settings_page.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_my_view.dart';

/// The Profile tab (design `my_profile`): identity, trust score, KYC prompt,
/// stats, achievements and reviews. The gear opens Settings; the other
/// navigation callbacks are surfaced there (and via KYC/achievements actions).
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

  void _openSettings(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => SettingsPage(
          onLogout: onLogout,
          onOpenWallet: onOpenWallet,
          onOpenNotifications: onOpenNotifications,
          onOpenFriends: onOpenFriends,
          onOpenSchool: onOpenSchool,
          onOpenAdmin: onOpenAdmin,
          onOpenLegal: onOpenLegal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) => getIt<ProfileCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.brandWordmark,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                tooltip: context.l10n.settingsTitle,
                onPressed: () => _openSettings(context),
                icon: const Icon(KpIcons.settings),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return KpAsyncView(
              status: state.status,
              loaded: (context) {
                final p = state.profile;
                if (p == null) return const KpLoadingView();
                return ProfileMyView(
                  profile: p,
                  onVerify: onOpenTrust,
                  onAchievements: onOpenAchievements,
                  onReviews: onOpenTrust,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
