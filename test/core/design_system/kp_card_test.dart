import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('KpCard', () {
    testWidgets('renders its child', (tester) async {
      await tester.pumpApp(
        const Scaffold(body: KpCard(child: Text('content'))),
      );
      expect(find.text('content'), findsOneWidget);
    });

    testWidgets('interactive card fires onTap', (tester) async {
      var tapped = false;
      await tester.pumpApp(
        Scaffold(
          body: KpCard.interactive(
            onTap: () => tapped = true,
            child: const Text('tap me'),
          ),
        ),
      );

      await tester.tap(find.text('tap me'));
      expect(tapped, isTrue);
    });

    testWidgets('financial card paints a gradient', (tester) async {
      await tester.pumpApp(
        const Scaffold(body: KpCard.financial(child: Text('balance'))),
      );

      final box = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final decoration = box.decoration! as BoxDecoration;
      expect(decoration.gradient, isNotNull);
    });
  });
}
