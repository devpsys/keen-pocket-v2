import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('KpProgressBar', () {
    testWidgets('renders the indicator at the given fraction', (tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: Center(
            child: SizedBox(width: 200, child: KpProgressBar(value: 0.5)),
          ),
        ),
      );

      final fraction = tester.widget<FractionallySizedBox>(
        find.byType(FractionallySizedBox),
      );
      expect(fraction.widthFactor, 0.5);
    });

    testWidgets('clamps out-of-range values', (tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: Center(
            child: SizedBox(width: 200, child: KpProgressBar(value: 1.8)),
          ),
        ),
      );

      final fraction = tester.widget<FractionallySizedBox>(
        find.byType(FractionallySizedBox),
      );
      expect(fraction.widthFactor, 1.0);
    });
  });
}
