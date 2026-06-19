import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/pages/adashi_detail_page.dart';
import 'package:keenpockets/features/adashi/presentation/pages/adashi_list_page.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_card.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_tablet_card.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/rotation_timeline.dart';

import '../../../helpers/pump_app.dart';

void main() {
  setUp(() {
    // The cubits have no dependencies; register the real ones (sample-backed).
    getIt
      ..registerFactory<AdashiListCubit>(AdashiListCubit.new)
      ..registerFactory<AdashiDetailCubit>(AdashiDetailCubit.new);
  });
  tearDown(() => getIt.reset());

  testWidgets('AdashiListPage renders the phone circle cards', (tester) async {
    await tester.pumpApp(const AdashiListPage());
    await tester.pumpAndSettle();

    expect(find.byType(AdashiCard), findsWidgets);
    expect(find.text('My Adashi Groups'), findsOneWidget);
    expect(find.text('Market Women Union'), findsOneWidget);
  });

  testWidgets('AdashiListPage reflows to the tablet card grid', (tester) async {
    tester.view.physicalSize = const Size(1500, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const AdashiListPage());
    await tester.pumpAndSettle();

    expect(find.byType(AdashiTabletCard), findsWidgets);
    expect(find.text('New Group'), findsOneWidget);
    expect(find.text('Join a Circle'), findsOneWidget);
    expect(find.text('Did you know?'), findsOneWidget);
  });

  testWidgets('AdashiDetailPage renders the rotation timeline', (tester) async {
    await tester.pumpApp(const AdashiDetailPage(adashiId: 'a1'));
    await tester.pumpAndSettle();

    expect(find.byType(RotationTimeline), findsOneWidget);
    expect(find.text('Market Women Union'), findsOneWidget);
  });
}
