import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('KpButton', () {
    testWidgets('renders its label and fires onPressed', (tester) async {
      var tapped = false;
      await tester.pumpApp(
        Scaffold(
          body: KpButton(label: 'Continue', onPressed: () => tapped = true),
        ),
      );

      expect(find.text('Continue'), findsOneWidget);
      await tester.tap(find.byType(KpButton));
      expect(tapped, isTrue);
    });

    testWidgets('renders a leading icon when provided', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: KpButton(
            label: 'Continue',
            icon: Icons.arrow_forward,
            onPressed: () {},
          ),
        ),
      );
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.byType(Gap), findsOneWidget);
    });

    testWidgets('shows spinner and ignores taps while loading', (tester) async {
      var tapped = false;
      await tester.pumpApp(
        Scaffold(
          body: KpButton(
            label: 'Continue',
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.tap(find.byType(KpButton));
      expect(tapped, isFalse);
    });
  });
}
