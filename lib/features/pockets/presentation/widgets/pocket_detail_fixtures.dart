import 'package:core/core.dart';

// PRESENTATION-ONLY placeholder data for the pocket detail hub's composed
// sections (designs `pocket_detail_hub` + `pocket_detail_hub_tablet`).
// Replaced by real cubit-backed data when the data layer lands.

typedef PocketMember = ({
  String name,
  int hands,
  bool kyc,
  bool online,
  String avatarUrl,
});
typedef PocketContributor = ({String name, Money amount, String avatarUrl});
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
const kPocketOrganiserAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuD9DRAEs-Ty6nrn5dtqplLBXtzXjI_ZR7key2Q_1Ne09YZ0ZSmDTQewXY-ANG7P7dsKETY7saqWnKicoxG9_Pd9hXoK0GEc3_de_dOTPEH_A92NI8VlLmb79vBwiazqPgOMUQgmOe3HM_9zFPB6Q_YbdvlWJP236OAj1Z0TVZTAs45-OGK8RSfXtdbNUYxU-2hTizu_9NRP5U7WdYxHSyDhi0WOV4CXFJ5ObHc-_eeDnkq5oPGDeqLR7ECJRnBy2rEGGLiU-d3j3tg';

const _amaka =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAxwCVg3jaBzPfANLucMscWVcLSnwGUZ_iq_gzeWg83QSQrmcgWYG-bB-PmA96tHPiMJXlnfv95InGg1MC0_RTQOP2eLSpiLO6xsEp79UDC_rW2-Mp6wgAjFyAG3lyjb3-8jTkjrfHPyyE9b8YTj5nMmh7MP64_edCU2JXl4ZcuLh4mzcVwn6L7lLwqM_Rv8OEHBROoGh_p6BkJqw3WC3XVrV5qPaNGZlzIoXoCOo2ll5ReBg3C3RXBg2ldWUps3V1psxU6_LcWAoM';
const _david =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuDb19V-nyvhDuNoyoud_yYmrCZyobcWafw3mMoHCL8Fwbnr7wjcowYrz_U4vQ1drx79FO-G7T0zsmKwHLdq4mdKnJq1y8R6P6BjKqp_TvThYZ9geg_yNoFXU7q8mrrn9JkJPWD5WgexpGRJvFfv-rg2HfUf24dr2QfTVw0AJHgevtm-OlrWiXLt_6hgwCHTAI6jvXlUnNxCEOXtxx2kdFjyfSqx1c0m6onIV8CqL62KJJ_ni5-_H4IwBLOiGrACjFaWbtS6yi8ZQfw';
const _sarah =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBYCY_gKrW5QdX2zgIjgk6x5r-IG6uK2BSTyWSaJ350vx5eiQuiYc5i9odT_8V-pPj4FYfuQNnsemG_iWNOhuxdnRXcxXoR4U40wOjB7in_6l7pHD2aoOblOGHc_e78Oy2Ok_03gujThRIpdZh7VQea-qGO-lS_hKd6C-KukFtuxiorAN1LeO-XwTaQJUZD0dUFb8QiJDp7plNbD2jvX3DPfq5OXAeWYN10udks-My4Wu5Bcqh3Vvk35_Af_w9fqRJUK4nxAcJ1OUU';

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
  (name: 'Amaka', hands: 2, kyc: true, online: true, avatarUrl: _amaka),
  (name: 'David O.', hands: 1, kyc: false, online: false, avatarUrl: _david),
  (name: 'Sarah Bello', hands: 3, kyc: true, online: true, avatarUrl: _sarah),
];

const kPocketTopContributors = <PocketContributor>[
  (name: 'Sarah Bello', amount: Money(4500000), avatarUrl: _sarah),
  (name: 'Amaka', amount: Money(3000000), avatarUrl: _amaka),
  (name: 'Musa', amount: Money(2500000), avatarUrl: kPocketOrganiserAvatar),
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
