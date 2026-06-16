import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';
import 'package:keenpockets/features/trust/presentation/widgets/rate_organiser_sheet.dart';
import 'package:keenpockets/features/trust/presentation/widgets/reputation_block.dart';
import 'package:keenpockets/features/trust/presentation/widgets/reputation_chip.dart';

import '../../helpers/pump_app.dart';

const _trust = TrustView(
  score: 82,
  band: 'Keen Pioneer',
  kycVerified: true,
  memberName: 'Alex Rivera',
  memberSince: 'Jan 2023',
  paymentReliability: 98,
  pocketsJoined: 12,
  adashisCompleted: 5,
  avgRating: 4.9,
  ratings: [RatingView(author: 'Sarah', stars: 5, comment: 'Great organiser')],
);

void main() {
  testWidgets('ReputationBlock renders score, band, stats and ratings', (
    tester,
  ) async {
    await tester.pumpApp(
      const Scaffold(
        body: SingleChildScrollView(child: ReputationBlock(trust: _trust)),
      ),
    );

    expect(find.text('82'), findsOneWidget);
    expect(find.text('Keen Pioneer'), findsOneWidget);
    expect(find.text('Alex Rivera'), findsOneWidget);
    expect(find.text('98%'), findsOneWidget);
    expect(find.text('Sarah'), findsOneWidget);
  });

  testWidgets('ReputationChip shows score and band', (tester) async {
    await tester.pumpApp(
      const Scaffold(body: ReputationChip(score: 82, band: 'Trusted')),
    );
    expect(find.textContaining('82'), findsOneWidget);
    expect(find.textContaining('Trusted'), findsOneWidget);
  });

  testWidgets('KycBadge shows the verified label', (tester) async {
    await tester.pumpApp(const Scaffold(body: KycBadge()));
    expect(find.text('KYC verified'), findsOneWidget);
  });

  testWidgets('RateOrganiserSheet returns the selected stars on submit', (
    tester,
  ) async {
    int? result;
    await tester.pumpApp(
      Scaffold(
        body: Builder(
          builder: (context) => KpButton(
            label: 'open',
            onPressed: () async {
              result = await RateOrganiserSheet.show(
                context,
                organiserName: 'Alex',
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    // Tap the 4th star, then submit.
    await tester.tap(find.byIcon(Icons.star_border_rounded).at(3));
    await tester.pump();
    await tester.tap(find.text('Submit rating'));
    await tester.pumpAndSettle();

    expect(result, 4);
  });
}
