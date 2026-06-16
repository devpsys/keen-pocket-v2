import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/contributions/domain/repositories/contribution_repository.dart';
import 'package:keenpockets/features/contributions/domain/usecases/submit_contribution.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepo extends Mock implements ContributionRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(ContributionContext.pocket('x'));
    registerFallbackValue(Money.zero);
  });

  group('ContributionContext', () {
    test('pocket/adashi factories and equality', () {
      final p = ContributionContext.pocket('p1', slot: 's1');
      expect(p.host, ContributionHost.pocket);
      expect(p.hostId, 'p1');
      expect(p.reference, 's1');
      expect(
        ContributionContext.pocket('p1', slot: 's1'),
        ContributionContext.pocket('p1', slot: 's1'),
      );
      expect(
        ContributionContext.adashi('a1'),
        isNot(ContributionContext.pocket('a1')),
      );
    });
  });

  group('SubmitContribution', () {
    late _MockRepo repo;
    late SubmitContribution useCase;

    setUp(() {
      repo = _MockRepo();
      useCase = SubmitContribution(repo);
    });

    test(
      'rejects non-positive amount without hitting the repository',
      () async {
        final result = await useCase(
          SubmitContributionParams(
            context: ContributionContext.pocket('p1'),
            amount: Money.zero,
          ),
        );

        expect(result.getLeft().toNullable(), isA<ValidationFailure>());
        verifyNever(
          () => repo.submitContribution(
            context: any(named: 'context'),
            amount: any(named: 'amount'),
          ),
        );
      },
    );
  });
}
