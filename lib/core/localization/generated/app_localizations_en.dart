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
  String get brandWordmark => 'KeenPocket';

  @override
  String get mascotName => 'Mr K';

  @override
  String get authFooter => 'KeenPocket keeps the records';

  @override
  String get authCopyright => '© KeenPocket. Join the flock.';

  @override
  String get authSupport => 'Support';

  @override
  String get loginIdentifierLabel => 'Email, phone, or username';

  @override
  String get loginIdentifierHint => 'Enter your details';

  @override
  String get loginRememberMe => 'Remember me';

  @override
  String get authHelp => 'Help';

  @override
  String get splashTagline => 'Saving made simple, playful, and rewarding.';

  @override
  String get splashGetStarted => 'Get started';

  @override
  String get splashHaveAccount => 'I already have an account';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingContinue => 'Continue';

  @override
  String get onboardingStart => 'Get started';

  @override
  String get onboardingJoined => 'Joined by 2M+ savers';

  @override
  String get onboard1Title => 'Save together';

  @override
  String get onboard1Body => 'Create shared Pockets for your group goals.';

  @override
  String get onboard2Title => 'Stay accountable';

  @override
  String get onboard2Body => 'Track contributions and never miss a turn.';

  @override
  String get onboard3Title => 'Build trust';

  @override
  String get onboard3Body => 'Earn reputation as you save with others.';

  @override
  String get loginWelcomeBack => 'Welcome back!';

  @override
  String get loginSubtitle => 'Log in to keep track of your pockets.';

  @override
  String get loginForgotPassword => 'Forgot password?';

  @override
  String get loginOr => 'OR';

  @override
  String get loginGoogle => 'Google';

  @override
  String get loginFacebook => 'Facebook';

  @override
  String get loginNoAccount => 'Don\'t have an account?';

  @override
  String get loginCreateAccount => 'Create account';

  @override
  String get registerTitle => 'Join the club!';

  @override
  String get registerSubtitle => 'Create your pocket of wisdom';

  @override
  String get registerFullName => 'Full name';

  @override
  String get registerPhone => 'Phone number';

  @override
  String get registerConfirmPassword => 'Confirm password';

  @override
  String get registerAgree =>
      'I agree to the Terms of Service and Privacy Policy';

  @override
  String get registerSubmit => 'Create account';

  @override
  String get registerHaveAccount => 'Already have an account?';

  @override
  String get otpTitle => 'Verify it\'s you';

  @override
  String get otpSubtitle => 'We\'ve sent a 6-digit code to';

  @override
  String get otpMaintenance =>
      'SMS verification is currently under maintenance. Please use Email instead.';

  @override
  String get otpResend => 'Resend code';

  @override
  String get otpVerify => 'Verify';

  @override
  String get otpTryAnother => 'Try another way';

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
  String get pocketsMyTitle => 'My Pockets';

  @override
  String get pocketsTip =>
      'Saving with friends is 3x more likely to reach the goal. High five! 🤚';

  @override
  String get pocketBrowsePublic => 'Browse public pockets';

  @override
  String get pocketsInsuredNote =>
      'All pockets are NDIC insured and strictly verified.';

  @override
  String get pocketsSubtitle =>
      'Manage your community contributions and goals.';

  @override
  String get pocketsCreateNew => 'Create New Pocket';

  @override
  String get pocketsSearchHint => 'Search your pockets…';

  @override
  String get pocketsSectionOrganise => 'Pockets I Organise';

  @override
  String get pocketsSectionIn => 'Pockets I\'m In';

  @override
  String get pocketsStartNewGroup => 'Start New Group';

  @override
  String get pocketsMonthlyContribution => 'Monthly contribution';

  @override
  String get pocketsYourShare => 'Your share';

  @override
  String pocketsHandsJoined(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hands joined',
      one: '1 hand joined',
    );
    return '$_temp0';
  }

  @override
  String get pocketsGoalProgress => 'Goal progress';

  @override
  String get pocketsCycleProgress => 'Cycle progress';

  @override
  String pocketsTipTitle(String name) {
    return 'Great job, $name!';
  }

  @override
  String get pocketsTipBody =>
      'You\'ve made all your contributions this month. You\'re on track for your next payout!';

  @override
  String get pocketsViewHistory => 'View history';

  @override
  String get pocketsPocketStats => 'Pocket stats';

  @override
  String get pocketStatusActive => 'Active';

  @override
  String get pocketStatusFull => 'Full';

  @override
  String get pocketNextHand => 'Your next hand';

  @override
  String get pocketStartSaving => 'Start saving together';

  @override
  String get createPocketTitle => 'Create pocket';

  @override
  String get createPocketIntroTitle => 'Ready for a new Pocket?';

  @override
  String get createPocketIntroBody =>
      'Fill in the details to start your savings journey with friends!';

  @override
  String get createPocketTitleLabel => 'Pocket title';

  @override
  String get createPocketTitleHint => 'e.g. Dream Vacation 2026';

  @override
  String get createPocketDescLabel => 'Description';

  @override
  String get createPocketDescHint => 'What are we saving for?';

  @override
  String get createPocketYear => 'Year';

  @override
  String get createPocketCost => 'Costs 1 Keen';

  @override
  String get createPocketSectionGeneral => 'General Details';

  @override
  String get createPocketSectionTimeline => 'Timeline';

  @override
  String get createPocketSectionContribution => 'Contribution';

  @override
  String get createPocketYourHandsSubtitle => 'How many slots are you taking?';

  @override
  String get createPocketVerified => 'Verified';

  @override
  String get createPocketCollaborative => 'Collaborative';

  @override
  String createPocketMonthsAbbrev(int count) {
    return '$count Mo';
  }

  @override
  String get createPocketStartMonth => 'Start month';

  @override
  String get createPocketDuration => 'Duration (months)';

  @override
  String get createPocketPerHand => '₦ Per hand';

  @override
  String get createPocketCapacity => 'Member capacity';

  @override
  String get createPocketCapacityHint => '0 = unlimited';

  @override
  String get createPocketYourHands => 'Your hands (your share)';

  @override
  String get createPocketTermsTitle => 'Terms notice';

  @override
  String get createPocketTermsBody =>
      'By creating this Pocket, you agree to facilitate fair contributions. Pockets cannot be deleted once members have contributed. Ensure your duration and per-hand amounts are final.';

  @override
  String get createPocketTermsAgree => 'I understand and agree to the terms';

  @override
  String get createPocketSubmit => 'Create pocket';

  @override
  String get pocketStatusOpen => 'Open';

  @override
  String get pocketDetailRateAdmin => 'Rate admin';

  @override
  String get pocketDetailShare => 'Share';

  @override
  String pocketDetailHandDuration(String amount) {
    return '$amount / hand · 6 months duration';
  }

  @override
  String pocketDetailMonthsCompleted(int done, int total) {
    return '$done of $total months completed';
  }

  @override
  String get pocketDetailPaid => 'Paid';

  @override
  String get pocketDetailNotPaid => 'Not paid';

  @override
  String get pocketDetailPendingApprovals => 'Pending approvals';

  @override
  String get pocketDetailMarkPaid => 'Mark paid';

  @override
  String get pocketDetailMyProgress => 'My progress';

  @override
  String pocketDetailProgressDesc(String raised, String target) {
    return 'You have contributed $raised of your $target target.';
  }

  @override
  String get pocketDetailMyContributions => 'My contributions';

  @override
  String get pocketDetailViewAll => 'View all';

  @override
  String get pocketDetailPayoutAccount => 'Payout account';

  @override
  String get pocketDetailMembers => 'Members';

  @override
  String pocketMemberHands(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hands',
      one: '1 hand',
    );
    return '$_temp0';
  }

  @override
  String get pocketDetailTopContributors => 'Top contributors';

  @override
  String get pocketDetailGroupRules => 'Group rules';

  @override
  String get pocketDetailRule1 => 'Contributions due by 5th of every month.';

  @override
  String get pocketDetailRule2 => 'Admin fee: ₦200 per hand monthly.';

  @override
  String get pocketDetailRule3 => 'Non-payment for 2 months leads to removal.';

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
    return 'Hello, $name';
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
  String get dashboardAdashiGroups => 'Adashi groups';

  @override
  String get dashboardReputation => 'Reputation';

  @override
  String get dashboardWalletBalance => 'Wallet balance';

  @override
  String get dashboardComplete => 'Complete';

  @override
  String get dashboardWeekStreak => 'Week streak';

  @override
  String get dashboardFreezesLeft => 'Freezes left';

  @override
  String get dashboardResetsMonday => 'Resets Monday';

  @override
  String get dashboardClaimReward => 'Claim reward';

  @override
  String get dashboardContributionTrend => 'Contribution trend';

  @override
  String get dashboardMyPockets => 'My Pockets';

  @override
  String get dashboardMyAdashi => 'My Adashi';

  @override
  String get dashboardViewAll => 'View all';

  @override
  String dashboardPerHand(String amount) {
    return '$amount / hand';
  }

  @override
  String dashboardPerCycle(String amount) {
    return '$amount / cycle';
  }

  @override
  String dashboardMembersParticipating(int count) {
    return '$count members participating';
  }

  @override
  String get dashboardJoinGroup => 'Join group';

  @override
  String get dashboardPoints => 'PTS';

  @override
  String get dashboardTabOverview => 'Overview';

  @override
  String get dashboardTabHistory => 'History';

  @override
  String get dashboardTabAnalytics => 'Analytics';

  @override
  String get dashboardSearchHint => 'Search…';

  @override
  String dashboardSavedThisMonth(String amount) {
    return 'You\'ve saved $amount this month. Keep it up!';
  }

  @override
  String dashboardStreakTitle(int count) {
    return '$count-week streak!';
  }

  @override
  String dashboardStreakSubtitle(int count) {
    return 'You\'re on fire! $count streak freezes left 🧊';
  }

  @override
  String get dashboardLast7Days => 'Last 7 days';

  @override
  String get dashboardTrendCaption => 'Visualizing your progress…';

  @override
  String get dashboardInProgress => 'In progress';

  @override
  String get dashboardActiveCycle => 'Active cycle';

  @override
  String dashboardGoalReached(int percent) {
    return '$percent% of goal reached';
  }

  @override
  String get dashboardFooter =>
      'KeenPocket keeps the records — it never holds your money.';

  @override
  String get dashboardCopyright => '© KeenPocket Nigeria';

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
  String get plansWelcomeTitle => 'Welcome to your Plans!';

  @override
  String get plansWelcomeBody =>
      'I\'m Mr. K, your grocery sidekick. Let\'s make sure you never miss an item or blow your budget again. Ready to organize your June haul?';

  @override
  String get plansCadenceMonthly => 'Monthly';

  @override
  String get plansCadenceWeekly => 'Weekly';

  @override
  String plansBoughtCount(int count) {
    return 'Bought $count';
  }

  @override
  String plansPendingCount(int count) {
    return 'Pending $count';
  }

  @override
  String plansDeferredCount(int count) {
    return 'Deferred $count';
  }

  @override
  String get plansBudgetProgress => 'Budget Progress';

  @override
  String get plansCreatePlan => 'Create plan';

  @override
  String get plansCockpitTitle => 'Savings Cockpit';

  @override
  String get plansCockpitSubtitle => 'Your grocery strategy for the month';

  @override
  String get plansMonthlyGoal => 'Monthly Goal';

  @override
  String plansGoalReached(int percent) {
    return '$percent% Reached';
  }

  @override
  String get plansStatBought => 'Bought';

  @override
  String get plansStatPending => 'Pending';

  @override
  String get plansStatDeferred => 'Deferred';

  @override
  String get plansDoingGreatTitle => 'Doing Great!';

  @override
  String plansDoingGreatBody(String amount) {
    return 'You\'ve saved over $amount this week by choosing deferred items wisely. Mr. K is proud of your grocery discipline!';
  }

  @override
  String get plansViewAnalytics => 'View Analytics';

  @override
  String get plansHighPriorityItems => 'High Priority Items';

  @override
  String get plansSavingsHack => 'Savings Hack';

  @override
  String get plansSavingsHackBody =>
      'Shopping on Tuesdays at FreshMarket can save you 5% on dairy and grains. Sync your \'Family Groceries\' plan for Tuesday!';

  @override
  String get plansAiNudge => 'AI-Nudge Suggestion';

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
