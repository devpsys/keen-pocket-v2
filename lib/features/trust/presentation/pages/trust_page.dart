import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_cubit.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_state.dart';

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
                children: [
                  Text(
                    context.l10n.trustReputationScore,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Gap.xs(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${t.score}', style: context.textTheme.displayLarge),
                      const Gap.s(horizontal: true),
                      Chip(label: Text(t.band)),
                    ],
                  ),
                  if (t.kycVerified) ...[
                    const Gap.xs(),
                    Text(
                      context.l10n.profileKycVerified,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colors.success,
                      ),
                    ),
                  ],
                  const Gap.l(),
                  Text(
                    context.l10n.trustRatingsTitle,
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap.s(),
                  if (t.ratings.isEmpty)
                    Text(context.l10n.trustRatingsEmpty)
                  else
                    for (final r in t.ratings)
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(r.author),
                        subtitle: Text(r.comment),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < r.stars ? Icons.star : Icons.star_border,
                                size: KpSpacing.m,
                                color: context.colors.warning,
                              ),
                          ],
                        ),
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
