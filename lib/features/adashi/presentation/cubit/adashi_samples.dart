import 'package:core/core.dart';

import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

/// PLACEHOLDER data for the presentation-only phase. Replace with a use case
/// (domain) + repository (data) when those layers are built — the cubits below
/// only need to swap their source, not their shape.
abstract final class AdashiSamples {
  const AdashiSamples._();

  // Portrait URLs lifted from the design mockups (`adashi_circles`).
  static const _avatarA =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD5EQmVcF5WAnt9BhDrAD3oSwWD8VfmT2uwoN7ru5LjyBa_XCxNCydpNDbzIhdSWYZo1k0dsBLVjJ4ID-ZWs-ZZvyBgDzbIhL-YEyvwYLQCFTX_gR9Fh8fTQrdtvatvCd3fflNcYWHdIoXQzetkHc14SeqeoyvkAJgfqOjAEIggViWLDLclEm_uIn64OxtQU3s1o7iPghgWI6hCFql7EXy5vPnZ7iHutl2Vsy_enhpQcgZ-y3zalsgK06u8NZcbi4Cou_vt4WnV1Cw';
  static const _avatarB =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBc8q6D3yTKoltFToy9zdTQpArk8xbsx8leVwpD-XPxVuWv1eDKalhT9T0K-iaxlvNp4UFNEPQwpf1PKrEIDWP5YlaURbIMLqH_Mk07LSyCLKf9OC6p4Z9CoEvtdhjRCLkfdkY7AOs5y_jl3nA-2DBuXP3F8n2iOlHj4IVBC1P5H3C4HAiRNRzo2RrVNl4-6nkj7DcechWO6b5oU-jNkl9c1wIwwRMZApqvM0p5TXRFMcxZH1Vbvd7MsX51zpNUFS0J4V5xv_kZMtw';
  static const _avatarC =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAr7v4fQnB_fbP7JLc47ik8C4VVXqwuJnsTpokJ3QGhppCt-eKk_3bQpw6WFNYlsLraMjK29BE9n4KT8x8RqwTGOCj5JppZvvWj7bOGYYRbdyqoAxspOO3YMtNwH7Xe2jQGRwX5l9UEMeRNrsW-y2dF43gfxXhBQbBwxg-NAXHRe22n3XrHFTXyVQXyY-IkM9MeZNhjWTMEa4BafYkXmOIFPRj4Sa88jmcXiKLInvDqHhdhARhlMh1DosminEa_MnQ3_Dd1n23NvUE';

  static const _avatars = [_avatarA, _avatarB, _avatarC];

  /// Signed-in user's portrait shown in the phone app bar (design `adashi_circles`).
  static const appBarAvatar =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDs_notrfysUrqYhGO8ReBD84wFUnrkbUhTePNCAjdZsIUIyFqmHkKrQWykzVCmuH7zmo0hkATKk0qzw8wm3T8fR8P0gAhPcX3xrHXzk9-0TnRfbCENn5opUTIhdPex00Og8YqOkZ6fPkzhLMJBPTe8gX6AJjILmErcy0SO4rn7MZGKMXJBT6B9hudARqrcfO-WMRALZDUr2FJIpXZ1F9FAGPKZB5oKZpwXyXs9Hq5unIgJt6LTcgyxV3nLHsGxnzanulAVvWJkj68';

  static List<AdashiSummaryView> list() => const [
    AdashiSummaryView(
      id: 'a1',
      name: 'Market Women Union',
      perCycle: Money(1000000),
      memberCount: 8,
      currentCycle: 2,
      totalCycles: 8,
      mode: RotationMode.auto,
      frequency: AdashiFrequency.weekly,
      category: AdashiCategory.market,
      nextPayoutDays: 5,
      memberAvatarUrls: _avatars,
    ),
    AdashiSummaryView(
      id: 'a2',
      name: 'Founders Thrift',
      perCycle: Money(5000000),
      memberCount: 12,
      currentCycle: 5,
      totalCycles: 12,
      mode: RotationMode.manual,
      frequency: AdashiFrequency.monthly,
      category: AdashiCategory.business,
      nextPayoutDays: 12,
      memberAvatarUrls: _avatars,
    ),
    AdashiSummaryView(
      id: 'a3',
      name: 'Family Dream Home',
      perCycle: Money(5000000),
      memberCount: 12,
      currentCycle: 4,
      totalCycles: 12,
      mode: RotationMode.auto,
      frequency: AdashiFrequency.weekly,
      category: AdashiCategory.home,
      nextPayoutDays: 3,
      memberAvatarUrls: _avatars,
    ),
    AdashiSummaryView(
      id: 'a4',
      name: 'MBA Savings',
      perCycle: Money(1500000),
      memberCount: 24,
      currentCycle: 2,
      totalCycles: 24,
      mode: RotationMode.manual,
      frequency: AdashiFrequency.weekly,
      category: AdashiCategory.education,
      nextPayoutDays: 5,
      memberAvatarUrls: _avatars,
    ),
  ];

