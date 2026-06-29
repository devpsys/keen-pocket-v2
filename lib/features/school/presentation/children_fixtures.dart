import 'package:core/core.dart';

import 'package:keenpockets/features/school/presentation/view_models/child_view.dart';

/// PRESENTATION-ONLY sample linked children (designs `my_children` / `_tablet`).
/// Swap for real data when the school rails are enabled.

/// Mr. K shown on the "No children linked!" empty state.
const kChildrenEmptyMascotUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDxrW7c0qENvcCeb7C1Ci2Y9YyEvVNhyi027ZH6isF29H_i8lVeKwtTUehqimpIsfhi_5KPcDt8h7wJsHXVdJoShRe4lRQp3_gDZrKcp2KN4NJFUxNssoHqHhws1h7SwQlKImZnroBV_H50v8_xhPWN4SQXXVNBZXhNJ_C-x2Ob40AetXN9E0PuF5DO0BhU2N3eAgm5DD9myPCU0umG8lB9VPRgjJRPm9VayN8xFR7SCViJv6ag9wOvAklcN12HwVm1Ds0wghaQd8U';

/// "Smart Savings" promo banner image on the tablet dashboard.
const kChildrenSmartSavingsUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCZK5bU9avJfpUklXG-XW9duZAFFZ_9sexCbXKMGbCKE_QUS2zqyF69bnqCQ6OWw5h0sCEGTrv0dL6XxXkjr-rZ03QADYSlln0ONaaC8iHLccbuIaTr3_qsY3SOdh2NOovdAufZz4ZtxeAu-iO6cfES8QELYYe5DpbWl7nGdqCr1VXKg0x-XRmosAoqQNu78OhFyy5oyd2BuoK2Gbkr_lrAhCTh_PF1uMFF6hXZLpaN0MkZzrssCIOZx1cKvsJKVYFx4lCs0jbvuZ8';

final kChildren = <ChildView>[
  ChildView(
    name: 'Adekunle Johnson',
    school: 'Greenfield Academy',
    className: 'Grade 4 Blue',
    emoji: '👦',
    tone: ChildAvatarTone.boy,
    planLabel: '30/30/40 Split',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCvdA6fC-_idhAmmR3WezAqI3rMeR8cMXHGLm95Me5xhX_TrnafMnIZRQD7C-420fNWM9LgTSJg7Gdz3wydKCnH_IMr-r7ruENy4-fYpDdJLkqHYLcKeOSdkow8SomOFmq5oJ1joBfoUP1Q7-i2LIMi9-1ueWTcLnlkr5GTD2dN6Ky5anAOfw5KbNEn-XiAX4RWNIwbmdA24XNwRiiRmHBpVvWTD0iqsfjVY2pySyPtgLaae9X5S2lIPknIx0TtNbzOVtXmWSlevYY',
    terms: [
      ChildTermView(
        label: 'Term 1',
        fee: Money.naira(45000),
        paid: Money.naira(45000),
        status: ChildTermStatus.paid,
      ),
      ChildTermView(
        label: 'Term 2',
        fee: Money.naira(45000),
        paid: Money.naira(30000),
        status: ChildTermStatus.partial,
      ),
      ChildTermView(
        label: 'Term 3',
        fee: Money.naira(45000),
        paid: Money.naira(0),
        status: ChildTermStatus.unpaid,
      ),
    ],
  ),
  ChildView(
    name: 'Chioma Johnson',
    school: 'Greenfield Academy',
    className: 'Nursery 2',
    emoji: '👧',
    tone: ChildAvatarTone.girl,
    planLabel: 'Full Payment',
    nextInvoiceDays: 45,
    receiptCount: 2,
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDLh9SaNoZ_7a16P9YFU1OjEvYR99JxOvvBQKXUGbF-FrRCOVjcXTFRiq8lPHvvwBu0rg5Rn43Y2r1ar0STq2BDtZEEsSgKzL7pilKl9UDTXz4hoIu3_RATgz_45roIKddeMz1V9R4Y0eEw3TyF1P9R3ZQ_ljQ1j7FnzBs_NBRBy_LoPPmrMJJjadEH5YR9YKeQmd4XMlCr4MkwDDBIrcwKaN-WLIRjYlKaddFN6Z6lHz8lAwbXzYG03NghtmSuiJRIGD4a2jDkYB4',
    terms: [
      ChildTermView(
        label: 'Term 1',
        fee: Money.naira(35000),
        paid: Money.naira(35000),
        status: ChildTermStatus.paid,
      ),
    ],
  ),
];
