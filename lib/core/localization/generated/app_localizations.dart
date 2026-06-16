import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// The application name.
  ///
  /// In en, this message translates to:
  /// **'KeenPockets'**
  String get appName;

  /// Login button / screen title.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Greeting shown after a successful login.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}!'**
  String welcomeBack(String name);

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'you@example.com'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @validationEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required.'**
  String get validationEmailRequired;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get validationPasswordRequired;

  /// No description provided for @validationPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters.'**
  String get validationPasswordTooShort;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Check your network and retry.'**
  String get errorNetwork;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Our servers had a problem. Please try again shortly.'**
  String get errorServer;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again.'**
  String get errorUnauthorized;

  /// No description provided for @errorPermission.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to do that.'**
  String get errorPermission;

  /// No description provided for @errorFeatureDisabled.
  ///
  /// In en, this message translates to:
  /// **'This feature is coming soon.'**
  String get errorFeatureDisabled;

  /// No description provided for @errorCache.
  ///
  /// In en, this message translates to:
  /// **'Could not read saved data.'**
  String get errorCache;

  /// No description provided for @errorValidation.
  ///
  /// In en, this message translates to:
  /// **'Please correct the highlighted fields.'**
  String get errorValidation;

  /// No description provided for @comingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoonTitle;

  /// No description provided for @comingSoonMessage.
  ///
  /// In en, this message translates to:
  /// **'We are still building this. Check back shortly.'**
  String get comingSoonMessage;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @emptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get emptyTitle;

  /// No description provided for @emptyMessage.
  ///
  /// In en, this message translates to:
  /// **'When there is data to show, it will appear here.'**
  String get emptyMessage;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get loading;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @pocketsTitle.
  ///
  /// In en, this message translates to:
  /// **'Pockets'**
  String get pocketsTitle;

  /// No description provided for @pocketsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No pockets yet'**
  String get pocketsEmptyTitle;

  /// No description provided for @pocketsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Pockets you create or join will appear here.'**
  String get pocketsEmptyMessage;

  /// No description provided for @pocketMembersCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No members} =1{1 member} other{{count} members}}'**
  String pocketMembersCount(int count);

  /// No description provided for @pocketHandsFilled.
  ///
  /// In en, this message translates to:
  /// **'{filled}/{total} hands filled'**
  String pocketHandsFilled(int filled, int total);

  /// No description provided for @pocketHandPrice.
  ///
  /// In en, this message translates to:
  /// **'Hand price'**
  String get pocketHandPrice;

  /// No description provided for @pocketOrganiser.
  ///
  /// In en, this message translates to:
  /// **'Organiser'**
  String get pocketOrganiser;

  /// No description provided for @roleOrganiser.
  ///
  /// In en, this message translates to:
  /// **'Organiser'**
  String get roleOrganiser;

  /// No description provided for @roleMember.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get roleMember;

  /// No description provided for @roleGuest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get roleGuest;

  /// No description provided for @contributionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Contributions'**
  String get contributionsTitle;

  /// No description provided for @contributeTitle.
  ///
  /// In en, this message translates to:
  /// **'Contribute'**
  String get contributeTitle;

  /// No description provided for @contributeAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount (₦)'**
  String get contributeAmountLabel;

  /// No description provided for @contributeAmountHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 5000'**
  String get contributeAmountHint;

  /// No description provided for @contributeSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit contribution'**
  String get contributeSubmit;

  /// No description provided for @contributeAmountInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter an amount greater than zero.'**
  String get contributeAmountInvalid;

  /// No description provided for @contributionSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Contribution submitted.'**
  String get contributionSubmitted;

  /// No description provided for @invoicesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No contributions yet'**
  String get invoicesEmptyTitle;

  /// No description provided for @invoicesEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Contributions for this group will appear here.'**
  String get invoicesEmptyMessage;

  /// No description provided for @invoiceStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get invoiceStatusPending;

  /// No description provided for @invoiceStatusVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get invoiceStatusVerified;

  /// No description provided for @invoiceStatusDeclined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get invoiceStatusDeclined;

  /// No description provided for @invoiceVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get invoiceVerify;

  /// No description provided for @invoiceDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get invoiceDecline;

  /// No description provided for @offlineBanner.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline — changes will sync when you reconnect.'**
  String get offlineBanner;

  /// No description provided for @adashiTitle.
  ///
  /// In en, this message translates to:
  /// **'Adashi'**
  String get adashiTitle;

  /// No description provided for @adashiEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No circles yet'**
  String get adashiEmptyTitle;

  /// No description provided for @adashiEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Rotating savings circles you join will appear here.'**
  String get adashiEmptyMessage;

  /// No description provided for @adashiPerCycle.
  ///
  /// In en, this message translates to:
  /// **'Per cycle'**
  String get adashiPerCycle;

  /// No description provided for @adashiCycleProgress.
  ///
  /// In en, this message translates to:
  /// **'Cycle {current} of {total}'**
  String adashiCycleProgress(int current, int total);

  /// No description provided for @adashiModeAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto rotation'**
  String get adashiModeAuto;

  /// No description provided for @adashiModeManual.
  ///
  /// In en, this message translates to:
  /// **'Manual rotation'**
  String get adashiModeManual;

  /// No description provided for @adashiCurrentReceiver.
  ///
  /// In en, this message translates to:
  /// **'Current receiver: {name}'**
  String adashiCurrentReceiver(String name);

  /// No description provided for @adashiRotationTitle.
  ///
  /// In en, this message translates to:
  /// **'Rotation'**
  String get adashiRotationTitle;

  /// No description provided for @rotationReceived.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get rotationReceived;

  /// No description provided for @rotationCurrent.
  ///
  /// In en, this message translates to:
  /// **'Receiving'**
  String get rotationCurrent;

  /// No description provided for @rotationUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get rotationUpcoming;

  /// No description provided for @profileWallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get profileWallet;

  /// No description provided for @profileNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileNotifications;

  /// No description provided for @profileAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get profileAchievements;

  /// No description provided for @profileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

  /// No description provided for @profileReputation.
  ///
  /// In en, this message translates to:
  /// **'Reputation'**
  String get profileReputation;

  /// No description provided for @profileKeens.
  ///
  /// In en, this message translates to:
  /// **'{count} Keens'**
  String profileKeens(int count);

  /// No description provided for @profileKycVerified.
  ///
  /// In en, this message translates to:
  /// **'KYC verified'**
  String get profileKycVerified;

  /// No description provided for @walletTitle.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get walletTitle;

  /// No description provided for @walletBalance.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get walletBalance;

  /// No description provided for @walletTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get walletTransactions;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up'**
  String get notificationsEmptyTitle;

  /// No description provided for @notificationsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'New notifications will show up here.'**
  String get notificationsEmptyMessage;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get notificationsMarkAllRead;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @badgesTitle.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get badgesTitle;

  /// No description provided for @leaderboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get leaderboardTitle;

  /// No description provided for @profileTrust.
  ///
  /// In en, this message translates to:
  /// **'Trust & reputation'**
  String get profileTrust;

  /// No description provided for @profileFriends.
  ///
  /// In en, this message translates to:
  /// **'Friends & Invites'**
  String get profileFriends;

  /// No description provided for @profileLegal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get profileLegal;

  /// No description provided for @trustTitle.
  ///
  /// In en, this message translates to:
  /// **'Trust & reputation'**
  String get trustTitle;

  /// No description provided for @trustReputationScore.
  ///
  /// In en, this message translates to:
  /// **'Reputation score'**
  String get trustReputationScore;

  /// No description provided for @trustRatingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Ratings'**
  String get trustRatingsTitle;

  /// No description provided for @trustRatingsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No ratings yet'**
  String get trustRatingsEmpty;

  /// No description provided for @discoverTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discoverTitle;

  /// No description provided for @discoverSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search pockets & circles'**
  String get discoverSearchHint;

  /// No description provided for @discoverEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get discoverEmptyTitle;

  /// No description provided for @discoverEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term.'**
  String get discoverEmptyMessage;

  /// No description provided for @friendsTitle.
  ///
  /// In en, this message translates to:
  /// **'Friends & Invites'**
  String get friendsTitle;

  /// No description provided for @friendsInviteTitle.
  ///
  /// In en, this message translates to:
  /// **'Invite friends'**
  String get friendsInviteTitle;

  /// No description provided for @friendsInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Your invite code: {code}'**
  String friendsInviteCode(String code);

  /// No description provided for @friendsShare.
  ///
  /// In en, this message translates to:
  /// **'Share invite'**
  String get friendsShare;

  /// No description provided for @friendsRequests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get friendsRequests;

  /// No description provided for @friendsList.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get friendsList;

  /// No description provided for @friendsPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get friendsPending;

  /// No description provided for @friendsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No connections yet'**
  String get friendsEmptyTitle;

  /// No description provided for @friendsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Invite people to start saving together.'**
  String get friendsEmptyMessage;

  /// No description provided for @friendAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get friendAccept;

  /// No description provided for @friendDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get friendDecline;

  /// No description provided for @legalTitle.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legalTitle;

  /// No description provided for @legalTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get legalTerms;

  /// No description provided for @legalPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get legalPrivacy;

  /// No description provided for @legalDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get legalDeleteAccount;

  /// No description provided for @legalDeleteWarning.
  ///
  /// In en, this message translates to:
  /// **'Account deletion is permanent and cannot be undone.'**
  String get legalDeleteWarning;

  /// No description provided for @legalPlaceholderBody.
  ///
  /// In en, this message translates to:
  /// **'The full document will be bundled here.'**
  String get legalPlaceholderBody;

  /// No description provided for @dashboardGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}'**
  String dashboardGreeting(String name);

  /// No description provided for @dashboardTotalSaved.
  ///
  /// In en, this message translates to:
  /// **'Total saved'**
  String get dashboardTotalSaved;

  /// No description provided for @dashboardActivePockets.
  ///
  /// In en, this message translates to:
  /// **'Active pockets'**
  String get dashboardActivePockets;

  /// No description provided for @dashboardStreak.
  ///
  /// In en, this message translates to:
  /// **'{days}-day streak'**
  String dashboardStreak(int days);

  /// No description provided for @dashboardWeeklyGoal.
  ///
  /// In en, this message translates to:
  /// **'Weekly goal'**
  String get dashboardWeeklyGoal;

  /// No description provided for @dashboardShortcutPlans.
  ///
  /// In en, this message translates to:
  /// **'Shopping plans'**
  String get dashboardShortcutPlans;

  /// No description provided for @charityTitle.
  ///
  /// In en, this message translates to:
  /// **'Charity'**
  String get charityTitle;

  /// No description provided for @charityRaisedOfGoal.
  ///
  /// In en, this message translates to:
  /// **'{raised} of {goal} raised'**
  String charityRaisedOfGoal(String raised, String goal);

  /// No description provided for @charityDonors.
  ///
  /// In en, this message translates to:
  /// **'{count} donors'**
  String charityDonors(int count);

  /// No description provided for @charityDonate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get charityDonate;

  /// No description provided for @plansTitle.
  ///
  /// In en, this message translates to:
  /// **'Plans'**
  String get plansTitle;

  /// No description provided for @plansItemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String plansItemsCount(int count);

  /// No description provided for @groupChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Group chat'**
  String get groupChatTitle;

  /// No description provided for @groupChatHint.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get groupChatHint;

  /// No description provided for @groupChatSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get groupChatSend;

  /// No description provided for @profileSchool.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get profileSchool;

  /// No description provided for @profileAdmin.
  ///
  /// In en, this message translates to:
  /// **'Administration'**
  String get profileAdmin;

  /// No description provided for @schoolTitle.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get schoolTitle;

  /// No description provided for @schoolClasses.
  ///
  /// In en, this message translates to:
  /// **'Classes'**
  String get schoolClasses;

  /// No description provided for @schoolStudents.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get schoolStudents;

  /// No description provided for @schoolFeesCollected.
  ///
  /// In en, this message translates to:
  /// **'Fees collected'**
  String get schoolFeesCollected;

  /// No description provided for @adminTitle.
  ///
  /// In en, this message translates to:
  /// **'Administration'**
  String get adminTitle;

  /// No description provided for @adminHealthScore.
  ///
  /// In en, this message translates to:
  /// **'Collection health'**
  String get adminHealthScore;

  /// No description provided for @adminActiveAdmins.
  ///
  /// In en, this message translates to:
  /// **'Active admins'**
  String get adminActiveAdmins;

  /// No description provided for @adminKeensInCirculation.
  ///
  /// In en, this message translates to:
  /// **'Keens in circulation'**
  String get adminKeensInCirculation;

  /// No description provided for @adminPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have access to this area.'**
  String get adminPermissionDenied;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
