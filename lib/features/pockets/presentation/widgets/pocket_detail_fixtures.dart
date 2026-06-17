import 'package:core/core.dart';

import 'package:keenpockets/features/pockets/presentation/view_models/shopping_item_view.dart';

// PRESENTATION-ONLY placeholder data for the pocket detail hub's composed
// sections. Replaced by real cubit-backed data when the data layer lands.

typedef PocketMember = ({String name, int hands, bool kyc});
typedef PocketContributor = ({String name, Money amount});
typedef PocketContribution = ({String period, Money amount, bool paid});

const kPocketOrganiserName = 'Musa';

const kPocketContributions = <PocketContribution>[
  (period: 'May 2024', amount: Money(500000), paid: true),
  (period: 'June 2024', amount: Money(500000), paid: false),
];

const kPocketMembers = <PocketMember>[
  (name: 'Amaka', hands: 2, kyc: true),
  (name: 'David O.', hands: 1, kyc: false),
  (name: 'Sarah Bello', hands: 3, kyc: true),
];

const kPocketTopContributors = <PocketContributor>[
  (name: 'Sarah Bello', amount: Money(4500000)),
  (name: 'Amaka', amount: Money(3000000)),
  (name: 'Musa', amount: Money(2500000)),
];

const kPocketShoppingItems = <ShoppingItemView>[
  ShoppingItemView(
    id: 's1',
    name: 'Bulk Turkey (20kg)',
    category: 'Protein',
    unitPrice: Money(4500000),
    peopleSharing: 4,
    totalCost: Money(4500000),
    emoji: '🍗',
  ),
];

const kPocketPendingDonor = (name: 'Bolanle Ade', amount: Money(1000000));

const kPocketPayout = (
  bank: 'Kuda Bank',
  nuban: '**** 8291',
  holder: 'Musa Ibrahim · Primary',
);
