/// PRESENTATION-ONLY sample data for the tablet group-chat dashboard
/// (design `group_chat_tablet`): the conversation list, members, vital stats
/// and shared-media rails. Swap for real data when the chat backend exists.
library;

// Hosted portraits reused by the chat area's incoming bubbles.
const kGroupChatSarahAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDtrzB69jPzU4kZeVGW8s1TSk6JYsHmi22409qR0tqcRKoAqMOzHsYEmtmuehSiPbz2IO3lnCIxsgFB3ZiMFHckXfdztRyWzAgnC1EtHa3XSlIX3mTNTjBGXpMZJODxwVC7gbj4zb4PDjCxDSDPj98TSVmb1AAdgnkgZZPepDhLeMLu9xYHrKqcGiueS0BgojjJb2Ilf87m-xbN2HffLb_crF2r7E0EnqF2lRC6PLA19b4OQqy1LKHIjQiPkgwznv7rVKJ0hZ27aSI';
const kGroupChatMarcusAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuB-YLh3hQiyVJU87xXgZgx1vQpLiAq0PNQDX5GhgcHFbETMAPWKrBvdT-6WhLcyehGMVDCSQLW8QsIlvxes1JK717FUkOxi_RHiazxFP9qhGcDes0Twa7Vi9o5d7AJPpSwOUm5-J-SPJVnCzUhbhUVD7wqRhdxjbYDrDXsltfQG6fyh9pCAn4TicbIZ-WfgMcLqXA4eHDApGvmsJ2aRPRg6Exwpde6m6gF_OVsLQWEBTD_ZBEZflwo1mBpmVTAv6TzTjfOWya9LpE';

/// A conversation in the left-hand chat list.
class ChatThread {
  const ChatThread({
    required this.id,
    required this.title,
    required this.preview,
    required this.time,
    required this.avatarUrl,
    this.unread = 0,
    this.active = false,
  });

  final String id;
  final String title;
  final String preview;
  final String time;
  final String avatarUrl;
  final int unread;
  final bool active;
}

const kGroupChatThreads = <ChatThread>[
  ChatThread(
    id: 'vacation',
    title: 'Vacation Goal 🌴',
    preview: 'Ade: Just hit my weekly target! 🎉',
    time: '10:42 AM',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBfVSKsF1LZqOx2Y4pwbVM0mDVRKDPi300jEdYjCXtPYCXIyDWglK2OimcZmLf8l3E4kEKuLq3agFAvUkrwej0tw1yFVp6087fK-RdTOXsswIpiqQwvmsk-Nm1Mq2u0MuoCZDwnVtoyyymZwWVNN4jUnot7OA2xP7uGoZSEbruZcFAwyvEIefgJRYNEKmf-IZyUq8liZsP8l8FqE81GnTPf0Zd5je1fuFLfjf7NLMSf_QxsroKGzh88B8cgCCYQEIO8QYCtC9bePBM',
    unread: 3,
    active: true,
  ),
  ChatThread(
    id: 'family',
    title: 'Family Savings',
    preview: "Mom: Who's next in the rotation?",
    time: 'Yesterday',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuD9Cs-3ak_YpELVhA4wUxUCZ429g0ol2efJPLNHSHR-2I4s5NHi68Ax4XvJ41CGlIXXIA1x4kbkK5SyxikccuNfv7uUi-9ajK-ybtcW9oxROi6jRIV3AM_PMu4yUL7xbxW0UktamibGfe42RIzkHKPmjGVN6bV9NH080gXU9AZggWoUMcnTxv8OORYGpe_7puqzbM9B-gHblFZK0v8TVnMmclzVhADokOc084_DGCiwtUjUuWSo6W2Q6E10jMxtyk7Dx4yTc5QYMGM',
  ),
  ChatThread(
    id: 'office',
    title: 'Office Coffee Club',
    preview: 'Sam: Espresso machine fund reached!',
    time: 'Tue',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCGHwRjIuxJGW8tmC4J-V4yOGAkPEwCYgcQpXsqhESw6_QVObPvR64xoGl2PMDaCrR5qPDPjgkVpoXr_6skKYrIGD28U-GY2vR_2hbpeAKjcWgwnpwUMjspqFBQoWFDKxQy4tKkHD2uKiQFqsZNDDFcycIVmBGTYqykUda6bPEXZtY-3tSSDcwhMzoC_tIeV6yJ_bfSveevMVRFtuV8FPZkVR33rbkx5FK_mgq15A7QuF372_AdYHKagkw2Kc11aFs6Tw',
  ),
];

