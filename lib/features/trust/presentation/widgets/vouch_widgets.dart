import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/trust/presentation/widgets/vouch_fixtures.dart';

/// A reputation pill — gold for high scores, grey for low (design `vouches_inbox`).
class VouchRepPill extends StatelessWidget {
  const VouchRepPill({required this.reputation, super.key});

  final int reputation;

  @override
  Widget build(BuildContext context) {
    final high = reputation >= 70;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: high
            ? KpColors.gold500
            : context.colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        border: Border(
          bottom: BorderSide(
            color: high ? KpColors.gold600 : context.colorScheme.outlineVariant,
            width: 2,
          ),
        ),
      ),
      child: Text(
        context.l10n.vouchRep(reputation),
        style: context.textTheme.labelSmall?.copyWith(
          color: high ? KpColors.gold600 : context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final VouchStatus status;

  @override
  Widget build(BuildContext context) {
    if (status == VouchStatus.recommended) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: KpSpacing.s,
          vertical: KpSpacing.xxs,
        ),
        decoration: const BoxDecoration(
          color: KpColors.gold500,
          borderRadius: BorderRadius.all(Radius.circular(KpRadii.pill)),
          border: Border(bottom: BorderSide(color: KpColors.gold600, width: 2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star_rounded,
              size: KpSpacing.m,
              color: KpColors.gold600,
            ),
            const Gap.xxs(horizontal: true),
            Text(
              context.l10n.vouchRecommended,
              style: context.textTheme.labelSmall?.copyWith(
                color: KpColors.gold600,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        context.l10n.vouchPending,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

/// A quote-styled note bubble.
class VouchNote extends StatelessWidget {
  const VouchNote({required this.note, super.key});

  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.format_quote_rounded,
            color: context.colorScheme.primaryContainer.withValues(alpha: 0.5),
          ),
          const Gap.xs(horizontal: true),
          Expanded(
            child: Text(
              note,
              style: context.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// One incoming vouch request (design `vouches_inbox`).
class VouchRequestCard extends StatelessWidget {
  const VouchRequestCard({
    required this.request,
    this.onRecommend,
    this.onDecline,
    super.key,
  });

  final VouchRequest request;
  final VoidCallback? onRecommend;
  final VoidCallback? onDecline;

  @override
  Widget build(BuildContext context) {
    final recommended = request.status == VouchStatus.recommended;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.surfaceContainerHighest,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: KpRadii.allL,
                child: KpNetworkImage(
                  url: request.avatarUrl,
                  width: 56,
                  height: 56,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: KpSpacing.xs,
                      runSpacing: KpSpacing.xxs,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(request.name, style: context.textTheme.titleLarge),
                        VouchRepPill(reputation: request.reputation),
                      ],
                    ),
                    const Gap.xxs(),
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_rounded,
                          size: KpSpacing.m,
                          color: context.colorScheme.primary,
                        ),
                        const Gap.xxs(horizontal: true),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.primary,
                              ),
                              children: [
                                TextSpan(text: '${context.l10n.vouchJoining} '),
                                TextSpan(
                                  text: request.pocket,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              _StatusPill(status: request.status),
            ],
          ),
          if (request.note.isNotEmpty) ...[
            const Gap.m(),
            VouchNote(note: request.note),
          ],
          const Gap.m(),
          if (recommended)
            Opacity(
              opacity: 0.5,
              child: KpButton(
                label: context.l10n.vouchVouched,
                variant: KpButtonVariant.neutral,
                onPressed: () {},
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: KpButton(
                    label: context.l10n.vouchRecommend,
                    caps: true,
                    onPressed: onRecommend ?? () {},
                  ),
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: KpButton(
                    label: context.l10n.vouchDecline,
                    variant: KpButtonVariant.neutral,
                    caps: true,
                    onPressed: onDecline ?? () {},
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// Empty state when there are no requests (design `vouches_inbox`).
class VouchEmptyState extends StatelessWidget {
  const VouchEmptyState({this.onRefresh, super.key});

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxl),
      child: Column(
        children: [
          const KpMascot.search(size: 120),
          const Gap.l(),
          Text(
            context.l10n.vouchEmptyTitle,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall,
          ),
          const Gap.xs(),
          Text(
            context.l10n.vouchEmptyBody,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.l(),
          KpButton(
            label: context.l10n.vouchRefresh,
            variant: KpButtonVariant.secondary,
            onPressed: onRefresh ?? () {},
          ),
        ],
      ),
    );
  }
}
