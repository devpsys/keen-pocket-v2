import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';

/// Friends & invites: the invite block + incoming requests + friends + pending.
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
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.friendsTitle)),
      body: BlocBuilder<FriendsCubit, FriendsState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            loaded: (context) => ListView(
              padding: const EdgeInsets.all(KpSpacing.m),
              children: [
                _InviteBlock(code: state.inviteCode),
                const Gap.l(),
                if (state.incoming.isNotEmpty) ...[
                  _SectionHeader(context.l10n.friendsRequests),
                  for (final f in state.incoming)
                    ListTile(
                      title: Text(f.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () =>
                                context.read<FriendsCubit>().accept(f.id),
                            child: Text(context.l10n.friendAccept),
                          ),
                          TextButton(
                            onPressed: () =>
                                context.read<FriendsCubit>().remove(f.id),
                            child: Text(context.l10n.friendDecline),
                          ),
                        ],
                      ),
                    ),
                  const Gap.m(),
                ],
                _SectionHeader(context.l10n.friendsList),
                if (state.friends.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(KpSpacing.m),
                    child: Text(context.l10n.friendsEmptyMessage),
                  )
                else
                  for (final f in state.friends)
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(f.name),
                    ),
                if (state.outgoing.isNotEmpty) ...[
                  const Gap.m(),
                  _SectionHeader(context.l10n.friendsPending),
                  for (final f in state.outgoing)
                    ListTile(
                      leading: const Icon(Icons.hourglass_empty),
                      title: Text(f.name),
                    ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _InviteBlock extends StatelessWidget {
  const _InviteBlock({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.friendsInviteTitle,
            style: context.textTheme.titleMedium,
          ),
          const Gap.xs(),
          Text(context.l10n.friendsInviteCode(code)),
          const Gap.s(),
          KpButton(
            label: context.l10n.friendsShare,
            icon: Icons.share,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.xs),
      child: Text(label, style: context.textTheme.titleLarge),
    );
  }
}
