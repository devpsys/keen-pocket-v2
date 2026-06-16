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

class _GroupChatView extends StatefulWidget {
  const _GroupChatView();

  @override
  State<_GroupChatView> createState() => _GroupChatViewState();
}

class _GroupChatViewState extends State<_GroupChatView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    context.read<GroupChatCubit>().send(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<GroupChatCubit, GroupChatState>(
            builder: (context, state) {
              return KpAsyncView(
                status: state.status,
                loaded: (context) => ListView.builder(
                  padding: const EdgeInsets.all(KpSpacing.m),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final m = state.messages[index];
                    return Align(
                      alignment: m.isMine
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: KpSpacing.xxs,
                        ),
                        padding: const EdgeInsets.all(KpSpacing.s),
                        decoration: BoxDecoration(
                          color: m.isMine
                              ? context.colorScheme.primaryContainer
                              : context.colorScheme.surfaceContainerHighest,
                          borderRadius: KpRadii.allM,
                        ),
                        child: Text(m.text),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.s),
            child: Row(
              children: [
                Expanded(
                  child: KpTextField(
                    label: context.l10n.groupChatHint,
                    controller: _controller,
                    textInputAction: TextInputAction.send,
                    onChanged: (_) {},
                  ),
                ),
                const Gap.xs(horizontal: true),
                IconButton.filled(
                  onPressed: _send,
                  icon: const Icon(Icons.send),
                  tooltip: context.l10n.groupChatSend,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
