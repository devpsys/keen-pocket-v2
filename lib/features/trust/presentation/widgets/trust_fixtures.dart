import 'package:flutter/material.dart';

// PRESENTATION-ONLY data for the trust screens (design `I_trust_layer`).

/// A rating in the tablet hub feed (design `reputation_trust_hub_tablet`).
class TrustHubRating {
  const TrustHubRating({
    required this.author,
    required this.group,
    required this.comment,
    required this.avatarUrl,
    this.tags = const [],
    this.stars = 5,
  });

  final String author;
  final String group;
  final String comment;
  final String avatarUrl;
  final List<String> tags;
  final int stars;
}

/// A "Top Trust Factor" chip.
class TrustFactor {
  const TrustFactor({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// Robot/mascot illustration for the KYC tablet hero (design `kyc_verification_tablet`).
const kKycRobotUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBCZDWw6-Rl0TfB8TNGPb4xFm770ijLlhtpmZ1zwBeamjQdDmVN0z9A8j_YsUff6OfQvYZiK3iXmJxle6hOMkmmaH3YSfZzyHsXOBNkbPo7YrMASqm63wYtkQE8on-2EwWbqBCWYB1ecRWTBBA1-vJRWPWCcINIy8W5SaAoOcHZ5-AfUQ97KmtdrAeQWX-4b5AraKfXcbK148sfjLwPE73z53oBzTvHKENuSlZ_Cp7Z1mMEM3XNmxFfy7OHyeo_wF7WvWZQXyS4z-U';

/// Hub gauge + reliability headline figures.
const kTrustHubGauge = '942';
const kTrustHubConsistency = 0.992;
const kTrustHubGroupsJoined = 24;
const kTrustHubCompleted = 24;

/// The viewed member's app-bar / profile avatar.
const kTrustAvatarUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDjDKsLw2rN6thhRpxeLZCxCiSAnH4K_S5yZqOzEoyT9-C_bPM2K6_ETb4IADeI_-pDugglDAVL8r3LKJ_dYVnP1np2iYwUaSIDgK8SiOHujnWg9damOkAXCxi9Kb7rFxWhEz1SBHVlc1-CH_JOuKCBhAn5eidwysP6L3NFxoRUeAx91meTauiV29PDqGhi1V6yPQUPcIawsIrXyTFD-YP2L3SNUsG6cxhMJGJ7gwFbkUUHBcMMTzpy1pwDpdK1FqJEzZwwdgAIzZE';

/// Rater avatars used in the recent-ratings list.
const kTrustRaterAvatars = <String>[
  'https://lh3.googleusercontent.com/aida-public/AB6AXuChzcvRj8VCvJN0y-zvuzFpg0IHgZN3fDHVeJlHxOA64h2Jvqj3JabO67KCCdZDuPUOjSzj9uz7mMziqJh0IalfT7EjYa7Q03qKtejwBKg5mHr_hmIsmSEA5WyFktcwb6M14lEhdXmrOmn8n0c_B6yO0nZBpGPhJr9hjQhul8YYuMdwe-gOgSSHjmtYA54IJNduvFzFxnhuxq0hzgYW2tI7II_e20neOiqPfXPpONVu_x6rCSM9bTUHyKhP2vMzUEFZNu5rHWMh644',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuDrDmsCCUgv_1sjm9qactYEFXUNRweIjUHS_sC3309NlQ7WmL2MkqGgaXvbMoImS1oEH12jT0DKhO9ctxTiqELMuJMUc6iBEfZv3aMQxqCDso9H_oKwZpVn3fEy_ZWHAl-hSy0nVIqAfX5WrBEOXHd71qI8IM1YExc3fbIrJjwcE0wllK5P6DjAf-Un806K9qNmnKgwKmgNylniuOLB5zPBvKpShPfpagrkonUgqzofepZLWYjfOAo8Ykxy7yHwCnlHYAUilwqTTIU',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuCUDoh73WAclW7LAJh9If3-HBWjxNM9HUn-b0AyrRK0-fbEU9C8j0BDA4d-D6C8u47aA3NqAvfXb4wmMPlRxBIR5ucPsVZGKR8u_KywDquT7bBM1FwKfat8SN0CoO7xMIUWJ-enlUjOMnSSkoXoPMKrXJXr_WcpTnwOxJ1L1aCUcpe8RNjruQgF-TkF5dY_kJ7tzQ2SlKkUcWCkz7QmHO-QbejoDOdtjgC0uzx9Wv3fSnaEt0K-dOgYjM86TnT-5WLgAzFTcp23ew8',
];

/// Hub recent-ratings feed (design `reputation_trust_hub_tablet`).
final kTrustHubRatings = <TrustHubRating>[
  TrustHubRating(
    author: 'Jessica D.',
    group: 'Lagos Business Circle',
    comment:
        '"Alex is incredibly reliable. Always makes contributions ahead of '
        'schedule. A true pleasure to have in our Adashi group!"',
    avatarUrl: kTrustRaterAvatars[0],
    tags: const ['Punctual', 'Communicative'],
  ),
  TrustHubRating(
    author: 'Marcus K.',
    group: 'Family Savings Pocket',
    comment:
        '"Never had a single issue in 12 months. Alex helps keep the group '
        'morale high with consistency."',
    avatarUrl: kTrustRaterAvatars[1],
  ),
];
