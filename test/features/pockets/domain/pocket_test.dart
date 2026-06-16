import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/domain/value_objects/hands.dart';

void main() {
  group('Money', () {
    test('naira factory and kobo storage', () {
      expect(Money.naira(2500).kobo, 250000);
      expect(const Money(250000).naira, 2500);
    });

    test('formats with thousands separator and 2 decimals', () {
      expect(Money.naira(2500).format(), '₦2,500.00');
      expect(const Money(99).format(), '₦0.99');
      expect(const Money(123456789).format(), '₦1,234,567.89');
    });

    test('arithmetic and equality', () {
      expect(Money.naira(10) + Money.naira(5), Money.naira(15));
      expect(Money.naira(10) - Money.naira(5), Money.naira(5));
      expect(Money.naira(10), Money.naira(10));
    });
  });

  group('Hands', () {
    test('rejects non-positive counts', () {
      expect(() => Hands(0), throwsArgumentError);
      expect(Hands.tryCreate(0), isNull);
      expect(Hands(3).count, 3);
    });
  });

  group('Pocket.roleOf', () {
    const pocket = Pocket(
      id: 'p1',
      name: 'Rent',
      organiserId: 'u1',
      handPrice: Money(500000),
      totalHands: 10,
      filledHands: 4,
      memberCount: 4,
      memberIds: {'u2', 'u3'},
    );

    test('organiser, member, guest resolution', () {
      expect(pocket.roleOf('u1'), PocketRole.organiser);
      expect(pocket.roleOf('u2'), PocketRole.member);
      expect(pocket.roleOf('u9'), PocketRole.guest);
    });

    test('canManage only for the organiser', () {
      expect(pocket.canManage('u1'), isTrue);
      expect(pocket.canManage('u2'), isFalse);
    });

    test('fillRate and isFull', () {
      expect(pocket.fillRate, 0.4);
      expect(pocket.isFull, isFalse);
      expect(pocket.copyWith(filledHands: 10).isFull, isTrue);
    });
  });
}
