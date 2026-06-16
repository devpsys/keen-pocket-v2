import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_cubit.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_state.dart';
import 'package:keenpockets/features/trust/presentation/widgets/reputation_block.dart';

/// Reputation score + ratings received.
class TrustPage extends StatelessWidget {
  const TrustPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrustCubit>(
      create: (_) => getIt<TrustCubit>()..load(),
      child: const _TrustView(),
    );
  }
}

class _TrustView extends StatelessWidget {
  const _TrustView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.trustTitle)),
      body: BlocBuilder<TrustCubit, TrustState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            loaded: (context) {
              final t = state.trust;
              if (t == null) return const SizedBox.shrink();
              return ListView(
                padding: const EdgeInsets.all(KpSpacing.l),
                children: [ReputationBlock(trust: t)],
              );
            },
          );
        },
      ),
    );
  }
}
