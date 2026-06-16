import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/group_chat_cubit.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/group_chat_state.dart';
import 'package:keenpockets/features/group_collaboration/presentation/widgets/group_chat_panel.dart';

/// Group chat for a pocket/adashi. Backend-gap → flag-gated (built dark).
class GroupChatPage extends StatelessWidget {
  const GroupChatPage({required this.groupId, super.key});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.chat);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.groupChatTitle)),
      body: FeatureGuard(
        enabled: enabled,
        comingSoon: KpComingSoonCard(
          title: context.l10n.comingSoonTitle,
          message: context.l10n.comingSoonMessage,
        ),
        child: BlocProvider<GroupChatCubit>(
          create: (_) => getIt<GroupChatCubit>()..load(groupId),
          child: const _GroupChatView(),
        ),
      ),
    );
  }
}

class _GroupChatView extends StatelessWidget {
  const _GroupChatView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupChatCubit, GroupChatState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          loaded: (context) => GroupChatPanel(
            messages: state.messages,
            onSend: context.read<GroupChatCubit>().send,
          ),
        );
      },
    );
  }
}
