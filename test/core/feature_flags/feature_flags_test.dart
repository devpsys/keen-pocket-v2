import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('FeatureFlagService', () {
    test('conservative defaults (money rails off)', () {
      final flags = FeatureFlagService();
      expect(flags.isEnabled(Feature.wallet), isFalse);
      expect(flags.isEnabled(Feature.payments), isFalse);
      expect(flags.isEnabled(Feature.gamification), isTrue);
    });

    test('hydrate overrides defaults', () {
      final flags = FeatureFlagService()..hydrate({Feature.wallet: true});
      expect(flags.isEnabled(Feature.wallet), isTrue);
    });

    test('feature keys mirror backend env names', () {
      expect(Feature.wallet.key, 'WALLET_ENABLED');
      expect(Feature.kyc.key, 'KYC_ENABLED');
    });
  });

  group('FeatureGuard', () {
    testWidgets('shows child when enabled', (tester) async {
      await tester.pumpApp(
        const FeatureGuard(enabled: true, child: Text('on')),
      );
      expect(find.text('on'), findsOneWidget);
    });

    testWidgets('shows comingSoon when disabled', (tester) async {
      await tester.pumpApp(
        const FeatureGuard(
          enabled: false,
          comingSoon: Text('soon'),
          child: Text('on'),
        ),
      );
      expect(find.text('soon'), findsOneWidget);
      expect(find.text('on'), findsNothing);
    });
  });
}
