import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_phone_view.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_tablet_view.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('phone plan detail renders the hub sections', (tester) async {
    tester.view.physicalSize = const Size(500, 2600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const Scaffold(body: PlanDetailPhoneView()));
    await tester.pumpAndSettle();

    expect(find.text('Budget Health'), findsOneWidget);
    expect(find.text('Item Checklist'), findsOneWidget);
    expect(find.text('Basmati Rice (Large Bag)'), findsOneWidget);
    expect(find.text('Shared with'), findsOneWidget);
  });

  testWidgets('tablet plan detail renders the cockpit', (tester) async {
    tester.view.physicalSize = const Size(1600, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const Scaffold(body: PlanDetailTabletView()));
    await tester.pumpAndSettle();

    expect(find.text('Budget Health'), findsOneWidget);
    expect(find.text('Item Checklist'), findsOneWidget);
    expect(find.text('Shared with'), findsOneWidget);
  });
}
