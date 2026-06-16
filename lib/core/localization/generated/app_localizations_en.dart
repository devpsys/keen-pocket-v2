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
  String get payConfirmTitle => 'Confirm payment';

  @override
  String get payWalletBalance => 'Wallet balance';

  @override
  String get payInvoiceAmount => 'Invoice amount';

  @override
  String get payNewBalance => 'New balance';

  @override
  String payFromWallet(String amount) {
    return 'Pay $amount from wallet';
  }

  @override
  String get payInsufficientTitle => 'Insufficient balance';

  @override
  String get payRequiredAmount => 'Required amount';

  @override
  String payShortfall(String amount) {
    return 'You need an extra $amount to complete this transaction.';
  }

  @override
  String get payTopUp => 'Top up wallet';

  @override
  String get paySecure =>
      'KeenPocket uses bank-grade encryption to protect every transaction.';

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
  String get moneyPayoutAccount => 'Payout account';

  @override
  String get moneyBankLabel => 'Bank';

  @override
  String get moneyNubanLabel => 'NUBAN';

  @override
  String get moneyEditAccount => 'Edit account';

  @override
  String get moneyNoAccounts => 'No payout account yet.';

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
  String get trustScoreCaption => 'Trust score';

  @override
  String trustMemberSince(String date) {
    return 'Member since $date';
  }

  @override
  String get trustReliability => 'Payment reliability';

  @override
  String get trustPocketsJoined => 'Pockets joined';

  @override
  String get trustAdashisCompleted => 'Adashis completed';

  @override
  String trustAvgRating(int count) {
    return 'Avg rating ($count)';
  }

  @override
  String trustRateTitle(String name) {
    return 'Rate $name';
  }

  @override
  String get trustRateCommentHint => 'Add a comment (optional)';

  @override
  String get trustRateSubmit => 'Submit rating';

  @override
  String get trustVouch => 'Vouch';

  @override
  String get trustInviteToPocket => 'Invite to pocket';

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

  @override
  String dashboardGreeting(String name) {
    return 'Hi, $name';
  }

  @override
  String get dashboardTotalSaved => 'Total saved';

  @override
  String get dashboardActivePockets => 'Active pockets';

  @override
  String dashboardStreak(int days) {
    return '$days-day streak';
  }

  @override
  String get dashboardWeeklyGoal => 'Weekly goal';

  @override
  String get dashboardShortcutPlans => 'Shopping plans';

  @override
  String get charityTitle => 'Charity';

  @override
  String charityRaisedOfGoal(String raised, String goal) {
    return '$raised of $goal raised';
  }

  @override
  String charityDonors(int count) {
    return '$count donors';
  }

  @override
  String get charityDonate => 'Donate';

  @override
  String charityRaised(String amount) {
    return '$amount raised';
  }

  @override
  String charityGoal(String amount) {
    return '$amount goal';
  }

  @override
  String charityReached(int percent) {
    return '$percent% reached';
  }

  @override
  String get charityEnterAmount => 'Enter donation amount';

  @override
  String get charityDonateNow => 'Donate now';

  @override
  String get charitySecure => 'Your contribution is secure and transparent.';

  @override
  String get plansTitle => 'Plans';

  @override
  String plansItemsCount(int count) {
    return '$count items';
  }

  @override
  String get shoppingListTitle => 'Shopping list';

  @override
  String shoppingUnitPrice(String price) {
    return '$price / unit';
  }

  @override
  String shoppingSharing(int count) {
    return '× $count sharing';
  }

  @override
  String get shoppingTotalCost => 'Total cost';

  @override
  String get shoppingEstimatedTotal => 'Estimated group total';

  @override
  String get shoppingSuggestItem => 'Suggest item';

  @override
  String get shoppingSuggestionsClosed => 'Suggestions closed';

  @override
  String get shoppingEmpty => 'No items yet — suggest the first one.';

  @override
  String get groupChatTitle => 'Group chat';

  @override
  String get groupChatHint => 'Message';

  @override
  String get groupChatSend => 'Send';

  @override
  String groupChatMembersOnline(int count) {
    return '$count members online';
  }

  @override
  String get groupChatEmptyTitle => 'No messages yet — say hello 👋';

  @override
  String get groupChatEmptyMessage => 'Be the first to start the conversation.';

  @override
  String get disputesTitle => 'Disputes';

  @override
  String get disputesRaise => 'Raise a dispute';

  @override
  String get disputesActiveCases => 'Active cases';

  @override
  String disputesOpenCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count open',
      one: '1 open',
      zero: 'No open cases',
    );
    return '$_temp0';
  }

  @override
  String get disputesResolvedThisMonth => 'Resolved this month';

  @override
  String get disputesAvgResolution => 'Avg. resolution time';

  @override
  String get disputesResolutionNote => 'Resolution note';

  @override
  String get disputesEmpty => 'No disputes — all clear.';

  @override
  String get disputeStatusOpen => 'Open';

  @override
  String get disputeStatusResolved => 'Resolved';

  @override
  String get disputeStatusDismissed => 'Dismissed';

  @override
  String get profileSchool => 'School';

  @override
  String get profileAdmin => 'Administration';

  @override
  String get schoolTitle => 'School';

  @override
  String get schoolClasses => 'Classes';

  @override
  String get schoolStudents => 'Students';

  @override
  String get schoolFeesCollected => 'Fees collected';

  @override
  String get adminTitle => 'Administration';

  @override
  String get adminHealthScore => 'Collection health';

  @override
  String get adminActiveAdmins => 'Active admins';

  @override
  String get adminKeensInCirculation => 'Keens in circulation';

  @override
  String get adminPermissionDenied => 'You don\'t have access to this area.';
}
