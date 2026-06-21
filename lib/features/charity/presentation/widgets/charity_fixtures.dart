import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// PRESENTATION-ONLY view models + samples for the charity drive screens
/// (designs `charity_donate_card` / `charity_setup`). Replaced by real data later.

/// Accent palette for a resource bar / donor chip.
enum CharityTint { primary, gold, coral }

extension CharityTintColors on CharityTint {
  Color fill(BuildContext context) => switch (this) {
    CharityTint.primary => context.colorScheme.primaryContainer,
    CharityTint.gold => KpColors.gold500,
    CharityTint.coral => KpColors.tertiary300,
  };

  Color container(BuildContext context) => switch (this) {
    CharityTint.primary => KpColors.brand100,
    CharityTint.gold => KpColors.gold100,
    CharityTint.coral => KpColors.tertiary100,
  };

  Color onContainer(BuildContext context) => switch (this) {
    CharityTint.primary => context.colorScheme.primary,
    CharityTint.gold => KpColors.gold600,
    CharityTint.coral => KpColors.tertiary500,
  };
}

/// A non-cash goal line (food packs, blankets …).
class CharityResourceItem {
  const CharityResourceItem({
    required this.name,
    required this.icon,
    required this.current,
    required this.target,
    required this.tint,
  });

  final String name;
  final IconData icon;
  final int current;
  final int target;
  final CharityTint tint;

  double get progress => target == 0 ? 0 : (current / target).clamp(0, 1);
}

/// An anonymised recent donation shown in the breakdown.
class CharityContribution {
  const CharityContribution({
    required this.initial,
    required this.maskedName,
    required this.valueLabel,
    required this.tint,
  });

  final String initial;
  final String maskedName;
  final String valueLabel;
  final CharityTint tint;
}

const kCharityResources = <CharityResourceItem>[
  CharityResourceItem(
    name: 'Food Packs',
    icon: Icons.lunch_dining_rounded,
    current: 30,
    target: 100,
    tint: CharityTint.gold,
  ),
  CharityResourceItem(
    name: 'Blankets',
    icon: Icons.bed_rounded,
    current: 15,
    target: 50,
    tint: CharityTint.coral,
  ),
];

final kCharityContributions = <CharityContribution>[
  CharityContribution(
    initial: 'A',
    maskedName: 'A***',
    valueLabel: Money.naira(5000).format(),
    tint: CharityTint.primary,
  ),
  const CharityContribution(
    initial: 'J',
    maskedName: 'J***',
    valueLabel: '10 Food Packs',
    tint: CharityTint.gold,
  ),
  CharityContribution(
    initial: 'M',
    maskedName: 'M***',
    valueLabel: Money.naira(20000).format(),
    tint: CharityTint.coral,
  ),
];

/// Resource bento values shown on the tablet hero (design `_tablet`).
const kCharityResourcesTablet = <CharityResourceItem>[
  CharityResourceItem(
    name: 'Food Packs',
    icon: Icons.lunch_dining_rounded,
    current: 750,
    target: 1000,
    tint: CharityTint.gold,
  ),
  CharityResourceItem(
    name: 'Blankets',
    icon: Icons.bed_rounded,
    current: 200,
    target: 500,
    tint: CharityTint.coral,
  ),
];

/// A named "Recent Hero" (tablet donate list).
class CharityHeroEntry {
  const CharityHeroEntry({
    required this.initial,
    required this.name,
    required this.message,
    required this.valueLabel,
    required this.timeAgo,
    required this.tint,
    this.isResource = false,
  });

  final String initial;
  final String name;
  final String message;
  final String valueLabel;
  final String timeAgo;
  final CharityTint tint;
  final bool isResource;
}

final kCharityHeroes = <CharityHeroEntry>[
  CharityHeroEntry(
    initial: 'S',
    name: 'Sarah Johnson',
    message: '"Sending love and strength!"',
    valueLabel: Money.naira(25000).format(),
    timeAgo: '2m ago',
    tint: CharityTint.gold,
  ),
  const CharityHeroEntry(
    initial: 'M',
    name: 'Marcus K.',
    message: 'Pledged 10 Blankets',
    valueLabel: '',
    timeAgo: '15m ago',
    tint: CharityTint.primary,
    isResource: true,
  ),
  CharityHeroEntry(
    initial: 'L',
    name: 'Linda Wu',
    message: '"Happy to help out."',
    valueLabel: Money.naira(5000).format(),
    timeAgo: '1h ago',
    tint: CharityTint.coral,
  ),
];

/// Quick-add donation amounts (tablet contribution panel).
const kCharityQuickAdds = <int>[1000, 5000, 10000, 50000];

/// App-bar avatar from the design.
const kCharityAvatarUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCOPbygJ8zTAspTSumzlnIG5P6EBS3V-ntMGVHJIbThk_Qhe84dr5qWVhd9e3D-SJYe9EKoxh0x86gIs5RiLk-QXW8vOS1oVhTlVHlw_2kKbTmRjYqyTCT3l1J9NMTKxGg4gQns7hRnini-xMLhHewhtphs-q8gpUqwofI_tNCfXt-8z3ALs_147ZQUkSas7a-FKkjKeOiL6ntW3AGfrPCvc3c9h-eRrlHH-HSqOiTYhc1zGSawCktGwLnLXyNU38LVTXinucIRovs';
