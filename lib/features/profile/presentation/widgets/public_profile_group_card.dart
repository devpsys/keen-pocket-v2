import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_fixtures.dart';

/// A group card in the "Groups by …" gallery: an open pocket (with a funding
/// bar) or an adashi circle (with a member-initials stack).
class PublicProfileGroupCard extends StatelessWidget {
  const PublicProfileGroupCard({required this.group, super.key});

  final PublicGroup group;

  @override
  Widget build(BuildContext context) {
    final tint = group.isAdashi
        ? context.colorScheme.secondary
        : context.colorScheme.primary;
    final badgeBg = group.isAdashi
        ? context.colorScheme.secondaryContainer
        : context.colorScheme.primaryContainer;
    final badgeFg = group.isAdashi
        ? context.colorScheme.onSecondaryContainer
        : context.colorScheme.onPrimaryContainer;
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.15),
                  borderRadius: KpRadii.allL,
                ),
                child: Icon(group.icon, color: tint),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.s,
                  vertical: KpSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(KpRadii.pill),
                ),
                child: Text(
                  group.isAdashi
                      ? context.l10n.publicProfileAdashiCircle
                      : context.l10n.publicProfileOpenPocket,
                  style: context.textTheme.labelSmall?.copyWith(color: badgeFg),
                ),
              ),
            ],
          ),
          const Gap.m(),
          Text(group.name, style: context.textTheme.headlineSmall),
          const Gap.xs(),
          Text(
            group.description,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.m(),
          if (group.progress != null) ...[
            KpProgressBar(value: group.progress!),
            const Gap.xs(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.publicProfileFunded(
                    (group.progress! * 100).round(),
                  ),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  group.fundingLabel ?? '',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ] else
            _MemberInitials(
              initials: group.memberInitials,
              extra: group.extraMembers,
            ),
        ],
      ),
    );
  }
}

class _MemberInitials extends StatelessWidget {
  const _MemberInitials({required this.initials, required this.extra});

  static const double _size = 32;
  static const double _step = 22;

  final List<String> initials;
  final int extra;

  @override
  Widget build(BuildContext context) {
    final chips = <Widget>[
      for (var i = 0; i < initials.length; i++)
        Positioned(
          left: i * _step,
          child: _chip(context, child: Text(initials[i])),
        ),
      if (extra > 0)
        Positioned(
          left: initials.length * _step,
          child: _chip(context, child: Text('+$extra')),
        ),
    ];
    final count = initials.length + (extra > 0 ? 1 : 0);
    return SizedBox(
      height: _size,
      width: count * _step + (_size - _step),
      child: Stack(children: chips),
    );
  }

  Widget _chip(BuildContext context, {required Widget child}) {
    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
        border: Border.all(color: context.colorScheme.surface, width: 2),
      ),
      child: DefaultTextStyle.merge(
        style: context.textTheme.labelSmall,
        child: child,
      ),
    );
  }
}
