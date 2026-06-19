import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/explore_adashi_phone_view.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/explore_adashi_tablet_view.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('phone explore-adashi renders the circle detail', (tester) async {
    tester.view.physicalSize = const Size(500, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const Scaffold(body: ExploreAdashiPhoneView()));
    await tester.pumpAndSettle();

    expect(find.text('Lagos Wealth Circle'), findsOneWidget);
    expect(find.text('Circle Rules'), findsOneWidget);
  });

  testWidgets('tablet explore-adashi renders the vital stats', (tester) async {
    tester.view.physicalSize = const Size(1600, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const Scaffold(body: ExploreAdashiTabletView()));
    await tester.pumpAndSettle();

    expect(find.text('Circle Vital Stats'), findsOneWidget);
    expect(find.text('Circle Rules'), findsOneWidget);
  });
}
