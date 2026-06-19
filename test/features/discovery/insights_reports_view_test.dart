import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_reports_phone_view.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/insights_reports_tablet_view.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('phone insights renders the year-in-review metrics', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(500, 2600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const Scaffold(body: InsightsReportsPhoneView()));
    await tester.pumpAndSettle();

    expect(find.text('Year in Review'), findsOneWidget);
    expect(find.text('₦4,250,000'), findsOneWidget);
    expect(find.text('Share My Year'), findsOneWidget);
  });

  testWidgets('tablet insights renders the grid and Mr K advice', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1600, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const Scaffold(body: InsightsReportsTabletView()));
    await tester.pumpAndSettle();

    expect(find.text('Year in Review'), findsOneWidget);
    expect(find.text("MR. K'S ADVICE"), findsOneWidget);
  });
}
