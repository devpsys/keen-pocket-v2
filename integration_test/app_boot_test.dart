import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:keenpockets/app/app.dart';
import 'package:keenpockets/core/config/app_config.dart';
import 'package:keenpockets/core/di/injection.dart';

/// Smoke journey: the app boots with real DI and lands on the login screen.
/// Run on a device/emulator:
///   flutter test integration_test/app_boot_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app boots to the login screen', (tester) async {
    await configureDependencies(AppConfig.dev());

    await tester.pumpWidget(const KeenPocketsApp());
    await tester.pumpAndSettle();

    expect(find.byType(KeenPocketsApp), findsOneWidget);
    // Two credential fields are present on the initial route.
    expect(find.byType(TextField), findsNWidgets(2));
  });
}
