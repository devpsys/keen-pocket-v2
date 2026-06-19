import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/widgets/kp_network_image.dart';

/// Overlapping member portraits with a trailing "+N" chip — the member cluster
/// shown on the Adashi circle cards (design `adashi_circles`).
class AdashiMemberAvatars extends StatelessWidget {
  const AdashiMemberAvatars({
    required this.urls,
    required this.extra,
    this.radius = 16,
    super.key,
  });

  final List<String> urls;
  final int extra;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final ring = context.colorScheme.surfaceContainerLowest;
    final diameter = radius * 2;
    final overlap = radius * 0.6;

    final chips = <Widget>[
      for (final url in urls)
        _Ringed(
          ring: ring,
          child: KpNetworkAvatar(url: url, radius: radius),
        ),
      if (extra > 0)
        _Ringed(
          ring: ring,
          child: Container(
            width: diameter,
            height: diameter,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surfaceContainerHighest,
            ),
            child: Text(
              '+$extra',
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
    ];

    return SizedBox(
      height: diameter,
      width: chips.isEmpty
          ? 0
          : diameter + (chips.length - 1) * (diameter - overlap),
      child: Stack(
        children: [
          for (var i = 0; i < chips.length; i++)
            Positioned(left: i * (diameter - overlap), child: chips[i]),
        ],
      ),
    );
  }
}

/// A 2px surface ring around an avatar so overlapping chips stay separated.
class _Ringed extends StatelessWidget {
  const _Ringed({required this.ring, required this.child});

  final Color ring;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xxs / 2),
      decoration: BoxDecoration(shape: BoxShape.circle, color: ring),
      child: child,
    );
  }
}
