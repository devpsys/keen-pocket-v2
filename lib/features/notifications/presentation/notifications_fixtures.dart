import 'package:keenpockets/features/notifications/presentation/view_models/notification_view.dart';

/// PRESENTATION-ONLY sample inbox (designs `notifications_inbox` /
/// `_tablet`). Swap for a real feed when the backend exists.

/// Signed-in user's photo shown in the inbox app bar.
const kNotificationsUserAvatar =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuBBS6k8mu1bF9eiw9P8dvcyGhLaL6psmmx5zoLlNZd-cwM8mUWm47MzwbD5VY_prNJsPaDJJCG24oePptUUG8Eyqna_WMYstEWMLesgfbd7Oa1ikFI5z8-0DL0Q9sZbW1rAxMjqcQ9DkNx202gTZ8mBdaC4XLcgv7Rf1H-CeznXslcDX97g_YWDxr0BqCTo6LTCmlKR2QIxvFhchyfJaYPbCCSZzBn28Qd1oCejtqBVDKUDU9QT6rybILal3V95zNUP_-slVY_uIaY';

const _kPocketImage =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAxukulUb_RQ90ZsohU8h73HwOVL1ABclSM4Jp76N9uM8QRqtRBAg5WVhNdNjXRrc-LNkU0_kCj8QRSvrXvnZeeCBGBe6f0q4ljYgzn_BFWxxfsJFOI88jgsvWaSjw-nw02bGeGdgS_XAfueU6QpTNtcvwKhIQihVKFKxy_hP-3dHz_ieGmLJ3vocNimd0CBu9XFDD8S_Xt6ZJtKF3JVu2A5wKlsVch1T3q0HD2Psnkv3ZNObaScsDmPbjowpszTIzkJ8_3-aBOePw';

const kNotifications = <NotificationView>[
  NotificationView(
    id: 'n1',
    kind: NotificationKind.payment,
    title: 'Payment Success',
    body: "Your contribution to 'Summer Vibes' was successfully processed.",
    timeAgo: '2m ago',
    isRead: false,
    dateLabel: 'Oct 24, 2023 • 10:32 AM',
    category: 'TRANSACTION',
    detailBody:
        'Great news! Your scheduled contribution of ₦250.00 to the '
        '"Summer Vibes Beach House" Pocket has been successfully processed. '
        'Your total balance in this pocket is now ₦2,450.00. You are '
        'currently 82% of the way to your goal! Keep up the great momentum.',
    goalPercent: 0.82,
    savedLabel: '₦2,450.00 saved',
    targetLabel: 'Target: ₦3,000.00',
    relatedPocket: 'Summer Vibes',
    relatedPocketImageUrl: _kPocketImage,
    sourceAccount: 'Main Wallet (*8821)',
    mascotTip:
        "You're saving faster than 90% of users this month! Want to "
        'increase your weekly goal by ₦10 to finish even earlier?',
  ),
  NotificationView(
    id: 'n2',
    kind: NotificationKind.member,
    title: 'New Member Joined',
    body: "Sarah joined your 'Weekend Trip' Pocket group.",
    timeAgo: '45m ago',
    isRead: false,
    dateLabel: 'Oct 24, 2023 • 09:15 AM',
    category: 'POCKET',
    detailBody:
        "Sarah Chen accepted your invite and joined the 'Weekend Trip' "
        'Pocket. The group now has 6 members saving towards the goal.',
  ),
  NotificationView(
    id: 'n3',
    kind: NotificationKind.invite,
    title: 'New Invite',
    body: "Jake invited you to collaborate on 'Groceries'.",
    timeAgo: '2h ago',
    isRead: false,
    dateLabel: 'Oct 24, 2023 • 07:48 AM',
    category: 'INVITE',
    detailBody:
        "Jake Morrison invited you to collaborate on the 'Groceries' "
        'shared Pocket. Accept to start contributing together.',
  ),
  NotificationView(
    id: 'n4',
    kind: NotificationKind.security,
    title: 'Security Alert',
    body: 'New login detected from Safari on iPad.',
    timeAgo: '4h ago',
    isRead: true,
    dateLabel: 'Oct 24, 2023 • 05:30 AM',
    category: 'SECURITY',
    detailBody:
        'A new login to your account was detected from Safari on iPad. '
        "If this wasn't you, secure your account immediately.",
  ),
  NotificationView(
    id: 'n5',
    kind: NotificationKind.reminder,
    title: 'Payment Reminder',
    body: "Don't forget to settle your 'Electric Bill' pocket.",
    timeAgo: 'Yesterday',
    isRead: true,
    dateLabel: 'Oct 23, 2023 • 06:00 PM',
    category: 'REMINDER',
    detailBody:
        "Your 'Electric Bill' pocket is due in 2 days. Top up now to stay "
        'on track and avoid a late settlement.',
  ),
];
