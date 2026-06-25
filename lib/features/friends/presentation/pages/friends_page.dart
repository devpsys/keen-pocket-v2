import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';
import 'package:keenpockets/features/friends/presentation/referral_fixtures.dart';
import 'package:keenpockets/features/friends/presentation/widgets/refer_earn_tablet_widgets.dart';
import 'package:keenpockets/features/friends/presentation/widgets/refer_earn_widgets.dart';

/// Refer & Earn (designs `refer_earn` / `_tablet`): invite link/code, WhatsApp
/// share, referral stats and "Your Circle". Presentation-only.
class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FriendsCubit>(
      create: (_) => getIt<FriendsCubit>()..load(),
      child: const _FriendsView(),
    );
  }
}

class _FriendsView extends StatelessWidget {
  const _FriendsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsCubit, FriendsState>(
      builder: (context, state) {
        if (context.isExpanded) {
          return AppTabletShell(
            body: Scaffold(
              appBar: _appBar(context, title: context.l10n.referEarnTitle),
              body: KpAsyncView(
                status: state.status,
                loaded: (context) => ReferEarnTabletView(
                  state: state,
                  onCopy: () {},
                  onShare: () {},
                  onInviteMore: () {},
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: _appBar(
            context,
            title: context.l10n.brandWordmark,
            showBack: true,
          ),
          body: KpAsyncView(
            status: state.status,
            loaded: (context) => ReferEarnPhoneView(
              state: state,
              onCopy: () {},
              onShare: () {},
              onInviteMore: () {},
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _appBar(
    BuildContext context, {
    required String title,
    bool showBack = false,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      leading: showBack
          ? IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: context.colorScheme.primary,
              ),
            )
          : null,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            KpIcons.notificationsOutlined,
            color: context.colorScheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: KpSpacing.m),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(KpSpacing.xxs),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.colorScheme.primaryContainer,
                  width: 2,
                ),
              ),
              child: const KpNetworkAvatar(
                url: kReferralUserAvatar,
                radius: KpSpacing.s,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
