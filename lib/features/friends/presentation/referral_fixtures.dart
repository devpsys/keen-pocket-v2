import 'package:keenpockets/features/friends/presentation/view_models/referral_view.dart';

/// PRESENTATION-ONLY sample referral data (designs `refer_earn` / `_tablet`).
/// Swap for a real referrals feed when the backend exists.

const kReferralInviteLink = 'keenpocket.app/ref/kevin9921';
const kReferralCode = 'KEEN-9921';
const kReferralInvited = 8;
const kReferralQualified = 3;
const kReferralRewarded = 1;

/// Celebratory Mr. K shown in the hero.
const kReferralMascotUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCcrfHdTXioiwdyLFZ-xf4Wme4MYXQZyqovQBSQptOVt_VMDMVzXs237Is3qnsc0fQZwC-AZR2dFMVnKBJq5P2Rl9juPz4lQ36bLj9ApvmyqwMOXKUbsfcA0DaJz-1CDasXjJS0cfc9QDEvLjZFHuhZMR6bFmdDY9FHgtN1ratXoCZ1dfWyMea3-GsDmxJmb5o9yd-R7ivVOJCDWNC7_HaRhE0chTwIEzp2O7A2mrrwiN6y2UBK7WEC-SFmxvfd6aEI7z9G1PR4jzs';

/// Signed-in user's photo shown in the app bar.
const kReferralUserAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuA0FJk544eJGSunS_bb5w4jXKXjGksePM5P4oSXAc8slfWPurE8vhprCv9cAQNGSr_pg5e6fxMguh3Tk_Ecp9kC0tUKrDVijJfRGrPFICaAS2KJ7LEucAQG6j9QroeEldNUEMz6R5riejqMLknVSUIhQzft75JjRsxkG2lOmqL3vhtu_wkYJHa-2ZX8Dv1CppPZtKgtGdEd1aRmsqA6-yMtVNw0UqES7_wKM-GNIwHBN7b8Q3APuIc8bP3sgCN866h85NFo9fpa6DE';

const kReferralCircle = <ReferralView>[
  ReferralView(
    id: 'r1',
    name: 'Tunde Adebayo',
    joinedLabel: 'Joined 2 days ago',
    status: ReferralStatus.pending,
    detail: 'Pending account setup',
  ),
  ReferralView(
    id: 'r2',
    name: 'Chidi Okoro',
    joinedLabel: 'Joined 5 days ago',
    status: ReferralStatus.qualified,
    detail: 'First deposit made',
  ),
  ReferralView(
    id: 'r3',
    name: 'Sarah Williams',
    joinedLabel: 'Joined 1 week ago',
    status: ReferralStatus.rewarded,
    detail: 'Rewards paid out',
    rewardAmount: '50 keens',
  ),
];
