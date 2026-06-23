import 'package:injectable/injectable.dart';

import 'feature.dart';

/// Holds the current feature-flag snapshot. Defaults are conservative (money
/// rails OFF) and overridden at startup by [hydrate] from backend status
/// endpoints + Remote Config. Pure Dart so it is trivially testable.
@lazySingleton
class FeatureFlagService {
  final Map<Feature, bool> _flags = {
    Feature.wallet: false,
    Feature.payments: false,
    Feature.payouts: false,
    Feature.kyc: false,
    Feature.otp: false,
    Feature.referrals: true,
    Feature.gamification: true,
    Feature.charity: true,
    Feature.chat: true,
    Feature.school: false,
    Feature.plans: false,
  };

  bool isEnabled(Feature feature) => _flags[feature] ?? false;

  /// Merge a freshly-fetched snapshot (e.g. from `payments/status`).
  void hydrate(Map<Feature, bool> values) => _flags.addAll(values);
}