/// The active thread's header line ("8 Members • ₦2,450 / ₦5,000").
const kGroupChatActiveTitle = 'Vacation Goal 🌴';
const kGroupChatActiveSubtitle = '8 Members • ₦2,450 / ₦5,000';

// ── Right rail: Circle Vital Stats ──────────────────────────────────────────
const kGroupChatPayoutProgress = 0.49;
const kGroupChatNextName = 'Marcus Wright';
const kGroupChatNextPayout = 'Payout: Oct 15th';
const kGroupChatNextAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBWeJHi_S9t2_L7sSUQqGDHdyzKeYnLGygy79mcRxJizRVtWdhbezb7bLNObQxEAQcxo_ZqqT35Hi-eaD5XqSm4xZBuuajQbOJ0_j2iPdtX7nMVPzStityXJyojIsVhUecDlJfCFHOcmbsNeJ315VNwWJNx-hIC2uafjTsDKBWfjyRvY0nyzqWOgMkhRVOGl47UByckmuelD-Lyxz-WgPtWC2fH9OTn1mb1lhAgil6VbrwqX4swuwvPk0fmYFiq-VE3tQNDPOVOxEI';

/// A member in the right-rail roster.
class GroupMember {
  const GroupMember({
    required this.name,
    this.avatarUrl,
    this.initial,
    this.online = false,
  });

  final String name;
  final String? avatarUrl;
  final String? initial; // shown when there is no avatar (e.g. "You")
  final bool online;
}

const kGroupChatMembers = <GroupMember>[
  GroupMember(name: 'You (Admin)', initial: 'Y', online: true),
  GroupMember(
    name: 'Ade Bolaji',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuB4OvkbHCAOj4nowyyHo2T6iyZx5-bmg5axkBq6eQg49Im0enk-mImldppUFZi4QV5nTwyTtP1DQxsNqHJD3-ksWmzDGEuAmmNKgQBYfM79zB8UQOcYdqK_di60HD7aqYj3X8_PDEVMAxyCFGMhf8VesCcPgWXLx-rwnI4GhtlTEKntzDMOaiblKjBftJE4MPqtXQWOB_iF4Llvk8VTnD-7UuQXDCqSDVQJJEC2lPJm3ermz3dqAg9JfOxqDgmeAZ2IvzUAN6gsOe8',
    online: true,
  ),
  GroupMember(
    name: 'Sarah Chen',
    avatarUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCh-PmA_D6arZ8C5STUiMYGSxC0T48e1HVdBS4kQTgMFg2s8i87K0GoK2phC78psfvLElKssLIYdr3rA8GxiPMcE3CdELVJ3lNS-JMgiz6DYxCiBgLnqerIeuolJ7osuAAuDbkjGvlMF0AtF4_J_wQxoS3QAnr7kwhCoFsnVoCn2TwHuilOrxKiJJlcvL9v8Ufz9mt0Ezias4Uda3VQLPNi0JVZxqSuCP6_AdOcOPkW_VtzgjSyjpuCQPXIVC-4mGVhWwZd3XfcFUE',
  ),
];

// ── Right rail: Shared Media ────────────────────────────────────────────────
const kGroupChatMedia = <String>[
  'https://lh3.googleusercontent.com/aida-public/AB6AXuAzquKOs1_K0PeIfxAjKUTYdxDRXb7YTZqIHxn_pB7xlM3-G9IhTg7wLu1XR65xEeRIFNmjVIpC74kAwLf8PcfwMNV0bJZWA1GKTagVQ806ISiRezmRsPnR2tqg6xNBq03wK4Y2DuBiIq6JlwGYfFJA-Cc7oZNKiDxfOUdsPH0DsDvVmK68WJewwwon2xs6zy653FIgsK3cyR4XlYDZZJZv2wQ7n9eFnAfIG0vyIR6kCziFxvKV2Sf6dMEFNJprWh9SbHaQWZMVU1U',
  'https://lh3.googleusercontent.com/aida-public/AB6AXuDD8P2GTLF_6KQ-pgx_nNjyqR3AasnYS84h0u15AlXph9iMsU4KsPFxm90UwKJ5qE44ekH8V_-iRENMItGwsqWXzNDztfyERGbpKtfDL0ON-5Gs3gspPii0Eu2MNPlfeI7C-yoPa_J-_WU4me_U3BtjCsy2qeaHfTIt58Ebs8wuWKSNidW1UvYsPiG7wEqhCbsrrlG4MBLzaM6YnDsd5K0GDzkoTnekWZwPvsh92srilY40Mh9ZQjKjqxxiI6Lz7DV1JHR4Fr9c-lk',
];
const kGroupChatMediaMore = 12;
