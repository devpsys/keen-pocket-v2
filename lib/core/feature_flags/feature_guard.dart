import 'package:flutter/widgets.dart';

/// Renders [child] when a capability is enabled, otherwise a coming-soon
/// fallback. Keeps flag-gating declarative and out of feature widgets.
///
/// ```dart
/// FeatureGuard(
///   enabled: flags.isEnabled(Feature.wallet),
///   comingSoon: KpComingSoonCard(
///     title: context.l10n.comingSoonTitle,
///     message: context.l10n.comingSoonMessage,
///   ),
///   child: const WalletView(),
/// )
/// ```
class FeatureGuard extends StatelessWidget {
  const FeatureGuard({
    required this.enabled,
    required this.child,
    this.comingSoon,
    super.key,
  });

  final bool enabled;
  final Widget child;
  final Widget? comingSoon;

  @override
  Widget build(BuildContext context) {
    if (enabled) return child;
    return comingSoon ?? const SizedBox.shrink();
  }
}
