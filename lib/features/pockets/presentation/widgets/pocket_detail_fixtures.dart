import 'package:core/core.dart';

// PRESENTATION-ONLY placeholder data for the pocket detail hub's composed
// sections (designs `pocket_detail_hub` + `pocket_detail_hub_tablet`).
// Replaced by real cubit-backed data when the data layer lands.

typedef PocketMember = ({String name, int hands, bool kyc, bool online});
typedef PocketContributor = ({String name, Money amount});
typedef PocketContribution = ({
  String period,
  String handLabel,
  String timestamp,
  Money amount,
  bool paid,
});
typedef PocketShoppingSuggestion = ({
  String name,
  Money groupPrice,
  String sharedBy,
});

const kPocketOrganiserName = 'Musa';
const kPocketTagline = 'Community savings circle';
const kPocketDurationMonths = 6;
const kPocketRating = '4.8';
const kPocketJoinRequestName = 'Bayo M.';

const kPocketContributions = <PocketContribution>[
  (
    period: 'May 2024',
    handLabel: 'May Hand',
    timestamp: 'May 12, 2024 • 10:45 AM',
    amount: Money(500000),
    paid: true,
  ),
  (
    period: 'June 2024',
    handLabel: 'June Hand',
    timestamp: 'Jun 15, 2024 • 09:12 AM',
    amount: Money(500000),
    paid: false,
  ),
];

const kPocketMembers = <PocketMember>[
  (name: 'Amaka', hands: 2, kyc: true, online: true),
  (name: 'David O.', hands: 1, kyc: false, online: false),
  (name: 'Sarah Bello', hands: 3, kyc: true, online: true),
];

const kPocketTopContributors = <PocketContributor>[
  (name: 'Sarah Bello', amount: Money(4500000)),
  (name: 'Amaka', amount: Money(3000000)),
  (name: 'Musa', amount: Money(2500000)),
];

const kPocketGroupShopping = <PocketShoppingSuggestion>[
  (name: 'Bulk Turkey (20kg)', groupPrice: Money(4500000), sharedBy: 'Musa'),
  (name: 'Vegetable Oil (25L)', groupPrice: Money(3200000), sharedBy: 'Amaka'),
];

const kPocketPendingDonor = (name: 'Bolanle Ade', amount: Money(1000000));

const kPocketPayout = (
  bank: 'Kuda Bank',
  nuban: '**** 8291',
  holder: 'Musa Ibrahim · Primary',
);
