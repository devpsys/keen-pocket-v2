import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/dashboard/presentation/pages/dashboard_page.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('renders the dashboard title', (tester) async {
    await tester.pumpApp(const DashboardPage());
    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('logout action triggers the callback', (tester) async {
    var loggedOut = false;
    await tester.pumpApp(DashboardPage(onLogout: () => loggedOut = true));

    await tester.tap(find.byIcon(Icons.logout));
    expect(loggedOut, isTrue);
  });
}
