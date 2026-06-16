// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'KeenPockets';

  @override
  String get login => 'Log in';

  @override
  String get logout => 'Log out';

  @override
  String get submit => 'Submit';

  @override
  String get welcome => 'Welcome';

  @override
  String welcomeBack(String name) {
    return 'Welcome back, $name!';
  }

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'you@example.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get validationEmailRequired => 'Email is required.';

  @override
  String get validationEmailInvalid => 'Please enter a valid email address.';

  @override
  String get validationPasswordRequired => 'Password is required.';

  @override
  String get validationPasswordTooShort =>
      'Password must be at least 8 characters.';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorNetwork =>
      'No internet connection. Check your network and retry.';

  @override
  String get errorServer =>
      'Our servers had a problem. Please try again shortly.';

  @override
  String get errorUnauthorized =>
      'Your session has expired. Please sign in again.';

  @override
  String get errorPermission => 'You do not have permission to do that.';

  @override
  String get errorFeatureDisabled => 'This feature is coming soon.';

  @override
  String get errorCache => 'Could not read saved data.';

  @override
  String get errorValidation => 'Please correct the highlighted fields.';

  @override
  String get comingSoonTitle => 'Coming soon';

  @override
  String get comingSoonMessage =>
      'We are still building this. Check back shortly.';

  @override
  String get retry => 'Retry';

  @override
  String get emptyTitle => 'Nothing here yet';

  @override
  String get emptyMessage => 'When there is data to show, it will appear here.';

  @override
  String get loading => 'Loading…';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get profileTitle => 'Profile';

  @override
  String get pocketsTitle => 'Pockets';

  @override
  String get pocketsEmptyTitle => 'No pockets yet';

  @override
  String get pocketsEmptyMessage =>
      'Pockets you create or join will appear here.';

  @override
  String pocketMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
      zero: 'No members',
    );
    return '$_temp0';
  }

  @override
  String pocketHandsFilled(int filled, int total) {
    return '$filled/$total hands filled';
  }

  @override
  String get pocketHandPrice => 'Hand price';

  @override
  String get pocketOrganiser => 'Organiser';

  @override
  String get roleOrganiser => 'Organiser';

  @override
  String get roleMember => 'Member';

  @override
  String get roleGuest => 'Guest';

  @override
  String get contributionsTitle => 'Contributions';

  @override
  String get contributeTitle => 'Contribute';

  @override
  String get contributeAmountLabel => 'Amount (₦)';

  @override
  String get contributeAmountHint => 'e.g. 5000';

  @override
  String get contributeSubmit => 'Submit contribution';

  @override
  String get contributeAmountInvalid => 'Enter an amount greater than zero.';

  @override
  String get contributionSubmitted => 'Contribution submitted.';

  @override
  String get invoicesEmptyTitle => 'No contributions yet';

  @override
  String get invoicesEmptyMessage =>
      'Contributions for this group will appear here.';

  @override
  String get invoiceStatusPending => 'Pending';

  @override
  String get invoiceStatusVerified => 'Verified';

  @override
  String get invoiceStatusDeclined => 'Declined';

  @override
  String get invoiceVerify => 'Verify';

  @override
  String get invoiceDecline => 'Decline';

  @override
  String get offlineBanner =>
      'You\'re offline — changes will sync when you reconnect.';

  @override
  String get adashiTitle => 'Adashi';

  @override
  String get adashiEmptyTitle => 'No circles yet';

  @override
  String get adashiEmptyMessage =>
      'Rotating savings circles you join will appear here.';

  @override
  String get adashiPerCycle => 'Per cycle';

  @override
  String adashiCycleProgress(int current, int total) {
    return 'Cycle $current of $total';
  }

  @override
  String get adashiModeAuto => 'Auto rotation';

  @override
  String get adashiModeManual => 'Manual rotation';

  @override
  String adashiCurrentReceiver(String name) {
    return 'Current receiver: $name';
  }

  @override
  String get adashiRotationTitle => 'Rotation';

  @override
  String get rotationReceived => 'Received';

  @override
  String get rotationCurrent => 'Receiving';

  @override
  String get rotationUpcoming => 'Upcoming';

  @override
  String get profileWallet => 'Wallet';

  @override
  String get profileNotifications => 'Notifications';

  @override
  String get profileAchievements => 'Achievements';

  @override
  String get profileSettings => 'Settings';

  @override
  String get profileReputation => 'Reputation';

  @override
  String profileKeens(int count) {
    return '$count Keens';
  }

  @override
  String get profileKycVerified => 'KYC verified';

  @override
  String get walletTitle => 'Wallet';

  @override
  String get walletBalance => 'Available balance';

  @override
  String get walletTransactions => 'Recent transactions';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsEmptyTitle => 'You\'re all caught up';

  @override
  String get notificationsEmptyMessage =>
      'New notifications will show up here.';

  @override
  String get notificationsMarkAllRead => 'Mark all read';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String get badgesTitle => 'Badges';

  @override
  String get leaderboardTitle => 'Leaderboard';

  @override
  String get profileTrust => 'Trust & reputation';

  @override
  String get profileFriends => 'Friends & Invites';

  @override
  String get profileLegal => 'Legal';

  @override
  String get trustTitle => 'Trust & reputation';

  @override
  String get trustReputationScore => 'Reputation score';

  @override
  String get trustRatingsTitle => 'Ratings';

  @override
  String get trustRatingsEmpty => 'No ratings yet';

  @override
  String get discoverTitle => 'Discover';

  @override
  String get discoverSearchHint => 'Search pockets & circles';

  @override
  String get discoverEmptyTitle => 'No results';

  @override
  String get discoverEmptyMessage => 'Try a different search term.';

  @override
  String get friendsTitle => 'Friends & Invites';

  @override
  String get friendsInviteTitle => 'Invite friends';

  @override
  String friendsInviteCode(String code) {
    return 'Your invite code: $code';
  }

  @override
  String get friendsShare => 'Share invite';

  @override
  String get friendsRequests => 'Requests';

  @override
  String get friendsList => 'Friends';

  @override
  String get friendsPending => 'Pending';

  @override
  String get friendsEmptyTitle => 'No connections yet';

  @override
  String get friendsEmptyMessage => 'Invite people to start saving together.';

  @override
  String get friendAccept => 'Accept';

  @override
  String get friendDecline => 'Decline';

  @override
  String get legalTitle => 'Legal';

  @override
  String get legalTerms => 'Terms of Service';

  @override
  String get legalPrivacy => 'Privacy Policy';

  @override
  String get legalDeleteAccount => 'Delete account';

  @override
  String get legalDeleteWarning =>
      'Account deletion is permanent and cannot be undone.';

  @override
  String get legalPlaceholderBody => 'The full document will be bundled here.';
}