  static AdashiDetailView? detail(String id) {
    final summary = list()
        .where((a) => a.id == id)
        .cast<AdashiSummaryView?>()
        .firstWhere((_) => true, orElse: () => null);
    if (summary == null) return null;

    // A representative rotation matching the hub design (one received, one
    // receiving now, then the signed-in user upcoming).
    const rotation = [
      AdashiMemberView(
        id: 'm1',
        name: 'Sarah Williams',
        position: 1,
        status: RotationStatus.received,
        avatarUrl: _rotationSarah,
        dateLabel: 'Oct 12',
        amountLabel: '₦80k',
      ),
      AdashiMemberView(
        id: 'm2',
        name: 'Musa Ibrahim',
        position: 2,
        status: RotationStatus.current,
        avatarUrl: _rotationMusa,
        amountLabel: '₦80k',
      ),
      AdashiMemberView(
        id: 'm3',
        name: 'You',
        position: 3,
        status: RotationStatus.upcoming,
        dateLabel: 'Nov 12',
        isYou: true,
      ),
    ];

    return AdashiDetailView(
      summary: summary,
      rotation: rotation,
      adminName: 'Yusuf G.',
      adminAvatarUrl: _adminAvatar,
      reputation: '4.9',
      paidMembers: 6,
      collected: const Money(6000000),
      target: const Money(8000000),
      receiverName: 'Musa',
      receiverAmount: const Money(8000000),
      contributeAmount: const Money(1000000),
      payoutBank: 'GTBank •••• 8291',
      history: const [
        AdashiCycleRecord(
          label: 'Cycle 1',
          total: Money(8000000),
          closed: true,
        ),
      ],
      nextPayoutDate: 'Friday, 28th August',
      openDisputes: 1,
      disputeTitle: 'Payment Delay',
      disputeBody: 'Lola reported difficulty with the bank app transfer.',
      closedCases: '14',
      avgResolve: '4h',
      groupHealth: 'Excellent (98%)',
      totalSaved: '₦1.4M',
      securityStatus: 'Fully Insured',
    );
  }

  static const _adminAvatar =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD9B36PBDKucOBx1uano30nRkeZMgEncbgud9P49CE6DkGBfU53YDnave7YBGBXNlI5tsTuOUOuWYSIVX4ZFUmlZhk4qm-UVVopIufnHodg7q1g7wXh-00JqRudoWXYJyNxVyi9F4T2MCos-66A_omiJ3kJ_3wSFnjdE1_l9szKKbI_Q9g0hfNKlAhx1Ly4HubEGqmnZz9hsrSPPFJ2GlWecS7YMw0tyECuLcD5HEA81fzU7zogdVCec2J_IHKNS_j0lwrTMNxnCGg';
  static const _rotationSarah =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD1YH0RDHTUH4liAoeByHpzAxc50zbYKNxh9WvbbSBw0ZsIFeR2nPoGGarmDTPqy_Fgien71JTNTGxGc7wuxQA3JYY7fwbO_Q1HtTMY36yoaggHejHVcj424o-LBaK6OjvPbAbUaFl16-D3DyabAT_Ea9fXyt7ZL0-bXd6IZgHlVzQKPwbCh4RH-AeHo8307XhhTUlbkBVY-kTrS14mutsAKkCF5dBy4JLnMlNI1tbsdXYOUF_7oJe8MUlO-6HIsmm6KdQX9Nqa3sQ';
  static const _rotationMusa =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCWipjInon3w074daW7XA6UwFwQ-Ams_B38CpIfNSmtqwSC5NHat1av4nigH_myM9HgjIb4lwHAvH-K_WoORR4eTDnFb0qCQwXXirsHGxY5gcZYf7HPa9JDTR4AUTLhMBwFY0n9IBVWoom2MFpQUyeRdo2OO2EM3MStO3z_OZvjJhhuEbMDyz_K2Yc-wGsdy0eqaniTrWtWNfZ_zRDOg7mHwevrOPOqezOE7IcUtP1rzzWLuJT_AlaqQrYYMJcVpPPXl90PqdJX-0k';
}
