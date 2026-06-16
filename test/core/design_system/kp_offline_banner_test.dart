import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('renders the offline message', (tester) async {
    await tester.pumpApp(
      const Scaffold(body: KpOfflineBanner(message: 'You are offline')),
    );
    expect(find.text('You are offline'), findsOneWidget);
    expect(find.byIcon(Icons.cloud_off_outlined), findsOneWidget);
  });
}
