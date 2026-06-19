import 'package:flutter/material.dart';

// PRESENTATION-ONLY placeholder data for the public profile screen
// (design `public_profile`). Portrait URLs come straight from the mockup.

typedef PublicGroup = ({
  String name,
  String description,
  IconData icon,
  bool isAdashi,
  double? progress,
  String? fundingLabel,
  List<String> memberInitials,
  int extraMembers,
});

typedef PublicRating = ({
  String author,
  int stars,
  String body,
  String avatarUrl,
});

const kPublicName = 'Amaka';
const kPublicSubtitle = 'Financial Pioneer • Lagos, Nigeria';
const kPublicTrustValue = 1.0;
const kPublicBadges = <String>['Reliable Payer', 'Top Organizer'];
const kPublicRating = '4.9';
const kPublicGroupsCount = '24';
const kPublicTrust = '100%';

const kPublicAvatarUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAE6RROqigfn2GvYhv4F8KRIPNszrPvdhmM6NcxMeSAFgGI_-4PUvg7Bdsbe-UR0O3ZZEKY-p0_k0klKUeUPLxQh4hcR8S_WuOxepJOUQou6wVj1CV0yGHPuxNPVpv1s047ZzNfIeqybiiE6HciBON9uSyO_VG5KziRZGSM7kE8UeLFLRl-UwsAiJbqycbUriGUAgEu_49FWio06DdgRGWedrskmRTC3ubvetcu5GwHQIRU5gPvC55HC0CdG6Hr37VMDrjoYjdcr7I';

const kPublicGroups = <PublicGroup>[
  (
    name: 'Decentralized Vacay',
    description: 'Saving for a group trip to Zanzibar. 12 members active.',
    icon: Icons.savings_rounded,
    isAdashi: false,
    progress: 0.75,
    fundingLabel: '₦1.2M / ₦1.5M',
    memberInitials: <String>[],
    extraMembers: 0,
  ),
  (
    name: 'Yaba Tech Founders',
    description:
        'Monthly contribution circle for tech equipment. Next payout in 3 days.',
    icon: Icons.group_work_rounded,
    isAdashi: true,
    progress: null,
    fundingLabel: null,
    memberInitials: <String>['A', 'J', 'M'],
    extraMembers: 5,
  ),
];

const kPublicRatings = <PublicRating>[
  (
    author: 'Tunde O.',
    stars: 5,
    body:
        'Amaka is an excellent circle lead. Very transparent with the adashi funds and always keeps everyone updated. Highly recommend joining her groups!',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCwbF0nKAcri-nRJLB0LOHIzf4Yy43Kkz4DJmfNzuZUArH7XNohUNJXEVzOuu9Am9WQ3OdRk1coDQR-xxa2r2FTiAzAr3BDcACOUtgk-nf-1fXiqtFJRqozHZGifXtAUDbpUqMu-28mnzyTzb9aKh1DacIUj9409DNWJiCKMFAZjaEOV3bqJ5yUhbTq3JoyZXQFbyVLkb3VRMKgRu2dJkiZfshkZoiXrKN3Fzcs__yVEe_-tNnOa88JJD71aotNVQJ9E0g92NKCn8w',
  ),
  (
    author: 'Sarah K.',
    stars: 4,
    body:
        'Great experience saving for the vacay pocket. Reliable and very communicative.',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCytj3bW-NVHXZOlnv3_D2jkL7XvZCMWzhzCP9zP5kqSWgOWHpuEcgcJH993K9Dj1Eyx5qafuSWQrMKpb66fmS1dQrgipNKIzFNtQPBRRkMAD3RktmyB7BNJoSwiI4HDjFO4AcRxkcoitEHLcLjSxS-YhKT1tY-68Af7NJ4c-aT9inG7NCSdWIPqs_ke-oJ0HYm2D8L6JikxoZmMGJaRxOv7H2beMrde0FgoZ1YcehI4WNLgkTxFNuC25l5pBj0KVPIuvsmNWF_DaQ',
  ),
];
