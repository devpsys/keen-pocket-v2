import 'package:core/core.dart';

import 'package:keenpockets/features/money/presentation/view_models/bank_account_view.dart';
import 'package:keenpockets/features/money/presentation/view_models/payout_view.dart';

/// PRESENTATION-ONLY sample payouts/bank data (designs `payouts_bank_hub` /
/// `_tablet`). Swap for real data when the money rails are enabled.

/// Banks offered in the payout-account dropdown.
const kPayoutBanks = <String>[
  'First Bank of Nigeria',
  'Zenith Bank',
  'GTBank',
  'Access Bank',
];

/// Phone "Pocket collection details" cards.
const kPayoutCollections = <BankAccountView>[
  BankAccountView(
    id: 'c1',
    label: 'Emergency Fund',
    subtitle: 'Primary Savings',
    bankName: 'Zenith Bank',
    maskedNuban: '**** 5521',
  ),
  BankAccountView(
    id: 'c2',
    label: 'Education Pocket',
    subtitle: 'Uni Tuition',
    bankName: 'Access Bank',
    maskedNuban: '**** 0988',
  ),
];

/// Tablet "Pocket Collections" cards (with amount + progress).
final kPayoutCollectionsTablet = <PayoutCollectionView>[
  PayoutCollectionView(
    id: 'c1',
    name: 'Emergency Fund',
    bankName: 'Zenith Bank',
    amount: Money.naira(250400),
    percent: 0.65,
  ),
  PayoutCollectionView(
    id: 'c2',
    name: 'Education Pocket',
    bankName: 'Access Bank',
    amount: Money.naira(1200000),
    percent: 0.48,
    progressLabel: 'Target: ₦2.5M',
  ),
];

final kPayoutsReceived = <PayoutView>[
  PayoutView(
    id: 'p1',
    reference: 'KP-9921-X',
    amount: Money.naira(45000),
    status: PayoutStatus.success,
    dateLabel: 'Oct 24, 2023',
    bankName: 'Zenith Bank',
  ),
  PayoutView(
    id: 'p2',
    reference: 'KP-9918-B',
    amount: Money.naira(12500),
    status: PayoutStatus.pending,
    dateLabel: 'Oct 26, 2023',
    bankName: 'Access Bank',
  ),
  PayoutView(
    id: 'p3',
    reference: 'KP-9877-Z',
    amount: Money.naira(8000),
    status: PayoutStatus.failed,
    dateLabel: 'Oct 19, 2023',
    bankName: 'GTBank',
  ),
  PayoutView(
    id: 'p4',
    reference: 'KP-9821-M',
    amount: Money.naira(150000),
    status: PayoutStatus.success,
    dateLabel: 'Oct 12, 2023',
    bankName: 'Zenith Bank',
  ),
];

final kPayoutsTotalCollected = Money.naira(1450400);

const kPayoutsMascotTip =
    'Mr. K says: "Switching banks is easy! Your next payout will follow '
    'your updated choice instantly."';
