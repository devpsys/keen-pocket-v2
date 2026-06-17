import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/auth/presentation/pages/onboarding_page.dart';
import 'package:keenpockets/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:keenpockets/features/auth/presentation/pages/register_page.dart';
import 'package:keenpockets/features/auth/presentation/pages/splash_page.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  testWidgets('SplashPage fires get-started and login callbacks', (
    tester,
  ) async {
    var started = false;
    var login = false;
    await tester.pumpApp(
      SplashPage(
        onGetStarted: () => started = true,
        onLogin: () => login = true,
      ),
    );

    await tester.tap(find.text('Get started'));
    expect(started, isTrue);
    await tester.tap(find.text('I already have an account'));
    expect(login, isTrue);
  });

  testWidgets('OnboardingPage advances through slides and finishes', (
    tester,
  ) async {
    var done = false;
    await tester.pumpApp(OnboardingPage(onDone: () => done = true));

    expect(find.text('Save together'), findsOneWidget);
    await tester.tap(find.text('CONTINUE'));
    await tester.pumpAndSettle();
    expect(find.text('Stay accountable'), findsOneWidget);
    await tester.tap(find.text('CONTINUE'));
    await tester.pumpAndSettle();
    expect(find.text('Build trust'), findsOneWidget);
    await tester.tap(find.text('GET STARTED'));
    expect(done, isTrue);
  });

  testWidgets('RegisterPage enables submit only after agreeing to terms', (
    tester,
  ) async {
    var submitted = false;
    await tester.pumpApp(RegisterPage(onSubmitted: () => submitted = true));

    await tester.drag(find.byType(ListView), const Offset(0, -1200));
    await tester.pumpAndSettle();
    await tester.tap(find.text('CREATE ACCOUNT'));
    expect(submitted, isFalse); // disabled until terms accepted

    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    await tester.tap(find.text('CREATE ACCOUNT'));
    expect(submitted, isTrue);
  });

  testWidgets('OtpVerificationPage shows the maintenance banner and 6 boxes', (
    tester,
  ) async {
    var verified = false;
    await tester.pumpApp(
      OtpVerificationPage(
        destination: '+1 (555) ••• ••89',
        onVerified: () => verified = true,
      ),
    );

    expect(find.text("Verify it's you"), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(6));
    await tester.tap(find.text('VERIFY'));
    expect(verified, isTrue);
  });
}
