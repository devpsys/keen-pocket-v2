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

    testWidgets('ignores taps when onPressed is null', (tester) async {
      await tester.pumpApp(
        const Scaffold(body: KpButton(label: 'Disabled', onPressed: null)),
      );
      // Tapping a disabled button must not throw.
      await tester.tap(find.byType(KpButton));
      expect(find.text('Disabled'), findsOneWidget);
    });

    testWidgets('caps renders the label uppercase', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: KpButton(label: 'Continue', caps: true, onPressed: () {}),
        ),
      );
      expect(find.text('CONTINUE'), findsOneWidget);
    });

    testWidgets('ghost variant renders without a 3D base', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: KpButton(
            label: 'Skip',
            variant: KpButtonVariant.ghost,
            onPressed: () {},
          ),
        ),
      );
      // Ghost is flat — no AnimatedContainer base layer.
      expect(find.byType(AnimatedContainer), findsNothing);
      expect(find.text('Skip'), findsOneWidget);
    });

    testWidgets('secondary variant is a candy button', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: KpButton(
            label: 'Claim',
            variant: KpButtonVariant.secondary,
            onPressed: () {},
          ),
        ),
      );
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });
  });
}
