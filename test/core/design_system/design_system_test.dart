import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/design_system/design_system.dart';
import 'package:keenpockets/shared/widgets/app_empty_view.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppTheme', () {
    test('light and dark expose semantic colors extension', () {
      expect(AppTheme.light.extension<AppSemanticColors>(), isNotNull);
      expect(AppTheme.dark.extension<AppSemanticColors>(), isNotNull);
      expect(AppTheme.light.brightness, Brightness.light);
      expect(AppTheme.dark.brightness, Brightness.dark);
    });

    test('AppSemanticColors lerp and copyWith work', () {
      final c = AppSemanticColors.light.copyWith(
        success: const Color(0xFF00FF00),
      );
      expect(c.success, const Color(0xFF00FF00));
      final lerped = AppSemanticColors.light.lerp(AppSemanticColors.dark, 0.5);
      expect(lerped, isA<AppSemanticColors>());
    });
  });

  group('Design system widgets', () {
    testWidgets('AppTextField shows label, hint and error', (tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: AppTextField(
            label: 'Email',
            hint: 'you@x.com',
            errorText: 'bad',
          ),
        ),
      );
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('bad'), findsOneWidget);
    });

    testWidgets('AppEmptyView renders title and message', (tester) async {
      await tester.pumpApp(
        const Scaffold(
          body: AppEmptyView(title: 'Empty', message: 'Nothing'),
        ),
      );
      expect(find.text('Empty'), findsOneWidget);
      expect(find.text('Nothing'), findsOneWidget);
    });

    testWidgets('Gap renders a sized box', (tester) async {
      await tester.pumpApp(const Scaffold(body: Gap.m()));
      expect(find.byType(SizedBox), findsWidgets);
    });
  });

  group('context extensions', () {
    testWidgets('expose theme, colors and breakpoints', (tester) async {
      late bool isCompact;
      late Color success;
      await tester.pumpApp(
        Builder(
          builder: (context) {
            isCompact = context.isCompact;
            success = context.colors.success;
            return Text('x', style: context.textTheme.bodyMedium);
          },
        ),
      );
      expect(success, isNotNull);
      expect(isCompact, isA<bool>());
    });
  });
}
