import 'package:core/core.dart';

/// Tablet month status chip (design `allocate_months_tablet`).
enum AllocateMonthStatus { ready, pending, edit }

/// PRESENTATION-ONLY pending month for the allocate screen (design
/// `allocate_months`). Replaced by domain data when the ledger lands.
class AllocateMonth {
  const AllocateMonth({
    required this.name,
    required this.target,
    required this.paid,
    required this.allocated,
    required this.status,
  });

  final String name;
  final Money target;
  final int paid; // count of paid contributions so far
  final int allocated; // pre-filled allocation (Naira)
  final AllocateMonthStatus status;
}

AllocateMonth _month(String name, AllocateMonthStatus status, int allocated) =>
    AllocateMonth(
      name: name,
      target: Money.naira(2000),
      paid: 0,
      allocated: allocated,
      status: status,
    );

final kAllocateMonths = <AllocateMonth>[
  _month('January', AllocateMonthStatus.ready, 2000),
  _month('February', AllocateMonthStatus.pending, 2000),
  _month('March', AllocateMonthStatus.pending, 2000),
  _month('April', AllocateMonthStatus.pending, 2000),
  _month('May', AllocateMonthStatus.pending, 2000),
  _month('June', AllocateMonthStatus.edit, 0),
];

/// Total contribution being allocated across the months above.
final kAllocateTotal = Money.naira(10000);
