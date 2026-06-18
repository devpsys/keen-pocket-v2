import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_phone_view.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_tablet_view.dart';

import '../../../helpers/pump_app.dart';

void main() {
  const pocket = Pocket(
    id: 'p1',
    name: 'December Turkey Fund',
    organiserId: 'u1',
    handPrice: Money(500000),
    totalHands: 12,
    filledHands: 6,
    memberCount: 8,
  );

  testWidgets('phone detail view renders the hub sections', (tester) async {
    tester.view.physicalSize = const Size(500, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(
      const Scaffold(
        body: PocketDetailPhoneView(pocket: pocket, role: PocketRole.organiser),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('December Turkey Fund'), findsWidgets);
    expect(find.text('My progress'), findsOneWidget);
    expect(find.text('Group rules'), findsOneWidget);
    expect(find.text('Top contributors'), findsOneWidget);
  });

  testWidgets('tablet detail view renders the three rails', (tester) async {
    tester.view.physicalSize = const Size(1600, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(
      const Scaffold(
        body: PocketDetailTabletView(
          pocket: pocket,
          role: PocketRole.organiser,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('December Turkey Fund'), findsWidgets);
    expect(find.text('My progress'), findsOneWidget);
    expect(find.text('Group rules'), findsOneWidget);
  });
}
