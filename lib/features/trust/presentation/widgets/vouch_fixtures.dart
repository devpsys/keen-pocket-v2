// PRESENTATION-ONLY vouch-request data (design `vouches_inbox` / `_tablet`).

/// A vouch request's review status.
enum VouchStatus { pending, recommended }

/// An incoming request from a member wanting to join a pocket.
class VouchRequest {
  const VouchRequest({
    required this.name,
    required this.avatarUrl,
    required this.reputation,
    required this.pocket,
    required this.status,
    required this.note,
    this.timeAgo = '',
    this.location = '',
    this.memberSince = '',
    this.tags = const [],
    this.vouchedCount = 0,
    this.mutualConnections = 0,
    this.savingConsistency = 0,
    this.activeGroups = 0,
  });

  final String name;
  final String avatarUrl;
  final int reputation; // 0..1000
  final String pocket;
  final VouchStatus status;
  final String note;

  // Tablet detail extras.
  final String timeAgo;
  final String location;
  final String memberSince;
  final List<String> tags;
  final int vouchedCount;
  final int mutualConnections;
  final double savingConsistency; // 0..1
  final int activeGroups;
}

const _avatars = <String>[
  'https://lh3.googleusercontent.com/aida-public/AB6AXuD4PVvOia7qXoya9BOMfzCQGlVC6HkphT8OJMsP3h3mcOxfllTz-oY7B276wBM1WLVaPdkZPJZVndmcns2cVI_8WsfbNIzmAGmN2dCM5Vx0_mje9WlTymIkshVJ6ZLrLRy28dzMO2ImB-YDye6H8x4PUm0c0oxRInDLTPiF7arOwXpYeI0PfcBG-NFGki3K1Kr1xgdby82DpA2Dfh0ANHfiXHUBw4lsTxk9QJxoksXdWKkJhw-jcOqEp7qXbzK5FIr6fOIPXaWO4ug',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuAruFD2VR_-HRlvE7UROklcj6EOE2sQ8JxDevf3YmyztQtpsQqiw9nTR1SC4CZm8jOcWa_j5WSfOF5QvB7O7ARjK96A01P8lahw3d7Adh5Z56Kem08Fkh3_9202u-mMB9MWizUDKMuNN4fvb82DZTUbK6Uvd00kxbRGIzSm12QuhGxi32KKefvV22b4PfbISQovNHKkYBz3oa4XgXIFM7fvIanp-0UkmvKL5r-cSUIUofJ4xozYJWAVscAAR40WmaJ6QuYtFfMX4CU',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuB2sh5XajzFkFhy2iuqyL7WRhiFE41xELBGkBzJ3MHlzqLqwC4b64htDBS4ky7UszIMQ1GVHuvoi1xxn2XIDhq2vlXfj7G2xyrkXJcMtp4I9O5NfUaW8zGNqWKv74I3wL7Wx1U2tDUPcTbRMtjlyFMJ0CYBz1qP1aOCsZrp5e-u0JPvuQzth8tgsuAtIFI0ntCNPchJytO4lWY-6x_0w0jq9uvF5uHoYnRc1dnkznvqC-9ZSDrJI68ohcfkpsxYHbIhmXtSoK0CAYM',
];

final kVouchRequests = <VouchRequest>[
  VouchRequest(
    name: 'Alex Miller',
    avatarUrl: _avatars[0],
    reputation: 85,
    pocket: 'Founders Pocket',
    status: VouchStatus.pending,
    note:
        '"Hey! I\'ve been following the KeenPocket community for a while and '
        'would love to contribute my expertise to the Founders group."',
    timeAgo: '2h ago',
    location: 'New York, NY',
    memberSince: '2022',
    tags: const ['Fintech Specialist', 'Early Adopter'],
    vouchedCount: 42,
    mutualConnections: 6,
    savingConsistency: 0.92,
    activeGroups: 3,
  ),
  VouchRequest(
    name: 'Sarah Chen',
    avatarUrl: _avatars[1],
    reputation: 92,
    pocket: 'Global Alpha',
    status: VouchStatus.recommended,
    note: '"Recommended by mutual trust circle."',
    timeAgo: '5h ago',
    location: 'Lagos, NG',
    memberSince: '2021',
    tags: const ['Top Saver'],
    vouchedCount: 58,
    mutualConnections: 9,
    savingConsistency: 0.96,
    activeGroups: 4,
  ),
  VouchRequest(
    name: 'Jason D.',
    avatarUrl: _avatars[2],
    reputation: 42,
    pocket: 'Alpha Testers',
    status: VouchStatus.pending,
    note: '',
    timeAgo: 'Yesterday',
    location: 'Austin, TX',
    memberSince: '2023',
    tags: const ['New Member'],
    vouchedCount: 4,
    mutualConnections: 1,
    savingConsistency: 0.71,
    activeGroups: 1,
  ),
];
