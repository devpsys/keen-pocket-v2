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
  String get navCollapseRail => 'Collapse menu';

  @override
  String get navExpandRail => 'Expand menu';

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
  String get pocketStatusClosed => 'Closed';

  @override
  String pocketsPerHand(String amount) {
    return '$amount / hand';
  }

  @override
  String pocketsHandsCount(int count) {
    return '$count hands';
  }

  @override
  String pocketsScheduleLabel(int months, int year) {
    return '$months months · $year';
  }

  @override
  String pocketsActiveCount(int count) {
    return '$count Active';
  }

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
  String get pocketCharityTitle => 'Charity Drive';

  @override
  String get pocketCharitySubtitle =>
      'Rally your group around a cause and give back together.';

  @override
  String get pocketCharityStart => 'Start a drive';

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
  String get pocketDetailVerified => 'Verified';

  @override
  String get pocketDetailContributionType => 'Contribution';

  @override
  String get pocketDetailUpcomingType => 'Upcoming';

  @override
  String get pocketDetailGroupShopping => 'Group shopping';

  @override
  String pocketDetailGroupPrice(String amount) {
    return '$amount group price';
  }

  @override
  String pocketDetailSharedBy(String name) {
    return 'Shared by $name';
  }

  @override
  String get pocketDetailTitle => 'Pocket Details';

  @override
  String get pocketDetailSearchMembers => 'Search members…';

  @override
  String get pocketDetailTarget => 'Target';

  @override
  String get pocketDetailPerHandShort => '₦ / Hand';

  @override
  String get pocketDetailDuration => 'Duration';

  @override
  String pocketDetailMonths(int count) {
    return '$count Months';
  }

  @override
  String get pocketDetailSharePocket => 'Share Pocket';

  @override
  String get pocketDetailMrKTitle => 'Mr. K Says:';

  @override
  String get pocketDetailMrKMessage =>
      'You\'re only 3 contributions away from your next badge!';

  @override
  String get pocketDetailGoal => 'Goal';

  @override
  String get pocketDetailContributed => 'Contributed';

  @override
  String get pocketDetailFrequency => 'Frequency';

  @override
  String get pocketDetailFrequencyMonthly => 'Monthly';

  @override
  String get pocketDetailContributeNow => 'Contribute Now';

  @override
  String get pocketDetailViewHistory => 'View History';

  @override
  String get pocketDetailGroupShoppingSuggestions =>
      'Group shopping suggestions';

  @override
  String get pocketDetailBeta => 'BETA';

  @override
  String get pocketDetailVoteForItem => 'Vote for Item';

  @override
  String pocketDetailGroupPriceShort(String amount) {
    return 'Group Price: $amount';
  }

  @override
  String get pocketDetailNewJoinRequest => 'New Join Request';

  @override
  String pocketDetailMembersWithCount(int count) {
    return 'Members ($count)';
  }

  @override
  String get pocketDetailRoleOrganizer => 'ORGANIZER';

  @override
  String get pocketDetailRoleMember => 'MEMBER';

  @override
  String get pocketDetailTabletRule1 =>
      'All contributions must be made by the 15th of every month to avoid late fees.';

  @override
  String get pocketDetailTabletRule2 =>
      'Early withdrawal is only permitted in group-voted emergencies with a 5% fee.';

  @override
  String get pocketDetailTabletRule3 =>
      'Shopping suggestions require at least 60% member approval to be finalized.';

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
  String get contributeToPocket => 'Contribute to Pocket';

  @override
  String get contributeTargetGoal => 'Target Goal';

  @override
  String contributeTargetAmount(String amount) {
    return 'Target: $amount';
  }

  @override
  String contributeOutstanding(String amount) {
    return '$amount outstanding';
  }

  @override
  String contributePercentComplete(int percent) {
    return '$percent% Complete';
  }

  @override
  String contributeMoreToGoal(String amount) {
    return 'Only $amount more to reach your holiday target!';
  }

  @override
  String get contributeEnterAmount => 'Enter Amount';

  @override
  String get contributeEnterContribution => 'Enter Contribution';

  @override
  String get contributeEnterSubtitle =>
      'How much are we adding to the pocket today?';

  @override
  String contributeQuickAdd(String amount) {
    return '+$amount';
  }

  @override
  String get contributeTip =>
      'Every contribution counts towards your savings streak!';

  @override
  String get contributeCharity => 'Add a charity donation';

  @override
  String contributeCharitySubtitle(String amount, String cause) {
    return 'Donate $amount to $cause';
  }

  @override
  String get contributeContinue => 'Continue';

  @override
  String get contributeConfirm => 'Confirm Contribution';

  @override
  String get contributeSecureFooter =>
      'Secure transaction powered by KeenPocket';

  @override
  String get contributeFundsDebited =>
      'Funds will be debited from your Primary Wallet';

  @override
  String allocateAllocatedOf(String allocated, String total) {
    return 'Allocated $allocated of $total';
  }

  @override
  String get allocateGreatProgress => 'Great Progress!';

  @override
  String allocateAllocatedSub(String allocated, String total) {
    return 'You\'ve allocated $allocated of $total';
  }

  @override
  String get allocatePendingNote =>
      'This contribution will be Pending verification until the organiser confirms.';

  @override
  String get allocateConfirmationTitle => 'Confirmation Required';

  @override
  String get allocateConfirmationBody =>
      'Once submitted, your pocket organiser will need to confirm the transaction before it is finalized in your history.';

  @override
  String get allocateMonthsPending => 'Months Pending';

  @override
  String allocateMonthsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months',
      one: '1 month',
    );
    return '$_temp0';
  }

  @override
  String allocateMonthSubtitle(String target, int paid) {
    return '$target / $paid paid';
  }

  @override
  String get allocateTargetLabel => 'Target:';

  @override
  String get allocateMonthReady => 'Ready';

  @override
  String get allocateMonthPendingStatus => 'Pending';

  @override
  String get allocateMonthEdit => 'Edit';

  @override
  String get allocateSubmit => 'Submit contribution';

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
  String get payPageTitle => 'Confirm Payment';

  @override
  String get payTip =>
      'Looking good! You\'ve got plenty in your pocket for this one.';

  @override
  String get paySafeTitle => 'Safe & Secure';

  @override
  String get payMonthlyLimit => 'Monthly Spending Limit';

  @override
  String payLimitUsage(String spent, String limit) {
    return '$spent / $limit';
  }

  @override
  String get payConfirmSecurely => 'Confirm & Pay Securely';

  @override
  String get payTabletTipTitle => 'Great Job!';

  @override
  String get payTabletTipBody =>
      'Your spending is perfectly aligned with your monthly budget goals.';

  @override
  String get invoiceLedgerTitle => 'Invoice Ledger';

  @override
  String get invoiceLedgerSubtitle =>
      'Keep your finances on track. Here you can manage your group contributions, verify proofs, and see where your money goes.';

  @override
  String get invoiceTopSaver => 'TOP SAVER';

  @override
  String get invoicePendingApprovals => 'Pending Approvals';

  @override
  String invoiceMemberLabel(String name) {
    return 'Member: $name';
  }

  @override
  String get invoiceViewProof => 'View Proof';

  @override
  String get invoiceUrgent => 'URGENT';

  @override
  String get invoiceMarkInvoicePaid => 'Mark Invoice Paid';

  @override
  String get invoiceMarkPaid => 'Mark Paid';

  @override
  String get invoiceBalanceDue => 'Balance Due';

  @override
  String get invoiceDueToday => 'Due today';

  @override
  String invoiceUrgentSubtitle(String ref, String name) {
    return 'Invoice $ref for $name.';
  }

  @override
  String get invoicePaymentHistory => 'Payment History';

  @override
  String get invoiceFilterAll => 'All';

  @override
  String get invoiceFilterPaid => 'Paid';

  @override
  String get invoiceFilterPending => 'Pending';

  @override
  String get invoiceViaWallet => 'Via Wallet';

  @override
  String get invoiceManual => 'Manual';

  @override
  String get invoicePaid => 'PAID';

  @override
  String get invoiceNotPaid => 'NOT PAID';

  @override
  String get invoiceDownloadReport => 'Download Full Report';

  @override
  String get invoiceTip => 'Saving is a team sport! Keep it up!';

  @override
  String get invoiceTotalSent => 'Total Sent';

  @override
  String get invoiceAwaiting => 'Awaiting';

  @override
  String get invoiceColInvoice => 'Invoice #';

  @override
  String get invoiceColDate => 'Date';

  @override
  String get invoiceColMethod => 'Method';

  @override
  String get invoiceColAmount => 'Amount';

  @override
  String get invoiceColStatus => 'Status';

  @override
  String get invoiceMethodDirectTransfer => 'Direct Transfer';

  @override
  String get invoiceMethodKeenWallet => 'KeenWallet';

  @override
  String get invoiceMethodCardPayment => 'Card Payment';

  @override
  String get invoiceStatusPaid => 'Paid';

  @override
  String get invoiceStatusOverdue => 'Overdue';

  @override
  String get invoiceUrgentAction => 'Urgent Action';

  @override
  String get invoiceDueIn24h => 'DUE IN 24H';

  @override
  String invoiceSentBy(String name) {
    return 'SENT BY: $name';
  }

  @override
  String get invoiceTipTitle => 'Mr. K\'s Financial Tip';

  @override
  String get invoiceTipTabletBody =>
      'Paying your invoices 2 days early earns you 50 bonus \'Savvy Points\'! Keep leveling up your wealth.';

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
  String get adashiMyGroupsTitle => 'My Adashi Groups';

  @override
  String adashiActiveCount(int count) {
    return '$count Active';
  }

  @override
  String adashiActiveInCircles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You are active in $count savings circles',
      one: 'You are active in 1 savings circle',
      zero: 'You are not in any savings circles yet',
    );
    return '$_temp0';
  }

  @override
  String get adashiStatusActive => 'Active';

  @override
  String get adashiStatusCompleted => 'Completed';

  @override
  String get adashiFrequencyWeekly => 'Weekly';

  @override
  String get adashiFrequencyMonthly => 'Monthly';

  @override
  String get adashiPerCycleSuffix => '/ cycle';

  @override
  String adashiPerCycleLine(String amount) {
    return '$amount per cycle';
  }

  @override
  String adashiMembersParticipating(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members participating',
      one: '1 member participating',
      zero: 'No members yet',
    );
    return '$_temp0';
  }

  @override
  String get adashiNextPayout => 'Next payout';

  @override
  String adashiPayoutInDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'In $days days',
      one: 'In 1 day',
      zero: 'Today',
    );
    return '$_temp0';
  }

  @override
  String adashiNextPayoutDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
      zero: 'today',
    );
    return 'Next payout: $_temp0';
  }

  @override
  String get adashiCycleProgressTitle => 'Cycle Progress';

  @override
  String adashiCycleCount(int current, int total) {
    return '$current of $total';
  }

  @override
  String get adashiCreate => 'Create adashi';

  @override
  String get adashiNewGroup => 'New Group';

  @override
  String get adashiSearchHint => 'Find a group...';

  @override
  String get adashiJoinTitle => 'Join a Circle';

  @override
  String get adashiJoinBody =>
      'Looking for something new? Explore community-run Adashi groups.';

  @override
  String get adashiBrowseExplore => 'Browse Explore';

  @override
  String get adashiDidYouKnowTitle => 'Did you know?';

  @override
  String get adashiDidYouKnowBody =>
      'Adashi groups help you reach your goals 3x faster than saving alone. Mr K keeps everyone on track!';

  @override
  String adashiHubAdminName(String name) {
    return '$name (Admin)';
  }

  @override
  String get adashiHubRateAdmin => 'Rate admin';

  @override
  String adashiHubReputation(String score) {
    return '$score reputation';
  }

  @override
  String adashiHubCycle(int number) {
    return 'Cycle $number';
  }

  @override
  String get adashiHubCollecting => 'Collecting';

  @override
  String get adashiHubActive => 'Active';

  @override
  String adashiHubPaidMembers(int paid, int total) {
    return 'Paid $paid of $total members';
  }

  @override
  String adashiHubPercent(int percent) {
    return '$percent%';
  }

  @override
  String get adashiHubTotalCollected => 'Total Collected';

  @override
  String adashiHubCollectedOf(String collected, String target) {
    return '$collected / $target';
  }

  @override
  String get adashiHubThisCycle => 'This cycle:';

  @override
  String adashiHubReceives(String name, String amount) {
    return '$name receives $amount';
  }

  @override
  String adashiHubContribute(String amount) {
    return 'Contribute $amount';
  }

  @override
  String get adashiHubRotationTitle => 'Rotation timeline';

  @override
  String get adashiHubReceivingNow => 'Receiving now';

  @override
  String adashiHubReceivedOn(String date) {
    return 'Received: $date';
  }

  @override
  String adashiHubProjectedOn(String date) {
    return 'Projected: $date';
  }

  @override
  String get adashiHubYouUpcoming => 'You (Upcoming)';

  @override
  String get adashiHubYourTurn => 'Your turn';

  @override
  String get adashiHubPayoutAccount => 'Payout Account';

  @override
  String get adashiHubEdit => 'Edit';

  @override
  String get adashiHubCyclesHistory => 'Cycles history';

  @override
  String get adashiHubSeeAll => 'See all';

  @override
  String get adashiHubColCycle => 'Cycle';

  @override
  String get adashiHubColTotal => 'Total';

  @override
  String get adashiHubColStatus => 'Status';

  @override
  String get adashiHubClosed => 'Closed';

  @override
  String get adashiHubDisputesTitle => 'Disputes';

  @override
  String get adashiHubDisputesEmpty =>
      'No active disputes in this Adashi group. Keep up the timely contributions!';

  @override
  String get adashiHubTitle => 'Adashi Hub';

  @override
  String adashiHubWelcome(String name) {
    return 'Welcome back, $name! Your group is thriving.';
  }

  @override
  String get adashiHubMasterOrganiser => 'Master Organiser';

  @override
  String get adashiHubProductDetails => 'Product Details';

  @override
  String get adashiHubReputationLabel => 'Reputation';

  @override
  String get adashiHubPayoutDetails => 'Payout Details';

  @override
  String get adashiHubTarget => 'Target';

  @override
  String get adashiHubCollectedSuffix => 'collected';

  @override
  String adashiHubNextPayoutLine(String date) {
    return 'Next payout: $date';
  }

  @override
  String get adashiHubMascotTip =>
      'Keep the energy up! 6 members have already contributed today.';

  @override
  String get adashiHubResolveNow => 'Resolve now';

  @override
  String get adashiHubClosedCases => 'Closed cases';

  @override
  String get adashiHubAvgResolve => 'Avg. resolve time';

  @override
  String get adashiHubGroupHealth => 'Group Health';

  @override
  String get adashiHubTotalSaved => 'Total Saved YTD';

  @override
  String get adashiHubSecurity => 'Security Status';

  @override
  String get adashiCreateCost => 'Costs 1 Keen';

  @override
  String get adashiCreateCostNote => 'Costs 1 Keen note';

  @override
  String get adashiCreateIntroTitle => 'Let\'s set up your circle!';

  @override
  String get adashiCreateIntroBody =>
      'Fill in the details below to start saving together.';

  @override
  String get adashiCreateName => 'Adashi Name';

  @override
  String get adashiCreateNameHint => 'e.g. Dream Vacation Fund';

  @override
  String get adashiCreatePerCycle => '₦ per cycle';

  @override
  String get adashiCreatePerCycleHint => '5,000';

  @override
  String get adashiCreateCycleDays => 'Cycle (Days)';

  @override
  String get adashiCreateCycleDuration => 'Cycle duration (days)';

  @override
  String adashiCreateDaysOption(int days) {
    return '$days days';
  }

  @override
  String get adashiCreateStartDate => 'Start date';

  @override
  String get adashiCreateStartDateHint => 'mm/dd/yyyy';

  @override
  String get adashiCreateRotationMode => 'Rotation mode';

  @override
  String get adashiCreateAuto => 'Auto';

  @override
  String get adashiCreateManual => 'Manual';

  @override
  String get adashiCreateAutoHint =>
      'Auto mode selects the next recipient automatically.';

  @override
  String get adashiCreateMakePublic => 'Make public';

  @override
  String get adashiCreateMakePublicHint => 'Visible to others in Explore';

  @override
  String get adashiCreateCollectionBank => 'Collection bank';

  @override
  String get adashiCreatePayoutDetails => 'Payout Details';

  @override
  String get adashiCreateBank => 'Bank';

  @override
  String get adashiCreateSelectBank => 'Select Bank';

  @override
  String get adashiCreateNuban => 'NUBAN';

  @override
  String get adashiCreateNubanHint => '0123456789';

  @override
  String get adashiCreateAccountName => 'Account name';

  @override
  String get adashiCreateAccountNameHint => 'Verified account holder';

  @override
  String get adashiCreateTerms =>
      'I agree to the KeenPocket Terms of Service and acknowledge circle management rules.';

  @override
  String get adashiCreateSubmit => 'Create Adashi';

  @override
  String get adashiCreateTabletTitle => 'Create your Adashi';

  @override
  String get adashiCreateTabletBody =>
      'Gather your friends, set your cycle, and start saving together. It\'s easy and transparent!';

  @override
  String get adashiCreateAddMembersNote =>
      'You can add members on the next step.';

  @override
  String adashiRotationScreenTitle(String name) {
    return 'Adashi: $name';
  }

  @override
  String get adashiRotationCurrentPot => 'Current Pot';

  @override
  String adashiRotationCollected(int percent) {
    return '$percent% Collected';
  }

  @override
  String adashiRotationTarget(String amount) {
    return 'Target: $amount';
  }

  @override
  String adashiRotationNextPayout(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days left',
      one: '1 day left',
    );
    return 'Next Payout: $_temp0';
  }

  @override
  String get adashiRotationTipTitle => 'Mr K\'s Tip';

  @override
  String get adashiRotationOrder => 'Rotation Order';

  @override
  String adashiRotationCycle(int n) {
    return 'Cycle $n';
  }

  @override
  String adashiRotationCycleActive(int n) {
    return 'Cycle $n (Active)';
  }

  @override
  String adashiRotationCycleNext(int n) {
    return 'Cycle $n (Next)';
  }

  @override
  String adashiRotationPaid(String amount) {
    return '$amount Paid';
  }

  @override
  String adashiRotationPayout(String amount) {
    return 'Payout: $amount';
  }

  @override
  String adashiRotationDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days left',
      one: '1 day left',
    );
    return '$_temp0';
  }

  @override
  String adashiRotationExpected(String date) {
    return 'Expected $date';
  }

  @override
  String get adashiRotationTransactionLog => 'Transaction Log';

  @override
  String get adashiRotationGroupChat => 'Group Chat';

  @override
  String get adashiRotationInvite => 'Invite';

  @override
  String get adashiRotationMembers => 'Members';

  @override
  String adashiRotationActiveCount(int count) {
    return '$count Active';
  }

  @override
  String get adashiRotationContributed => 'Contributed';

  @override
  String get adashiRotationStatus => 'Status';

  @override
  String get adashiRotationPending => 'Pending';

  @override
  String get adashiRotationPayNow => 'Pay Now';

  @override
  String get adashiRotationScheduled => 'Scheduled';

  @override
  String get adashiRotationYouBadge => 'You';

  @override
  String get adashiRotationInviteMember => 'Invite New Member';

  @override
  String adashiRotationKycLevel(int level) {
    return 'KYC Level $level';
  }

  @override
  String get adashiManageTitle => 'Manage Adashi';

  @override
  String adashiManageCircleSubtitle(String name) {
    return 'Circle: $name';
  }

  @override
  String get adashiManageMembersTitle => 'Circle Members';

  @override
  String adashiManageMembersCount(int count) {
    return '$count Members';
  }

  @override
  String get adashiManageColPos => 'Pos';

  @override
  String get adashiManageColMember => 'Member';

  @override
  String get adashiManageColStatus => 'Status';

  @override
  String get adashiManageReceiver => 'Receiver';

  @override
  String get adashiManageStatusReceived => 'Received';

  @override
  String get adashiManageStatusActive => 'Active';

  @override
  String get adashiManageAddMember => 'Add Member';

  @override
  String get adashiManagePhoneLabel => 'Phone Number';

  @override
  String get adashiManagePhoneHint => '+1 (555) 000-0000';

  @override
  String get adashiManageInvite => 'Invite to Circle';

  @override
  String get adashiManageVerifyPayments => 'Verify Payments';

  @override
  String get adashiManageReconcile => 'Reconcile & Rotate';

  @override
  String adashiManageReconcileCaption(String position) {
    return 'Calculates balances and moves the payout to position #$position';
  }

  @override
  String get adashiManageOverrides => 'Admin Overrides';

  @override
  String get adashiManageSetReceiver => 'Set Receiver';

  @override
  String get adashiManageDeactivate => 'Deactivate';

  @override
  String get adashiManageAdjContrib => 'Adj. Contrib';

  @override
  String get adashiManageSetPosition => 'Set Position';

  @override
  String get adashiManagePauseCircle => 'Pause Circle';

  @override
  String get adashiManageMarkPayout => 'Mark Payout';

  @override
  String get adashiManageMarkDispute => 'Mark Dispute';

  @override
  String get adashiManagePublicVisibility => 'Public Visibility';

  @override
  String get adashiManageShowPayoutNames => 'Show Payout Names';

  @override
  String get adashiManageBankDetails => 'Bank Details';

  @override
  String get adashiManageCircleRules => 'Circle Rules';

  @override
  String get adashiManageClone => 'Clone';

  @override
  String get adashiManageExport => 'Export';

  @override
  String adashiManageSlot(int current, int total) {
    return 'Slot $current of $total';
  }

  @override
  String get adashiManageCurrentRotation => 'Current Rotation';

  @override
  String get adashiManageMascotTip =>
      'Mr K says: \"Remember to verify all receipts before rotating!\"';

  @override
  String adashiManageMembersFraction(int active, int total) {
    return '$active / $total Members';
  }

  @override
  String adashiManagePaymentSubtitle(String amount) {
    return '$amount • Contribution';
  }

  @override
  String get adashiManageEmailLabel => 'Member Email or Username';

  @override
  String get adashiManageEmailHint => 'e.g. mr.k@keenpocket.com';

  @override
  String get adashiManageRotationSlot => 'Rotation Slot';

  @override
  String adashiManageNextAvailable(String slot) {
    return 'Next Available ($slot)';
  }

  @override
  String get adashiManageSendInvite => 'Send Invite';

  @override
  String get adashiManageReschedule => 'Reschedule';

  @override
  String get adashiManageCycleLength => 'Cycle Length';

  @override
  String get adashiManageAuditLog => 'Audit Log';

  @override
  String get adashiManageDissolve => 'Dissolve Circle';

  @override
  String get adashiManageExportLedger => 'Export Ledger (CSV)';

  @override
  String get adashiManageCloneSettings => 'Clone Settings';

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
  String profileLevel(int level) {
    return 'LVL $level';
  }

  @override
  String get profileTrustScore => 'Trust Score';

  @override
  String get profileKycCheckTitle => 'KYC Identity Check';

  @override
  String get profileKycCheckBody =>
      'Verify your ID to unlock higher pocket limits.';

  @override
  String get profileVerify => 'Verify';

  @override
  String get profileStatPaymentReliability => 'Payment Reliability';

  @override
  String get profileStatPocketsJoined => 'Pockets Joined';

  @override
  String get profileStatAdashisCompleted => 'Adashis Completed';

  @override
  String get profileStatAvgRating => 'Avg Rating';

  @override
  String get profileViewAll => 'View All';

  @override
  String get profileRecentReviews => 'Recent Reviews';

  @override
  String profileSeeAllReviews(int count) {
    return 'See all $count reviews';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsProfilePhoto => 'Profile Photo';

  @override
  String get settingsPhotoBlurb =>
      'Update your photo to make your profile stand out to your connections.';

  @override
  String get settingsUploadPhoto => 'Upload New Photo';

  @override
  String get settingsAccountInfo => 'Account Info';

  @override
  String get settingsName => 'Name';

  @override
  String get settingsEmail => 'Email Address';

  @override
  String get settingsPhone => 'Phone Number';

  @override
  String get settingsContactSupport =>
      'Contact support to change your email or phone.';

  @override
  String get settingsNotifPrefs => 'Notification Preferences';

  @override
  String get settingsPushNotif => 'Push Notifications';

  @override
  String get settingsPushNotifSub => 'Real-time alerts on your device';

  @override
  String get settingsSmsNotif => 'SMS Notifications';

  @override
  String get settingsSmsNotifSub => 'Critical account updates via text';

  @override
  String get settingsWhatsappNotif => 'WhatsApp Updates';

  @override
  String get settingsWhatsappNotifSub => 'Weekly summaries and rewards';

  @override
  String get settingsChangePassword => 'Change Password';

  @override
  String get settingsCurrentPassword => 'Current Password';

  @override
  String get settingsNewPassword => 'New Password';

  @override
  String get settingsConfirmPassword => 'Confirm New Password';

  @override
  String get settingsUpdatePassword => 'Update Password';

  @override
  String get settingsBankAccounts => 'Bank Accounts';

  @override
  String get settingsManage => 'Manage';

  @override
  String get settingsPrimaryAccount => 'Primary Linked Account';

  @override
  String get settingsAppSettings => 'App Settings';

  @override
  String get settingsDarkMode => 'Dark Mode';

  @override
  String get settingsMore => 'More';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get publicProfileYou => '(you)';

  @override
  String get publicProfileVerified => 'Verified';

  @override
  String get publicProfileRating => 'Rating';

  @override
  String get publicProfileGroups => 'Groups';

  @override
  String get publicProfileTrust => 'Trust';

  @override
  String publicProfileGroupsBy(String name) {
    return 'Groups by $name';
  }

  @override
  String get publicProfileOpenPocket => 'Open Pocket';

  @override
  String get publicProfileAdashiCircle => 'Adashi Circle';

  @override
  String publicProfileFunded(int percent) {
    return '$percent% Funded';
  }

  @override
  String get publicProfileRatingsReceived => 'Ratings Received';

  @override
  String get publicProfileAddRecommendation => 'Add a Recommendation';

  @override
  String publicProfileLegendTitle(String name) {
    return 'You\'re a Legend, $name!';
  }

  @override
  String get publicProfileLegendBody =>
      'Your reputation score is in the top 5% of Lagos contributors this month. Keep it up!';

  @override
  String get walletTitle => 'Wallet';

  @override
  String get walletCockpit => 'Wallet Cockpit';

  @override
  String get walletBalance => 'Available balance';

  @override
  String get walletTransactions => 'Recent transactions';

  @override
  String get walletSend => 'Send';

  @override
  String get walletWithdraw => 'Withdraw';

  @override
  String get walletTopUp => 'Top up';

  @override
  String get walletQuickTopUp => 'Quick Top up';

  @override
  String get walletAddFunds => 'Add Funds';

  @override
  String get walletSafetyNote =>
      'Mr. K: \"Your transactions are always safe with us!\"';

  @override
  String get walletRecentActivity => 'Recent activity';

  @override
  String get walletViewAll => 'View all';

  @override
  String walletBalanceAfter(String amount) {
    return 'Balance: $amount';
  }

  @override
  String get walletSpendingLimit => 'Spending Limit';

  @override
  String get walletUsed => 'Used';

  @override
  String get walletLimit => 'Limit';

  @override
  String walletPercentUsed(int percent) {
    return '$percent% Used';
  }

  @override
  String get walletSafetyTitle => 'Safety & Security';

  @override
  String get walletSafetyBody =>
      'Protected by AES-256 Encryption & Biometric Vault.';

  @override
  String get walletMrKSays => 'Mr. K says';

  @override
  String get walletStatusSuccess => 'Success';

  @override
  String get walletStatusSettled => 'Settled';

  @override
  String get walletStatusRefunded => 'Refunded';

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
  String get payoutsTitle => 'Payouts & Bank Hub';

  @override
  String get payoutsMyAccount => 'My payout account';

  @override
  String get payoutsBankName => 'Bank name';

  @override
  String get payoutsSelectBank => 'Select Bank';

  @override
  String get payoutsSelectReceivingBank => 'Select Receiving Bank';

  @override
  String get payoutsBankCode => 'Bank code';

  @override
  String get payoutsBankCodeHint => '000';

  @override
  String get payoutsAccountNumber => 'Account number';

  @override
  String get payoutsNubanLabel => 'NUBAN Account Number';

  @override
  String get payoutsNubanHint => 'Enter 10-digit NUBAN';

  @override
  String get payoutsNubanHintTablet => 'e.g. 2093847562';

  @override
  String get payoutsSaveAccount => 'Save account';

  @override
  String get payoutsUpdateDetails => 'Update Payout Details';

  @override
  String get payoutsCollectionDetails => 'Pocket collection details';

  @override
  String get payoutsPocketCollections => 'Pocket Collections';

  @override
  String get payoutsReceived => 'Payouts received';

  @override
  String get payoutsViewAllHistory => 'View All History';

  @override
  String get payoutsViewAll => 'View All';

  @override
  String payoutsRef(String ref) {
    return 'REF: $ref';
  }

  @override
  String get payoutsStatusSuccess => 'Success';

  @override
  String get payoutsStatusPending => 'Pending';

  @override
  String get payoutsStatusFailed => 'Failed';

  @override
  String get payoutsCollectionProgress => 'Collection Progress';

  @override
  String get payoutsTotalCollected => 'Total Collected This Month';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsInboxTitle => 'Inbox';

  @override
  String get notificationsInboxSubtitle =>
      'Stay updated with your pocket activities.';

  @override
  String get notificationsEmptyTitle => 'All caught up!';

  @override
  String get notificationsEmptyMessage =>
      'Mr. K has handled everything. Enjoy your peaceful pocket experience!';

  @override
  String get notificationsMarkAllRead => 'Mark all read';

  @override
  String get notificationsFilterAll => 'All';

  @override
  String get notificationsFilterUnreadShort => 'Unread';

  @override
  String notificationsFilterUnread(int count) {
    return 'Unread ($count)';
  }

  @override
  String get notificationsGoalProgress => 'Goal Progress';

  @override
  String get notificationsRelatedPocket => 'Related Pocket';

  @override
  String get notificationsViewDetails => 'View details →';

  @override
  String get notificationsSourceAccount => 'Source Account';

  @override
  String get notificationsAutoDebit => 'Auto-debit active';

  @override
  String get notificationsViewReceipt => 'View Receipt';

  @override
  String get notificationsMarkAsRead => 'Mark as Read';

  @override
  String get notificationsMrKTip => 'Mr. K\'s Tip:';

  @override
  String get notificationsRefresh => 'Refresh View';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String get achievementsMyTitle => 'My Achievements';

  @override
  String get achievementsCurrentMomentum => 'Current Momentum';

  @override
  String get achievementsMomentumSubtitle => 'You\'re staying consistent!';

  @override
  String achievementsStreakValue(int weeks) {
    return '$weeks-week';
  }

  @override
  String get achievementsStreakWord => 'streak';

  @override
  String achievementsStreakHeading(int weeks) {
    return '🔥 $weeks-week streak';
  }

  @override
  String achievementsFreezesHeading(int count) {
    return '🧊 freezes: $count';
  }

  @override
  String achievementsDaysShort(int done, int total) {
    return '$done/$total Days';
  }

  @override
  String achievementsDaysProgress(int done, int total) {
    return '$done / $total days this week';
  }

  @override
  String get achievementsSafetyNet => 'Safety Net';

  @override
  String achievementsFreezesCount(int count) {
    return 'freezes: $count';
  }

  @override
  String get achievementsFreezesAvailable => 'Freezes available';

  @override
  String get achievementsFreezesHint =>
      'Keep your streak alive even on your off-days. Refill in the rewards shop!';

  @override
  String get achievementsBuyMoreFreezes => 'Buy More Freezes';

  @override
  String get achievementsBuyMore => 'Buy More';

  @override
  String get achievementsYourBadges => 'Your Badges';

  @override
  String achievementsEarnedCount(int done, int total) {
    return '$done / $total Earned';
  }

  @override
  String get achievementsOnARoll => 'You\'re on a roll!';

  @override
  String get achievementsMotivationBody =>
      'Keep contributing to your pockets for 2 more weeks to unlock the \'Elite Saver\' diamond badge.';

  @override
  String get achievementsViewPockets => 'View Pockets';

  @override
  String achievementsEliteGoal(int done, int total) {
    return 'Elite Goal: $done/$total Days';
  }

  @override
  String get achievementsUpcomingMilestones => 'Upcoming Milestones';

  @override
  String get achievementsProTip => 'Pro Tip';

  @override
  String get achievementsProTipBody =>
      'Setting up automatic savings boosts your streak reliability by 40%!';

  @override
  String get badgesTitle => 'Badges';

  @override
  String get leaderboardTitle => 'Leaderboard';

  @override
  String get leaderboardSubtitle =>
      'Ranked by contributions — amounts stay private · Resets Monday';

  @override
  String get leaderboardScopeWeek => 'This week';

  @override
  String get leaderboardScopeAllTime => 'All time';

  @override
  String leaderboardPoints(int count) {
    return '$count pts';
  }

  @override
  String leaderboardYourRank(int rank) {
    return 'Your rank #$rank';
  }

  @override
  String leaderboardContributionsCount(int count) {
    return '$count contributions';
  }

  @override
  String get leaderboardFocusMode => 'Focus Mode';

  @override
  String get leaderboardFocusModeDesc =>
      'Focus mode boosts your points by 1.2x during group savings sessions.';

  @override
  String get leaderboardYourStanding => 'Your Standing';

  @override
  String get leaderboardPointsEarned => 'Points Earned';

  @override
  String get leaderboardContributions => 'Contributions';

  @override
  String get leaderboardRecentlyClimbed => 'Recently Climbed';

  @override
  String get leaderboardReferKeens => 'Refer a friend to get 500 Keens! 🪙';

  @override
  String get leaderboardKeensCoin => 'K';

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
  String get rateOrganiserTitle => 'Rate the Organiser';

  @override
  String get rateOrganiserSubtitle =>
      'How helpful has this pocket been for your flow?';

  @override
  String get rateOrganiserCommentLabel => 'Leave a comment (optional)';

  @override
  String get rateOrganiserCommentHint =>
      'What do you love about this organizer?';

  @override
  String rateOrganiserCounter(int count) {
    return '$count / 500';
  }

  @override
  String get rateOrganiserSubmit => 'Submit Review';

  @override
  String get rateOrganiserCancel => 'Cancel';

  @override
  String get trustVouch => 'Vouch';

  @override
  String get trustInviteToPocket => 'Invite to pocket';

  @override
  String get trustRecentRatings => 'Recent Ratings';

  @override
  String get trustViewAll => 'View All';

  @override
  String get trustTopContributor => 'Top 5% Contributor';

  @override
  String trustMemberLine(String date, String rank) {
    return 'Member since $date • $rank';
  }

  @override
  String get trustMascotSays => 'Mr. K Says:';

  @override
  String trustMascotInsight(String name) {
    return '$name is one of our most trusted pioneers! Members with scores above 80 typically finish their goals 2x faster.';
  }

  @override
  String trustVouchFor(String name) {
    return 'Vouch for $name';
  }

  @override
  String get trustHubTitle => 'Reputation Hub';

  @override
  String get trustHubTabOverview => 'Overview';

  @override
  String get trustHubTabHistory => 'History';

  @override
  String get trustHubTabAnalytics => 'Analytics';

  @override
  String get trustHubSearch => 'Search members…';

  @override
  String get trustExcellentStanding => 'Excellent Standing';

  @override
  String trustStandingBody(String name) {
    return '$name has maintained a flawless reputation for 18 months, with zero missed contributions and a 100% group completion rate.';
  }

  @override
  String get trustTopReliablePayer => 'Top 1% Reliable Payer';

  @override
  String get trustInviteToGroup => 'Invite to Group';

  @override
  String get trustReliabilityStats => 'Reliability Stats';

  @override
  String get trustPaymentConsistency => 'Payment Consistency';

  @override
  String get trustGroupsJoined => 'Groups Joined';

  @override
  String get trustCompleted => 'Completed';

  @override
  String trustHubMascotBody(String name) {
    return '\"You\'re a financial superstar, $name! Keep it up.\"';
  }

  @override
  String get trustTopFactors => 'Top Trust Factors';

  @override
  String get trustFactorEarlyPayer => 'Early Payer';

  @override
  String get trustFactorVouches => '10+ Vouches';

  @override
  String get trustFactorKyc => 'KYC Verified';

  @override
  String get trustFactorTenure => 'Long Tenure';

  @override
  String get kycTitle => 'Identity Check!';

  @override
  String get kycWelcomeBody =>
      'Help us keep KeenPocket safe and sound. It only takes a minute!';

  @override
  String get kycPendingTitle => 'Verification Pending';

  @override
  String get kycPendingBody =>
      'Hang tight! We\'re cross-checking your details.';

  @override
  String get kycVerifiedTitle => 'Identity Verified';

  @override
  String get kycFailedTitle => 'Verification Failed';

  @override
  String get kycSelectIdType => 'Select ID Type';

  @override
  String get kycSelectIdTypeFull => 'Select Identification Type';

  @override
  String get kycIdNumber => 'ID Number';

  @override
  String get kycEnterDigits => 'Enter 11 digits';

  @override
  String get kycLast4 => 'We only keep the last 4 digits for your security.';

  @override
  String get kycVerify => 'Verify Identity';

  @override
  String get kycRetry => 'Retry';

  @override
  String get kycPrivacy =>
      'Your data is encrypted using 256-bit AES protocols. We never share your private info with third parties.';

  @override
  String get kycTabletTitle => 'Identity Check';

  @override
  String get kycTabletBody =>
      'Help us secure your pockets! Verify your identity to unlock higher transaction limits and group features.';

  @override
  String get kycStep => 'Step 2 of 3: Document Details';

  @override
  String get kycEnterNumber => 'Enter 11-Digit Number';

  @override
  String get kycEnterNumberHint => '000 000 000 00';

  @override
  String get kycLegalUse =>
      'We\'ll only use this to confirm your legal identity.';

  @override
  String get kycAesEncrypted => 'AES-256 Encrypted';

  @override
  String get kycCbnRegulated => 'CBN Regulated';

  @override
  String get vouchTitle => 'Vouch Requests';

  @override
  String get vouchSubtitle =>
      'Review incoming requests from members wanting to join your pockets.';

  @override
  String vouchRep(int score) {
    return 'Rep $score';
  }

  @override
  String get vouchPending => 'Pending';

  @override
  String get vouchRecommended => 'Recommended';

  @override
  String get vouchJoining => 'joining';

  @override
  String get vouchRecommend => 'Recommend';

  @override
  String get vouchDecline => 'Decline';

  @override
  String get vouchVouched => 'Vouched';

  @override
  String get vouchEmptyTitle => 'No vouch requests yet.';

  @override
  String get vouchEmptyBody =>
      'You\'re all caught up! Take a break, Mr K has everything under control.';

  @override
  String get vouchRefresh => 'Refresh Dashboard';

  @override
  String vouchPendingCount(int count) {
    return 'Pending Vouchers ($count)';
  }

  @override
  String get vouchNewActivity => 'New Activity';

  @override
  String get vouchReputationScore => 'Reputation Score';

  @override
  String get vouchTrustNetwork => 'Trust Network';

  @override
  String vouchVouchedStat(int count) {
    return '$count Vouched';
  }

  @override
  String vouchMutual(int count) {
    return '$count Mutual Connections';
  }

  @override
  String get vouchSavingConsistency => 'Saving Consistency';

  @override
  String get vouchCommunityActivity => 'Community Activity';

  @override
  String get vouchRequestNote => 'Request Note';

  @override
  String vouchMemberSince(String year) {
    return 'Member since $year';
  }

  @override
  String vouchMemberLine(String location, String year) {
    return '$location • Member since $year';
  }

  @override
  String vouchReputation(int score) {
    return 'Reputation: $score';
  }

  @override
  String get discoverTitle => 'Discover';

  @override
  String get discoverSearchHint => 'Search pockets & circles';

  @override
  String get discoverEmptyTitle => 'No results';

  @override
  String get discoverEmptyMessage => 'Try a different search term.';

  @override
  String get discoverSearchPlaceholder => 'Search pockets & adashi…';

  @override
  String get discoverFilterTrending => 'Trending';

  @override
  String get discoverFilterSchoolFees => 'School Fees';

  @override
  String get discoverFilterGroceries => 'Groceries';

  @override
  String get discoverFilterTravel => 'Travel';

  @override
  String get discoverPopularPockets => 'Popular Pockets';

  @override
  String get discoverViewAll => 'View all';

  @override
  String get discoverContribution => 'Contribution';

  @override
  String get discoverMembers => 'Members';

  @override
  String get discoverStartDate => 'Start Date';

  @override
  String discoverAdmin(String name) {
    return 'Admin: $name';
  }

  @override
  String get discoverBadgeKyc => 'KYC Verified';

  @override
  String get discoverBadgeOfficial => 'Official';

  @override
  String get discoverBadgeAdashi => 'Adashi';

  @override
  String get discoverJoin => 'Join';

  @override
  String discoverRating(String rating) {
    return '($rating)';
  }

  @override
  String discoverPerUnit(String unit) {
    return '/$unit';
  }

  @override
  String get discoverTipTitle => 'Mr K\'s Tip!';

  @override
  String get discoverTip =>
      'Always check for the verified badge when joining public pockets!';

  @override
  String exploreManagedBy(String name) {
    return 'Managed by $name';
  }

  @override
  String exploreRep(String rating) {
    return '$rating Rep';
  }

  @override
  String exploreMembersCount(int count) {
    return '$count Members';
  }

  @override
  String explorePerCycle(String amount) {
    return '$amount / cycle';
  }

  @override
  String exploreCycleLength(int days) {
    return '$days-day cycle';
  }

  @override
  String get exploreAdminManaged => 'Admin-managed — ask to be added';

  @override
  String get exploreCircleRules => 'Circle Rules';

  @override
  String get exploreJoinCircle => 'Join Circle';

  @override
  String get exploreMrKSays => 'Mr. K says:';

  @override
  String get exploreVitalStats => 'Circle Vital Stats';

  @override
  String get exploreMembersLabel => 'Members';

  @override
  String get explorePerCycleLabel => 'Per Cycle';

  @override
  String get exploreCycleLengthLabel => 'Cycle Length';

  @override
  String exploreMembersOfCapacity(int filled, int total) {
    return '$filled/$total';
  }

  @override
  String exploreDaysValue(int days) {
    return '$days Days';
  }

  @override
  String get exploreNextPayout => 'Next Payout Progress';

  @override
  String get exploreRatingLabel => 'Rating';

  @override
  String get exploreCirclesLabel => 'Circles';

  @override
  String get exploreCompletionLabel => 'Completion';

  @override
  String exploreCircleOrganiser(String circle) {
    return '$circle Organiser';
  }

  @override
  String get exploreLimitedSpots => 'Limited spots available.';

  @override
  String get insightsTitle => 'Insights & Reports';

  @override
  String get insightsYearInReview => 'Year in Review';

  @override
  String get insightsHeroBody =>
      'Wow! You\'ve had an incredible year of smart saving and generous giving, Mr. K is proud!';

  @override
  String get insightsTotalSaved => 'Total Saved ₦';

  @override
  String get insightsTotalSavedCaption => 'verified contributions';

  @override
  String get insightsSavedThisYear => 'Saved This Year ₦';

  @override
  String get insightsSavedThisYearCaption => '24% increase from 2023';

  @override
  String get insightsDonated => 'Donated (Sadaqah) ₦';

  @override
  String get insightsDonatedCaption => 'making a difference';

  @override
  String get insightsContributions => 'Contributions';

  @override
  String get insightsContributionsCaption => 'verified transactions';

  @override
  String get insightsPockets => 'Pockets';

  @override
  String get insightsPocketsCaption => 'active goals';

  @override
  String get insightsAdashi => 'Adashi';

  @override
  String get insightsAdashiCaption => 'community circles';

  @override
  String get insightsFootnote =>
      'KeenPocket keeps the records — it never holds your money.';

  @override
  String get insightsShareMyYear => 'Share My Year';

  @override
  String get insightsMrKAdvice => 'Mr. K\'s Advice';

  @override
  String get insightsMrKAdviceBody =>
      'Building wealth is a marathon, not a sprint. Your consistency this year is truly inspiring. Why not aim for a 5% increase in your Sadaqah next month?';

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
  String get referEarnTitle => 'Refer & Earn';

  @override
  String get referEarnHeroTitle => 'Bring your circle along 🎁';

  @override
  String get referEarnHeroBody =>
      'Earn rewards together! Invite your friends and get 50 keens for every referral that starts saving.';

  @override
  String get referEarnLimitedOffer => 'Limited Time Offer';

  @override
  String get referEarnInviteLink => 'Your Invite Link';

  @override
  String get referEarnCopy => 'Copy';

  @override
  String get referEarnReferralCode => 'Referral Code';

  @override
  String get referEarnShareWhatsApp => 'Share on WhatsApp';

  @override
  String get referEarnInvited => 'Invited';

  @override
  String get referEarnQualified => 'Qualified';

  @override
  String get referEarnRewarded => 'Rewarded';

  @override
  String get referEarnYourCircle => 'Your Circle';

  @override
  String get referEarnInviteMore => 'Invite more friends!';

  @override
  String get referEarnInviteMoreFriends => 'Invite More Friends';

  @override
  String get referEarnStatusPending => 'Pending';

  @override
  String get referEarnStatusQualified => 'Qualified';

  @override
  String get referEarnStatusRewarded => 'Rewarded';

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
    return '$percent% Reached';
  }

  @override
  String get charityEnterAmount => 'Enter Donation Amount';

  @override
  String get charityDonateNow => 'Donate Now';

  @override
  String get charitySecure => 'Your contribution is secure and transparent.';

  @override
  String get charityFinancialGoal => 'Financial Goal';

  @override
  String get charityResourceGoal => 'Resource Goal';

  @override
  String charityItemsProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get charityDonateItems => 'Donate Items';

  @override
  String get charitySelectItem => 'Select Item';

  @override
  String get charityQty => 'Qty';

  @override
  String get charityPledgeItems => 'Pledge Items';

  @override
  String get charityRecentContributions => 'Recent Contributions';

  @override
  String get charityViewAll => 'View All';

  @override
  String get charityMascotTitle => 'Mr. K says: \"You\'re a Hero!\"';

  @override
  String get charityMascotBody =>
      'Small acts, when multiplied by millions of people, can transform the world. Thank you for your kindness!';

  @override
  String get charityHeroSubtitle =>
      'Help us provide essential supplies to those in need. Every contribution brings us closer to our goal.';

  @override
  String get charityMakeContribution => 'Make a Contribution';

  @override
  String get charityTabMoney => 'Money';

  @override
  String get charityTabResources => 'Resources';

  @override
  String get charityAddNote => 'Add a Note (Optional)';

  @override
  String get charityAddNoteHint => 'Write something inspiring…';

  @override
  String get charitySecuredPay =>
      'Secured with KeenPocket Pay. No transaction fees.';

  @override
  String get charityRecentHeroes => 'Recent Heroes';

  @override
  String get charitySetupTitle => 'Charity Drive Setup';

  @override
  String get charitySetupGreetingTitle => 'Hi! I\'m Mr. K';

  @override
  String get charitySetupGreetingBody =>
      'Let\'s set up something amazing together. Every bit counts!';

  @override
  String get charityDriveTitleLabel => 'Drive Title';

  @override
  String get charityDriveTitleHint => 'e.g., Winter Warmth Initiative';

  @override
  String get charityDescriptionLabel => 'Description';

  @override
  String get charityDescriptionHint =>
      'Tell your donors what this drive is about…';

  @override
  String get charityGoalTypeLabel => 'Goal Type';

  @override
  String get charityGoalTypeAmount => 'Amount';

  @override
  String get charityGoalTypeItems => 'Items';

  @override
  String get charityTargetAmountLabel => 'Target Amount (₦)';

  @override
  String get charityTargetAmountHint => '50,000';

  @override
  String get charityItemNameLabel => 'Item Name';

  @override
  String get charityUnitLabel => 'Unit';

  @override
  String get charityAddAnotherItem => 'Add Another Item';

  @override
  String get charityShowBreakdown => 'Show donor breakdown';

  @override
  String get charityShowBreakdownSub => 'Let people see who donated what';

  @override
  String get charityProTipLabel => 'Pro Tip:';

  @override
  String get charityProTipBody =>
      'Drives with clear descriptions and visual item lists usually get 40% more engagement!';

  @override
  String get charitySaveDrive => 'Save Drive';

  @override
  String get charityDonateTitle => 'Donation';

  @override
  String get charityActiveRelief => 'Active Relief';

  @override
  String get charityDonateTabletDescription =>
      'Join our community pocket to provide urgent medical aid and logistical support for families displaced by recent climate events. Every contribution counts toward our collective goal.';

  @override
  String get charityMascotImpact =>
      'You\'re making a huge impact! This pocket has grown 15% since yesterday. Let\'s keep the momentum going!';

  @override
  String get charityEnterAmountTablet => 'Enter Amount';

  @override
  String get charityResourceLabel => 'Resource';

  @override
  String get charityCreateDriveTitle => 'Create Your Drive';

  @override
  String get charityCreateDriveSubtitle =>
      'Help others by setting up a focused savings target.';

  @override
  String get charityGoalTypeAmountFull => 'Amount (₦)';

  @override
  String get charityGoalTypeItemsFull => 'Items Target';

  @override
  String get charitySetupTabletTip =>
      'Setting a clear, realistic goal helps donors feel more confident! Drives with detailed descriptions raise 40% more on KeenPocket.';

  @override
  String get charityLivePreview => 'Live Preview';

  @override
  String get charityTrending => 'Trending';

  @override
  String get charitySupportDrive => 'Support Drive';

  @override
  String get charityLaunchDrive => 'Launch Charity Drive';

  @override
  String get charitySaveDraft => 'Save as Draft';

  @override
  String charityTargetLabel(String amount) {
    return 'Target: $amount';
  }

  @override
  String get charityPreviewTitleFallback => 'Your Charity Title';

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
  String get planCreateTitle => 'New Plan';

  @override
  String get planCreateSubtitle =>
      'Let\'s map out your next financial journey!';

  @override
  String get planCreateMascotTip =>
      '\"Planning is the first step to winning, champion!\" — Mr. K';

  @override
  String get planTitleLabel => 'Plan Title';

  @override
  String get planTitleHint => 'e.g. Dream Vacation 2024';

  @override
  String get planPeriodType => 'Period Type';

  @override
  String get planPeriodMonth => 'Month';

  @override
  String get planPeriodYear => 'Year';

  @override
  String get planSelectMonthYear => 'Select Month & Year';

  @override
  String get planTargetBudget => 'Target Budget (Optional)';

  @override
  String get planBudgetHint => '0.00';

  @override
  String get planSmartTip =>
      'Smart Tip: Any items you carry over from previous plans will automatically get a ⭐ STAR PRIORITY status!';

  @override
  String get planCarryOver => 'Carry over deferred items';

  @override
  String get planCarryOverSubtitle => 'Include unfinished items from last plan';

  @override
  String get planCreateSubmit => 'Create Plan';

  @override
  String get planPoweredBy => 'Powered by KeenPocket Intelligence';

  @override
  String get planSaveDraft => 'Save Draft';

  @override
  String get planCreateMyPlan => 'Create My Plan';

  @override
  String get planReadyToSave => 'Ready to save, Chef?';

  @override
  String get planReadyToSaveBody =>
      'Setting a clear period and budget helps me find the best deals for your household this season!';

  @override
  String get planTabletTitle => 'Grocery Plan';

  @override
  String get planTabletSubtitle => 'Savings Cockpit • Design your budget flow';

  @override
  String get planStarPriorityTip => 'Smart Tip: Star Priority';

  @override
  String get planStarPriorityTipBody =>
      'Mark items with a Star Priority to ensure they are funded first in your Savings Cockpit.';

  @override
  String get planStatDuration => 'Plan Duration';

  @override
  String get planStatDurationValue => '31 Days';

  @override
  String get planStatAvgItems => 'Avg. Items';

  @override
  String get planStatAvgItemsValue => '42 Units';

  @override
  String get planStatEstSavings => 'Est. Savings';

  @override
  String get planStatEstSavingsValue => '12% Boost';

  @override
  String planDetailPlanningPeriod(String period) {
    return 'Planning Period: $period';
  }

  @override
  String get planDetailPersonalPlan => 'Personal Plan';

  @override
  String get planDetailDraft => 'Draft';

  @override
  String get planDetailTotalItems => 'Total Items';

  @override
  String get planDetailBought => 'Bought';

  @override
  String get planDetailDeferred => 'Deferred';

  @override
  String get planDetailEstimated => 'Estimated';

  @override
  String get planDetailBudgetHealth => 'Budget Health';

  @override
  String planDetailSpentOf(String spent, String budget) {
    return 'Spent: $spent / $budget';
  }

  @override
  String get planDetailItemChecklist => 'Item Checklist';

  @override
  String planItemQtyPrice(int qty, String price) {
    return '$qty × $price';
  }

  @override
  String get planItemPurchased => 'Purchased';

  @override
  String get planItemPending => 'Pending';

  @override
  String get planItemDeferred => 'Deferred';

  @override
  String get planItemBuyIt => 'I\'ll buy it';

  @override
  String get planItemReactivate => 'Re-activate';

  @override
  String get planAddNewItem => 'Add New Item';

  @override
  String get planItemNameHint => 'Item name (e.g. Milk)';

  @override
  String get planItemQtyHint => 'Qty';

  @override
  String get planAddItem => 'Add';

  @override
  String get planSharedWith => 'Shared with';

  @override
  String planCollaboratorsCount(int count) {
    return '$count Collaborators';
  }

  @override
  String get planRoleOwner => 'Owner';

  @override
  String get planRoleCollaborator => 'Collaborator';

  @override
  String get planInviteLabel => 'Invite via Email or Phone';

  @override
  String get planInviteHint => 'example@email.com';

  @override
  String get planInviteSend => 'Send';

  @override
  String get planQuickAdd => 'Quick Add';

  @override
  String get planColStatus => 'Status';

  @override
  String get planColItem => 'Item Description';

  @override
  String get planColCategory => 'Category';

  @override
  String get planColPrice => 'Price';

  @override
  String get planColActions => 'Actions';

  @override
  String get planGreatList => 'Great list!';

  @override
  String get planGreatListBody =>
      'You\'re crushing your savings goal this week!';

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
    return '$count Members Online';
  }

  @override
  String get groupChatEmptyTitle => 'No messages yet — say hello 👋';

  @override
  String get groupChatEmptyMessage =>
      'Be the first one to start the conversation and keep the saving energy high!';

  @override
  String get groupChatStartChatting => 'Start Chatting';

  @override
  String get groupChatTypeMessage => 'Type a message…';

  @override
  String get groupChatToday => 'Today';

  @override
  String get groupChatMessages => 'Messages';

  @override
  String get groupChatFindGroup => 'Find a group…';

  @override
  String get groupChatCircleVitalStats => 'Circle Vital Stats';

  @override
  String get groupChatPayoutProgress => 'Payout Progress';

  @override
  String get groupChatNext => 'NEXT';

  @override
  String get groupChatMembers => 'Members';

  @override
  String get groupChatViewAll => 'View All';

  @override
  String get groupChatSharedMedia => 'Shared Media';

  @override
  String get groupChatMascotTyping => 'Mr. K is cheering you on…';

  @override
  String get groupChatMascotTitle => 'Keep the saving energy high!';

  @override
  String get groupChatMascotBody =>
      'You\'re only ₦50 away from this month\'s goal badge.';

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
  String get disputeStatusActive => 'Active';

  @override
  String disputesOpenLabel(int count) {
    return '$count Open';
  }

  @override
  String get disputesAdminView => 'Admin View';

  @override
  String get disputesResolveCase => 'Resolve Case';

  @override
  String get disputesDismissAction => 'Dismiss';

  @override
  String get disputesResolutionNoteLabel => 'Resolution Note';

  @override
  String get disputesResolutionPlaceholder => 'Explain the resolution…';

  @override
  String get disputesEmptyTitle => 'No disputes 🤝';

  @override
  String get disputesEmptyMessage =>
      'Everything is running smoothly in this group.';

  @override
  String get disputesSubject => 'Subject';

  @override
  String get disputesSubjectHint => 'e.g. Late Payout';

  @override
  String get disputesDescription => 'Description';

  @override
  String get disputesDescriptionHint => 'Tell us what\'s happening…';

  @override
  String get disputesRaiseInfo =>
      'Disputes are reviewed by group admins. Please ensure all details are accurate before submitting.';

  @override
  String get disputesSubmit => 'Submit Dispute';

  @override
  String get disputesHubTitle => 'Disputes Hub';

  @override
  String disputesAllCases(int count) {
    return 'All Cases ($count)';
  }

  @override
  String get disputesFilterActive => 'Active';

  @override
  String disputesRaisedBy(String name) {
    return 'Raised by $name';
  }

  @override
  String disputesCaseNumber(String id) {
    return 'CASE #$id';
  }

  @override
  String get disputesActiveInvestigation => 'Active Investigation';

  @override
  String get disputesResolutionDraft => 'Resolution Note (Draft)';

  @override
  String get disputesCaseTimeline => 'Case Timeline';

  @override
  String get disputesMrKSays => 'MR. K SAYS:';

  @override
  String get profileSchool => 'School';

  @override
  String get profileAdmin => 'Administration';

  @override
  String get schoolTitle => 'School';

  @override
  String get schoolFeesTitle => 'School Fees';

  @override
  String get schoolClasses => 'Classes';

  @override
  String get schoolStudents => 'Students';

  @override
  String get schoolFeesCollected => 'Fees collected';

  @override
  String schoolExpected(String amount) {
    return 'Expected: $amount';
  }

  @override
  String get schoolRecordFees => 'Record Fees';

  @override
  String get schoolNewPaymentEntry => 'New payment entry';

  @override
  String get schoolQuickEntry => 'Quick Entry';

  @override
  String get schoolCollectionTrend => 'Collection Trend';

  @override
  String get schoolGreatWork => 'Great work, Owner!';

  @override
  String schoolOwnerProgress(int percent) {
    return 'You\'ve collected $percent% of all projected fees for the current academic session. Keep pushing!';
  }

  @override
  String get schoolHeroBody =>
      'Your collection cycle is progressing beautifully. You\'re halfway to this year\'s funding goal!';

  @override
  String get schoolYearlyProgress => 'Yearly Progress';

  @override
  String get schoolRecordFeesBody =>
      'Update student payment records instantly for real-time tracking.';

  @override
  String get schoolActiveCycle => 'Active Cycle';

  @override
  String get schoolUpcomingCycle => 'Upcoming Cycle';

  @override
  String schoolPercentComplete(int percent) {
    return '$percent% COMPLETE';
  }

  @override
  String get schoolCollected => 'COLLECTED';

  @override
  String get schoolTarget => 'TARGET';

  @override
  String get schoolViewReport => 'View Detailed Report';

  @override
  String get schoolManageEnrollments => 'Manage Enrollments';

  @override
  String get schoolAcademicYear => 'Academic Year 2023/24';

  @override
  String get schoolNetSurplus => 'Net Surplus';

  @override
  String get schoolUnpaidFees => 'Unpaid Fees';

  @override
  String get schoolAdminProfile => 'Admin Profile';

  @override
  String get schoolOwnerRole => 'School Owner';

  @override
  String get schoolIntegratedView => 'Integrated School View';

  @override
  String get schoolIntegratedViewBody =>
      'Seamlessly manage your school\'s financial health in one place.';

  @override
  String get myChildrenHeading => 'My Children';

  @override
  String get myChildrenSubtitle =>
      'Manage tuition fees and payment plans for your dependents.';

  @override
  String get myChildrenAddDependent => 'Add New Dependent';

  @override
  String myChildrenFeeDetail(String fee, String paid, String balance) {
    return 'Fee $fee · Paid $paid · Balance $balance';
  }

  @override
  String myChildrenPlan(String plan) {
    return 'Plan: $plan';
  }

  @override
  String get myChildrenPayFees => 'Pay Fees';

  @override
  String get myChildrenPayFeesNow => 'Pay Fees Now';

  @override
  String get myChildrenPaidUp => 'Paid Up';

  @override
  String get myChildrenFeeProgress => 'Fee Progress';

  @override
  String get myChildrenCurrentTermBalance => 'Current Term Balance';

  @override
  String get myChildrenStatusPaid => 'PAID';

  @override
  String get myChildrenStatusPartial => 'PARTIAL';

  @override
  String get myChildrenStatusUnpaid => 'UNPAID';

  @override
  String get myChildrenLockInTitle => 'Never miss a term';

  @override
  String get myChildrenLockInMessage =>
      'Our \'Lock-In\' feature lets you set aside tuition money daily so you\'re never caught off guard.';

  @override
  String myChildrenPaidUpStatus(String term) {
    return '$term Paid Up';
  }

  @override
  String myChildrenNextInvoice(int days) {
    return 'Next invoice in $days days';
  }

  @override
  String get myChildrenViewReceipts => 'View Receipts';

  @override
  String myChildrenDocumentsFound(int count) {
    return '$count documents found';
  }

  @override
  String get myChildrenAccountStatement => 'Account Statement';

  @override
  String get myChildrenRegisterChild => 'Register Child';

  @override
  String get myChildrenRegisterChildBody =>
      'Link a new school profile to your account';

  @override
  String get myChildrenSmartSavings => 'Smart Savings';

  @override
  String get myChildrenSmartSavingsTitle =>
      'Save early for next term and get 5% cashback';

  @override
  String get myChildrenStartSaving => 'Start Saving Now';

  @override
  String get myChildrenEmptyTitle => 'No children linked!';

  @override
  String get myChildrenEmptyMessage =>
      'Mr. K can\'t find your little ones. Link your children to track their school fees effortlessly.';

  @override
  String get myChildrenLinkChild => 'Link a Child';

  @override
  String get createSchoolTitle => 'School Fees';

  @override
  String get createSchoolHeroTitle => 'Build Your School!';

  @override
  String get createSchoolHeroBody =>
      'Fill in the details below to register your institution on KeenPocket. It\'s fast and easy!';

  @override
  String get createSchoolIdentity => 'School Identity';

  @override
  String get createSchoolName => 'School Name';

  @override
  String get createSchoolNameHint => 'e.g. St. Peter\'s Academy';

  @override
  String get createSchoolContact => 'Contact Number';

  @override
  String get createSchoolContactHint => '+234 800 000 0000';

  @override
  String get createSchoolAddress => 'Address';

  @override
  String get createSchoolAddressHint => 'Street name, City, State';

  @override
  String get createSchoolLogo => 'School Logo';

  @override
  String get createSchoolLogoHint => 'Click to upload SVG or PNG';

  @override
  String get createSchoolLogoSize => 'Dimension: 512x512px';

  @override
  String get createSchoolBackground => 'Background Image';

  @override
  String get createSchoolBackgroundHint => 'Click to upload banner';

  @override
  String get createSchoolBackgroundSize => 'Dimension: 1200x400px';

  @override
  String get createSchoolPayoutDetails => 'Payout Details';

  @override
  String get createSchoolBankName => 'Bank Name';

  @override
  String get createSchoolSelectBank => 'Select Bank';

  @override
  String get createSchoolNuban => 'NUBAN (Account Number)';

  @override
  String get createSchoolNubanHint => '10-digit number';

  @override
  String get createSchoolAccountName => 'Account Name';

  @override
  String get createSchoolAccountNameHint => 'As seen on bank statement';

  @override
  String get createSchoolCost => 'Creating a school costs 50 Keens';

  @override
  String get createSchoolCostLead => 'Creating a school costs';

  @override
  String get createSchoolCostAmount => '50 Keens';

  @override
  String get createSchoolCta => 'Create School';

  @override
  String get createSchoolLivePreview => 'Live Preview';

  @override
  String get createSchoolPreviewSubtitle => 'How parents see your school';

  @override
  String get createSchoolRating => 'Rating';

  @override
  String get createSchoolTerms =>
      'By clicking create, you agree to our Terms of Service.';

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

  @override
  String get adminConsoleTitle => 'Super Admin Console';

  @override
  String get adminConsoleSubtitle =>
      'Manage users, schools, and the global economy.';

  @override
  String get adminCreateAdmin => 'Create Admin';

  @override
  String get adminUserManagement => 'User Management';

  @override
  String get adminSearchHint => 'Search name, email, phone...';

  @override
  String get adminCanCreateSchool => 'Can Create School';

  @override
  String get adminGrant => 'Grant';

  @override
  String get adminRevoke => 'Revoke';

  @override
  String get adminRoleStandardUser => 'Standard User';

  @override
  String get adminRoleEducator => 'Educator';

  @override
  String get adminSchools => 'Schools';

  @override
  String get adminViewAll => 'View All';

  @override
  String get adminSchoolOpen => 'Open';

  @override
  String get adminSchoolClosed => 'Closed';

  @override
  String get adminKeensEconomy => 'Keens Economy';

  @override
  String get adminCoinsEnabled => 'Coins enabled';

  @override
  String get adminCoinsToggle => 'Global transaction toggle';

  @override
  String get adminPocketCost => 'Pocket Cost';

  @override
  String get adminAdashisCost => 'Adashis Cost';

  @override
  String get adminSchoolsCost => 'Schools Cost';

  @override
  String get adminKeensUnit => 'KEENS';

  @override
  String get adminSaveEconomy => 'Save Economy Settings';

  @override
  String get adminDailyUsers => 'Daily Users';

  @override
  String get adminSchoolsStat => 'Schools';

  @override
  String get organiserTitle => 'Organiser Dashboard';

  @override
  String get organiserGreeting => 'Morning, Organiser! 👋';

  @override
  String organiserGreetingNote(int count) {
    return 'Mr. K has analyzed your $count active pockets. Everything is looking bright, though a few spots might need your magic touch.';
  }

  @override
  String get organiserCreatePocket => 'Create New Pocket';

  @override
  String get organiserDownloadCsv => 'Download CSV';

  @override
  String get organiserTotalManaged => 'Total Managed';

  @override
  String organiserManagedDelta(int pct) {
    return '$pct% vs last month';
  }

  @override
  String get organiserActiveMembers => 'Active Members';

  @override
  String organiserNewToday(int count) {
    return '$count new today';
  }

  @override
  String get organiserUrgentActions => 'Urgent Actions';

  @override
  String organiserUrgentItems(int count) {
    return '$count Items';
  }

  @override
  String get organiserRequiresVerification => 'Requires verification';

  @override
  String get organiserPocketHealth => 'Pocket Health Dashboard';

  @override
  String get organiserTypeAdashi => 'Adashi';

  @override
  String get organiserTypeSavings => 'Savings Pocket';

  @override
  String organiserMembers(int count) {
    return '$count Members';
  }

  @override
  String get organiserCollected => 'Collected';

  @override
  String organiserHealthPending(int count) {
    return '$count pending';
  }

  @override
  String organiserHealthAtRisk(int count) {
    return '$count at risk';
  }

  @override
  String organiserHealthOverdue(int count) {
    return '$count overdue';
  }

  @override
  String get organiserHealthHealthy => 'Healthy';

  @override
  String get organiserStartNewPocket => 'Start New Pocket';

  @override
  String get organiserStartNewPocketBody =>
      'Bring your community together for a new goal.';

  @override
  String get organiserPulseChecklist => 'Pulse Checklist';

  @override
  String get organiserReview => 'Review';

  @override
  String get organiserSendNudge => 'Send Nudge';
}
