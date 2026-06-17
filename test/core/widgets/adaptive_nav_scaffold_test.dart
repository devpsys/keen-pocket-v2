import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/widgets/adaptive_nav_scaffold.dart';

const _destinations = [
  AdaptiveDestination(
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    label: 'Home',
  ),
  AdaptiveDestination(
    icon: Icons.person_outline,
    selectedIcon: Icons.person,
    label: 'Profile',
  ),
];

Future<void> _pumpAt(WidgetTester tester, Size size) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  await tester.pumpWidget(
    MaterialApp(
      home: AdaptiveNavScaffold(
        destinations: _destinations,
        selectedIndex: 0,
        onDestinationSelected: (_) {},
        body: const Text('body'),
      ),
    ),
  );
}

void main() {
  testWidgets('uses a bottom NavigationBar on compact widths', (tester) async {
    await _pumpAt(tester, const Size(400, 800));
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
    expect(find.text('body'), findsOneWidget);
  });

  testWidgets('uses the custom side nav on expanded widths', (tester) async {
    await _pumpAt(tester, const Size(1200, 800));
    expect(find.byType(NavigationBar), findsNothing);
    // Destinations render as labelled items in the custom rail.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('body'), findsOneWidget);
  });

  testWidgets('uses a NavigationRail on medium widths', (tester) async {
    await _pumpAt(tester, const Size(800, 800));
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });
}
