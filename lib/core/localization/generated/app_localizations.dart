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

  /// No description provided for @brandWordmark.
  ///
  /// In en, this message translates to:
  /// **'KeenPocket'**
  String get brandWordmark;

  /// No description provided for @navCollapseRail.
  ///
  /// In en, this message translates to:
  /// **'Collapse menu'**
  String get navCollapseRail;

  /// No description provided for @navExpandRail.
  ///
  /// In en, this message translates to:
  /// **'Expand menu'**
  String get navExpandRail;

  /// No description provided for @mascotName.
  ///
  /// In en, this message translates to:
  /// **'Mr K'**
  String get mascotName;

  /// No description provided for @authFooter.
  ///
  /// In en, this message translates to:
  /// **'KeenPocket keeps the records'**
  String get authFooter;

  /// No description provided for @authCopyright.
  ///
  /// In en, this message translates to:
  /// **'© KeenPocket. Join the flock.'**
  String get authCopyright;

  /// No description provided for @authSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get authSupport;

  /// No description provided for @loginIdentifierLabel.
  ///
  /// In en, this message translates to:
  /// **'Email, phone, or username'**
  String get loginIdentifierLabel;

  /// No description provided for @loginIdentifierHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your details'**
  String get loginIdentifierHint;

  /// No description provided for @loginRememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get loginRememberMe;

  /// No description provided for @authHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get authHelp;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Saving made simple, playful, and rewarding.'**
  String get splashTagline;

  /// No description provided for @splashGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get splashGetStarted;

  /// No description provided for @splashHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'I already have an account'**
  String get splashHaveAccount;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContinue;

  /// No description provided for @onboardingStart.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingStart;

  /// No description provided for @onboardingJoined.
  ///
  /// In en, this message translates to:
  /// **'Joined by 2M+ savers'**
  String get onboardingJoined;

  /// No description provided for @onboard1Title.
  ///
  /// In en, this message translates to:
  /// **'Save together'**
  String get onboard1Title;

  /// No description provided for @onboard1Body.
  ///
  /// In en, this message translates to:
  /// **'Create shared Pockets for your group goals.'**
  String get onboard1Body;

  /// No description provided for @onboard2Title.
  ///
  /// In en, this message translates to:
  /// **'Stay accountable'**
  String get onboard2Title;

  /// No description provided for @onboard2Body.
  ///
  /// In en, this message translates to:
  /// **'Track contributions and never miss a turn.'**
  String get onboard2Body;

  /// No description provided for @onboard3Title.
  ///
  /// In en, this message translates to:
  /// **'Build trust'**
  String get onboard3Title;

  /// No description provided for @onboard3Body.
  ///
  /// In en, this message translates to:
  /// **'Earn reputation as you save with others.'**
  String get onboard3Body;

  /// No description provided for @loginWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get loginWelcomeBack;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to keep track of your pockets.'**
  String get loginSubtitle;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get loginForgotPassword;

  /// No description provided for @loginOr.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get loginOr;

  /// No description provided for @loginGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get loginGoogle;

  /// No description provided for @loginFacebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get loginFacebook;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginNoAccount;

  /// No description provided for @loginCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get loginCreateAccount;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Join the club!'**
  String get registerTitle;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your pocket of wisdom'**
  String get registerSubtitle;

  /// No description provided for @registerFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get registerFullName;

  /// No description provided for @registerPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get registerPhone;

  /// No description provided for @registerConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get registerConfirmPassword;

  /// No description provided for @registerAgree.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms of Service and Privacy Policy'**
  String get registerAgree;

  /// No description provided for @registerSubmit.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get registerSubmit;

  /// No description provided for @registerHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get registerHaveAccount;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify it\'s you'**
  String get otpTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a 6-digit code to'**
  String get otpSubtitle;

  /// No description provided for @otpMaintenance.
  ///
  /// In en, this message translates to:
  /// **'SMS verification is currently under maintenance. Please use Email instead.'**
  String get otpMaintenance;

  /// No description provided for @otpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get otpResend;

  /// No description provided for @otpVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get otpVerify;

  /// No description provided for @otpTryAnother.
  ///
  /// In en, this message translates to:
  /// **'Try another way'**
  String get otpTryAnother;

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

  /// No description provided for @pocketsMyTitle.
  ///
  /// In en, this message translates to:
  /// **'My Pockets'**
  String get pocketsMyTitle;

  /// No description provided for @pocketsTip.
  ///
  /// In en, this message translates to:
  /// **'Saving with friends is 3x more likely to reach the goal. High five! 🤚'**
  String get pocketsTip;

  /// No description provided for @pocketBrowsePublic.
  ///
  /// In en, this message translates to:
  /// **'Browse public pockets'**
  String get pocketBrowsePublic;

  /// No description provided for @pocketsInsuredNote.
  ///
  /// In en, this message translates to:
  /// **'All pockets are NDIC insured and strictly verified.'**
  String get pocketsInsuredNote;

  /// No description provided for @pocketsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your community contributions and goals.'**
  String get pocketsSubtitle;

  /// No description provided for @pocketsCreateNew.
  ///
  /// In en, this message translates to:
  /// **'Create New Pocket'**
  String get pocketsCreateNew;

  /// No description provided for @pocketsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search your pockets…'**
  String get pocketsSearchHint;

  /// No description provided for @pocketsSectionOrganise.
  ///
  /// In en, this message translates to:
  /// **'Pockets I Organise'**
  String get pocketsSectionOrganise;

  /// No description provided for @pocketsSectionIn.
  ///
  /// In en, this message translates to:
  /// **'Pockets I\'m In'**
  String get pocketsSectionIn;

  /// No description provided for @pocketsStartNewGroup.
  ///
  /// In en, this message translates to:
  /// **'Start New Group'**
  String get pocketsStartNewGroup;

  /// No description provided for @pocketsMonthlyContribution.
  ///
  /// In en, this message translates to:
  /// **'Monthly contribution'**
  String get pocketsMonthlyContribution;

  /// No description provided for @pocketsYourShare.
  ///
  /// In en, this message translates to:
  /// **'Your share'**
  String get pocketsYourShare;

  /// No description provided for @pocketsHandsJoined.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hand joined} other{{count} hands joined}}'**
  String pocketsHandsJoined(int count);

  /// No description provided for @pocketsGoalProgress.
  ///
  /// In en, this message translates to:
  /// **'Goal progress'**
  String get pocketsGoalProgress;

  /// No description provided for @pocketsCycleProgress.
  ///
  /// In en, this message translates to:
  /// **'Cycle progress'**
  String get pocketsCycleProgress;

  /// No description provided for @pocketsTipTitle.
  ///
  /// In en, this message translates to:
  /// **'Great job, {name}!'**
  String pocketsTipTitle(String name);

  /// No description provided for @pocketsTipBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve made all your contributions this month. You\'re on track for your next payout!'**
  String get pocketsTipBody;

  /// No description provided for @pocketsViewHistory.
  ///
  /// In en, this message translates to:
  /// **'View history'**
  String get pocketsViewHistory;

  /// No description provided for @pocketsPocketStats.
  ///
  /// In en, this message translates to:
  /// **'Pocket stats'**
  String get pocketsPocketStats;

  /// No description provided for @pocketStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get pocketStatusActive;

  /// No description provided for @pocketStatusFull.
  ///
  /// In en, this message translates to:
  /// **'Full'**
  String get pocketStatusFull;

  /// No description provided for @pocketNextHand.
  ///
  /// In en, this message translates to:
  /// **'Your next hand'**
  String get pocketNextHand;

  /// No description provided for @pocketStartSaving.
  ///
  /// In en, this message translates to:
  /// **'Start saving together'**
  String get pocketStartSaving;

  /// No description provided for @createPocketTitle.
  ///
  /// In en, this message translates to:
  /// **'Create pocket'**
  String get createPocketTitle;

  /// No description provided for @createPocketIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready for a new Pocket?'**
  String get createPocketIntroTitle;

  /// No description provided for @createPocketIntroBody.
  ///
  /// In en, this message translates to:
  /// **'Fill in the details to start your savings journey with friends!'**
  String get createPocketIntroBody;

  /// No description provided for @createPocketTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Pocket title'**
  String get createPocketTitleLabel;

  /// No description provided for @createPocketTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Dream Vacation 2026'**
  String get createPocketTitleHint;

  /// No description provided for @createPocketDescLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get createPocketDescLabel;

  /// No description provided for @createPocketDescHint.
  ///
  /// In en, this message translates to:
  /// **'What are we saving for?'**
  String get createPocketDescHint;

  /// No description provided for @createPocketYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get createPocketYear;

  /// No description provided for @createPocketCost.
  ///
  /// In en, this message translates to:
  /// **'Costs 1 Keen'**
  String get createPocketCost;

  /// No description provided for @createPocketSectionGeneral.
  ///
  /// In en, this message translates to:
  /// **'General Details'**
  String get createPocketSectionGeneral;

  /// No description provided for @createPocketSectionTimeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get createPocketSectionTimeline;

  /// No description provided for @createPocketSectionContribution.
  ///
  /// In en, this message translates to:
  /// **'Contribution'**
  String get createPocketSectionContribution;

  /// No description provided for @createPocketYourHandsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How many slots are you taking?'**
  String get createPocketYourHandsSubtitle;

  /// No description provided for @createPocketVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get createPocketVerified;

  /// No description provided for @createPocketCollaborative.
  ///
  /// In en, this message translates to:
  /// **'Collaborative'**
  String get createPocketCollaborative;

  /// No description provided for @createPocketMonthsAbbrev.
  ///
  /// In en, this message translates to:
  /// **'{count} Mo'**
  String createPocketMonthsAbbrev(int count);

  /// No description provided for @createPocketStartMonth.
  ///
  /// In en, this message translates to:
  /// **'Start month'**
  String get createPocketStartMonth;

  /// No description provided for @createPocketDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration (months)'**
  String get createPocketDuration;

  /// No description provided for @createPocketPerHand.
  ///
  /// In en, this message translates to:
  /// **'₦ Per hand'**
  String get createPocketPerHand;

  /// No description provided for @createPocketCapacity.
  ///
  /// In en, this message translates to:
  /// **'Member capacity'**
  String get createPocketCapacity;

  /// No description provided for @createPocketCapacityHint.
  ///
  /// In en, this message translates to:
  /// **'0 = unlimited'**
  String get createPocketCapacityHint;

  /// No description provided for @createPocketYourHands.
  ///
  /// In en, this message translates to:
  /// **'Your hands (your share)'**
  String get createPocketYourHands;

  /// No description provided for @createPocketTermsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms notice'**
  String get createPocketTermsTitle;

  /// No description provided for @createPocketTermsBody.
  ///
  /// In en, this message translates to:
  /// **'By creating this Pocket, you agree to facilitate fair contributions. Pockets cannot be deleted once members have contributed. Ensure your duration and per-hand amounts are final.'**
  String get createPocketTermsBody;

  /// No description provided for @createPocketTermsAgree.
  ///
  /// In en, this message translates to:
  /// **'I understand and agree to the terms'**
  String get createPocketTermsAgree;

  /// No description provided for @createPocketSubmit.
  ///
  /// In en, this message translates to:
  /// **'Create pocket'**
  String get createPocketSubmit;

  /// No description provided for @pocketStatusOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get pocketStatusOpen;

  /// No description provided for @pocketStatusClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get pocketStatusClosed;

  /// No description provided for @pocketsPerHand.
  ///
  /// In en, this message translates to:
  /// **'{amount} / hand'**
  String pocketsPerHand(String amount);

  /// No description provided for @pocketsHandsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} hands'**
  String pocketsHandsCount(int count);

  /// No description provided for @pocketsScheduleLabel.
  ///
  /// In en, this message translates to:
  /// **'{months} months · {year}'**
  String pocketsScheduleLabel(int months, int year);

  /// No description provided for @pocketsActiveCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Active'**
  String pocketsActiveCount(int count);

  /// No description provided for @pocketDetailRateAdmin.
  ///
  /// In en, this message translates to:
  /// **'Rate admin'**
  String get pocketDetailRateAdmin;

  /// No description provided for @pocketDetailShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get pocketDetailShare;

  /// No description provided for @pocketDetailHandDuration.
  ///
  /// In en, this message translates to:
  /// **'{amount} / hand · 6 months duration'**
  String pocketDetailHandDuration(String amount);

  /// No description provided for @pocketDetailMonthsCompleted.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} months completed'**
  String pocketDetailMonthsCompleted(int done, int total);

  /// No description provided for @pocketDetailPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get pocketDetailPaid;

  /// No description provided for @pocketDetailNotPaid.
  ///
  /// In en, this message translates to:
  /// **'Not paid'**
  String get pocketDetailNotPaid;

  /// No description provided for @pocketDetailPendingApprovals.
  ///
  /// In en, this message translates to:
  /// **'Pending approvals'**
  String get pocketDetailPendingApprovals;

  /// No description provided for @pocketDetailMarkPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark paid'**
  String get pocketDetailMarkPaid;

  /// No description provided for @pocketDetailMyProgress.
  ///
  /// In en, this message translates to:
  /// **'My progress'**
  String get pocketDetailMyProgress;

  /// No description provided for @pocketDetailProgressDesc.
  ///
  /// In en, this message translates to:
  /// **'You have contributed {raised} of your {target} target.'**
  String pocketDetailProgressDesc(String raised, String target);

  /// No description provided for @pocketDetailMyContributions.
  ///
  /// In en, this message translates to:
  /// **'My contributions'**
  String get pocketDetailMyContributions;

  /// No description provided for @pocketDetailViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get pocketDetailViewAll;

  /// No description provided for @pocketCharityTitle.
  ///
  /// In en, this message translates to:
  /// **'Charity Drive'**
  String get pocketCharityTitle;

  /// No description provided for @pocketCharitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Rally your group around a cause and give back together.'**
  String get pocketCharitySubtitle;

  /// No description provided for @pocketCharityStart.
  ///
  /// In en, this message translates to:
  /// **'Start a drive'**
  String get pocketCharityStart;

  /// No description provided for @pocketDetailPayoutAccount.
  ///
  /// In en, this message translates to:
  /// **'Payout account'**
  String get pocketDetailPayoutAccount;

  /// No description provided for @pocketDetailMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get pocketDetailMembers;

  /// No description provided for @pocketMemberHands.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hand} other{{count} hands}}'**
  String pocketMemberHands(int count);

  /// No description provided for @pocketDetailTopContributors.
  ///
  /// In en, this message translates to:
  /// **'Top contributors'**
  String get pocketDetailTopContributors;

  /// No description provided for @pocketDetailGroupRules.
  ///
  /// In en, this message translates to:
  /// **'Group rules'**
  String get pocketDetailGroupRules;

  /// No description provided for @pocketDetailRule1.
  ///
  /// In en, this message translates to:
  /// **'Contributions due by 5th of every month.'**
  String get pocketDetailRule1;

  /// No description provided for @pocketDetailRule2.
  ///
  /// In en, this message translates to:
  /// **'Admin fee: ₦200 per hand monthly.'**
  String get pocketDetailRule2;

  /// No description provided for @pocketDetailRule3.
  ///
  /// In en, this message translates to:
  /// **'Non-payment for 2 months leads to removal.'**
  String get pocketDetailRule3;

  /// No description provided for @pocketDetailVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get pocketDetailVerified;

  /// No description provided for @pocketDetailContributionType.
  ///
  /// In en, this message translates to:
  /// **'Contribution'**
  String get pocketDetailContributionType;

  /// No description provided for @pocketDetailUpcomingType.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get pocketDetailUpcomingType;

  /// No description provided for @pocketDetailGroupShopping.
  ///
  /// In en, this message translates to:
  /// **'Group shopping'**
  String get pocketDetailGroupShopping;

  /// No description provided for @pocketDetailGroupPrice.
  ///
  /// In en, this message translates to:
  /// **'{amount} group price'**
  String pocketDetailGroupPrice(String amount);

  /// No description provided for @pocketDetailSharedBy.
  ///
  /// In en, this message translates to:
  /// **'Shared by {name}'**
  String pocketDetailSharedBy(String name);

  /// No description provided for @pocketDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Pocket Details'**
  String get pocketDetailTitle;

  /// No description provided for @pocketDetailSearchMembers.
  ///
  /// In en, this message translates to:
  /// **'Search members…'**
  String get pocketDetailSearchMembers;

  /// No description provided for @pocketDetailTarget.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get pocketDetailTarget;

  /// No description provided for @pocketDetailPerHandShort.
  ///
  /// In en, this message translates to:
  /// **'₦ / Hand'**
  String get pocketDetailPerHandShort;

  /// No description provided for @pocketDetailDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get pocketDetailDuration;

  /// No description provided for @pocketDetailMonths.
  ///
  /// In en, this message translates to:
  /// **'{count} Months'**
  String pocketDetailMonths(int count);

  /// No description provided for @pocketDetailSharePocket.
  ///
  /// In en, this message translates to:
  /// **'Share Pocket'**
  String get pocketDetailSharePocket;

  /// No description provided for @pocketDetailMrKTitle.
  ///
  /// In en, this message translates to:
  /// **'Mr. K Says:'**
  String get pocketDetailMrKTitle;

  /// No description provided for @pocketDetailMrKMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'re only 3 contributions away from your next badge!'**
  String get pocketDetailMrKMessage;

  /// No description provided for @pocketDetailGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get pocketDetailGoal;

  /// No description provided for @pocketDetailContributed.
  ///
  /// In en, this message translates to:
  /// **'Contributed'**
  String get pocketDetailContributed;

  /// No description provided for @pocketDetailFrequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get pocketDetailFrequency;

  /// No description provided for @pocketDetailFrequencyMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get pocketDetailFrequencyMonthly;

  /// No description provided for @pocketDetailContributeNow.
  ///
  /// In en, this message translates to:
  /// **'Contribute Now'**
  String get pocketDetailContributeNow;

  /// No description provided for @pocketDetailViewHistory.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get pocketDetailViewHistory;

  /// No description provided for @pocketDetailGroupShoppingSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Group shopping suggestions'**
  String get pocketDetailGroupShoppingSuggestions;

  /// No description provided for @pocketDetailBeta.
  ///
  /// In en, this message translates to:
  /// **'BETA'**
  String get pocketDetailBeta;

  /// No description provided for @pocketDetailVoteForItem.
  ///
  /// In en, this message translates to:
  /// **'Vote for Item'**
  String get pocketDetailVoteForItem;

  /// No description provided for @pocketDetailGroupPriceShort.
  ///
  /// In en, this message translates to:
  /// **'Group Price: {amount}'**
  String pocketDetailGroupPriceShort(String amount);

  /// No description provided for @pocketDetailNewJoinRequest.
  ///
  /// In en, this message translates to:
  /// **'New Join Request'**
  String get pocketDetailNewJoinRequest;

  /// No description provided for @pocketDetailMembersWithCount.
  ///
  /// In en, this message translates to:
  /// **'Members ({count})'**
  String pocketDetailMembersWithCount(int count);

  /// No description provided for @pocketDetailRoleOrganizer.
  ///
  /// In en, this message translates to:
  /// **'ORGANIZER'**
  String get pocketDetailRoleOrganizer;

  /// No description provided for @pocketDetailRoleMember.
  ///
  /// In en, this message translates to:
  /// **'MEMBER'**
  String get pocketDetailRoleMember;

  /// No description provided for @pocketDetailTabletRule1.
  ///
  /// In en, this message translates to:
  /// **'All contributions must be made by the 15th of every month to avoid late fees.'**
  String get pocketDetailTabletRule1;

  /// No description provided for @pocketDetailTabletRule2.
  ///
  /// In en, this message translates to:
  /// **'Early withdrawal is only permitted in group-voted emergencies with a 5% fee.'**
  String get pocketDetailTabletRule2;

  /// No description provided for @pocketDetailTabletRule3.
  ///
  /// In en, this message translates to:
  /// **'Shopping suggestions require at least 60% member approval to be finalized.'**
  String get pocketDetailTabletRule3;

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

  /// No description provided for @contributeToPocket.
  ///
  /// In en, this message translates to:
  /// **'Contribute to Pocket'**
  String get contributeToPocket;

  /// No description provided for @contributeTargetGoal.
  ///
  /// In en, this message translates to:
  /// **'Target Goal'**
  String get contributeTargetGoal;

  /// No description provided for @contributeTargetAmount.
  ///
  /// In en, this message translates to:
  /// **'Target: {amount}'**
  String contributeTargetAmount(String amount);

  /// No description provided for @contributeOutstanding.
  ///
  /// In en, this message translates to:
  /// **'{amount} outstanding'**
  String contributeOutstanding(String amount);

  /// No description provided for @contributePercentComplete.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Complete'**
  String contributePercentComplete(int percent);

  /// No description provided for @contributeMoreToGoal.
  ///
  /// In en, this message translates to:
  /// **'Only {amount} more to reach your holiday target!'**
  String contributeMoreToGoal(String amount);

  /// No description provided for @contributeEnterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get contributeEnterAmount;

  /// No description provided for @contributeEnterContribution.
  ///
  /// In en, this message translates to:
  /// **'Enter Contribution'**
  String get contributeEnterContribution;

  /// No description provided for @contributeEnterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How much are we adding to the pocket today?'**
  String get contributeEnterSubtitle;

  /// No description provided for @contributeQuickAdd.
  ///
  /// In en, this message translates to:
  /// **'+{amount}'**
  String contributeQuickAdd(String amount);

  /// No description provided for @contributeTip.
  ///
  /// In en, this message translates to:
  /// **'Every contribution counts towards your savings streak!'**
  String get contributeTip;

  /// No description provided for @contributeCharity.
  ///
  /// In en, this message translates to:
  /// **'Add a charity donation'**
  String get contributeCharity;

  /// No description provided for @contributeCharitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Donate {amount} to {cause}'**
  String contributeCharitySubtitle(String amount, String cause);

  /// No description provided for @contributeContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get contributeContinue;

  /// No description provided for @contributeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Contribution'**
  String get contributeConfirm;

  /// No description provided for @contributeSecureFooter.
  ///
  /// In en, this message translates to:
  /// **'Secure transaction powered by KeenPocket'**
  String get contributeSecureFooter;

  /// No description provided for @contributeFundsDebited.
  ///
  /// In en, this message translates to:
  /// **'Funds will be debited from your Primary Wallet'**
  String get contributeFundsDebited;

  /// No description provided for @allocateAllocatedOf.
  ///
  /// In en, this message translates to:
  /// **'Allocated {allocated} of {total}'**
  String allocateAllocatedOf(String allocated, String total);

  /// No description provided for @allocateGreatProgress.
  ///
  /// In en, this message translates to:
  /// **'Great Progress!'**
  String get allocateGreatProgress;

  /// No description provided for @allocateAllocatedSub.
  ///
  /// In en, this message translates to:
  /// **'You\'ve allocated {allocated} of {total}'**
  String allocateAllocatedSub(String allocated, String total);

  /// No description provided for @allocatePendingNote.
  ///
  /// In en, this message translates to:
  /// **'This contribution will be Pending verification until the organiser confirms.'**
  String get allocatePendingNote;

  /// No description provided for @allocateConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Required'**
  String get allocateConfirmationTitle;

  /// No description provided for @allocateConfirmationBody.
  ///
  /// In en, this message translates to:
  /// **'Once submitted, your pocket organiser will need to confirm the transaction before it is finalized in your history.'**
  String get allocateConfirmationBody;

  /// No description provided for @allocateMonthsPending.
  ///
  /// In en, this message translates to:
  /// **'Months Pending'**
  String get allocateMonthsPending;

  /// No description provided for @allocateMonthsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month} other{{count} months}}'**
  String allocateMonthsCount(int count);

  /// No description provided for @allocateMonthSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{target} / {paid} paid'**
  String allocateMonthSubtitle(String target, int paid);

  /// No description provided for @allocateTargetLabel.
  ///
  /// In en, this message translates to:
  /// **'Target:'**
  String get allocateTargetLabel;

  /// No description provided for @allocateMonthReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get allocateMonthReady;

  /// No description provided for @allocateMonthPendingStatus.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get allocateMonthPendingStatus;

  /// No description provided for @allocateMonthEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get allocateMonthEdit;

  /// No description provided for @allocateSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit contribution'**
  String get allocateSubmit;

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

  /// No description provided for @payConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm payment'**
  String get payConfirmTitle;

  /// No description provided for @payWalletBalance.
  ///
  /// In en, this message translates to:
  /// **'Wallet balance'**
  String get payWalletBalance;

  /// No description provided for @payInvoiceAmount.
  ///
  /// In en, this message translates to:
  /// **'Invoice amount'**
  String get payInvoiceAmount;

  /// No description provided for @payNewBalance.
  ///
  /// In en, this message translates to:
  /// **'New balance'**
  String get payNewBalance;

  /// No description provided for @payFromWallet.
  ///
  /// In en, this message translates to:
  /// **'Pay {amount} from wallet'**
  String payFromWallet(String amount);

  /// No description provided for @payInsufficientTitle.
  ///
  /// In en, this message translates to:
  /// **'Insufficient balance'**
  String get payInsufficientTitle;

  /// No description provided for @payRequiredAmount.
  ///
  /// In en, this message translates to:
  /// **'Required amount'**
  String get payRequiredAmount;

  /// No description provided for @payShortfall.
  ///
  /// In en, this message translates to:
  /// **'You need an extra {amount} to complete this transaction.'**
  String payShortfall(String amount);

  /// No description provided for @payTopUp.
  ///
  /// In en, this message translates to:
  /// **'Top up wallet'**
  String get payTopUp;

  /// No description provided for @paySecure.
  ///
  /// In en, this message translates to:
  /// **'KeenPocket uses bank-grade encryption to protect every transaction.'**
  String get paySecure;

  /// No description provided for @payPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment'**
  String get payPageTitle;

  /// No description provided for @payTip.
  ///
  /// In en, this message translates to:
  /// **'Looking good! You\'ve got plenty in your pocket for this one.'**
  String get payTip;

  /// No description provided for @paySafeTitle.
  ///
  /// In en, this message translates to:
  /// **'Safe & Secure'**
  String get paySafeTitle;

  /// No description provided for @payMonthlyLimit.
  ///
  /// In en, this message translates to:
  /// **'Monthly Spending Limit'**
  String get payMonthlyLimit;

  /// No description provided for @payLimitUsage.
  ///
  /// In en, this message translates to:
  /// **'{spent} / {limit}'**
  String payLimitUsage(String spent, String limit);

  /// No description provided for @payConfirmSecurely.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Pay Securely'**
  String get payConfirmSecurely;

  /// No description provided for @payTabletTipTitle.
  ///
  /// In en, this message translates to:
  /// **'Great Job!'**
  String get payTabletTipTitle;

  /// No description provided for @payTabletTipBody.
  ///
  /// In en, this message translates to:
  /// **'Your spending is perfectly aligned with your monthly budget goals.'**
  String get payTabletTipBody;

  /// No description provided for @invoiceLedgerTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoice Ledger'**
  String get invoiceLedgerTitle;

  /// No description provided for @invoiceLedgerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your finances on track. Here you can manage your group contributions, verify proofs, and see where your money goes.'**
  String get invoiceLedgerSubtitle;

  /// No description provided for @invoiceTopSaver.
  ///
  /// In en, this message translates to:
  /// **'TOP SAVER'**
  String get invoiceTopSaver;

  /// No description provided for @invoicePendingApprovals.
  ///
  /// In en, this message translates to:
  /// **'Pending Approvals'**
  String get invoicePendingApprovals;

  /// No description provided for @invoiceMemberLabel.
  ///
  /// In en, this message translates to:
  /// **'Member: {name}'**
  String invoiceMemberLabel(String name);

  /// No description provided for @invoiceViewProof.
  ///
  /// In en, this message translates to:
  /// **'View Proof'**
  String get invoiceViewProof;

  /// No description provided for @invoiceUrgent.
  ///
  /// In en, this message translates to:
  /// **'URGENT'**
  String get invoiceUrgent;

  /// No description provided for @invoiceMarkInvoicePaid.
  ///
  /// In en, this message translates to:
  /// **'Mark Invoice Paid'**
  String get invoiceMarkInvoicePaid;

  /// No description provided for @invoiceMarkPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark Paid'**
  String get invoiceMarkPaid;

  /// No description provided for @invoiceBalanceDue.
  ///
  /// In en, this message translates to:
  /// **'Balance Due'**
  String get invoiceBalanceDue;

  /// No description provided for @invoiceDueToday.
  ///
  /// In en, this message translates to:
  /// **'Due today'**
  String get invoiceDueToday;

  /// No description provided for @invoiceUrgentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Invoice {ref} for {name}.'**
  String invoiceUrgentSubtitle(String ref, String name);

  /// No description provided for @invoicePaymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment History'**
  String get invoicePaymentHistory;

  /// No description provided for @invoiceFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get invoiceFilterAll;

  /// No description provided for @invoiceFilterPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get invoiceFilterPaid;

  /// No description provided for @invoiceFilterPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get invoiceFilterPending;

  /// No description provided for @invoiceViaWallet.
  ///
  /// In en, this message translates to:
  /// **'Via Wallet'**
  String get invoiceViaWallet;

  /// No description provided for @invoiceManual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get invoiceManual;

  /// No description provided for @invoicePaid.
  ///
  /// In en, this message translates to:
  /// **'PAID'**
  String get invoicePaid;

  /// No description provided for @invoiceNotPaid.
  ///
  /// In en, this message translates to:
  /// **'NOT PAID'**
  String get invoiceNotPaid;

  /// No description provided for @invoiceDownloadReport.
  ///
  /// In en, this message translates to:
  /// **'Download Full Report'**
  String get invoiceDownloadReport;

  /// No description provided for @invoiceTip.
  ///
  /// In en, this message translates to:
  /// **'Saving is a team sport! Keep it up!'**
  String get invoiceTip;

  /// No description provided for @invoiceTotalSent.
  ///
  /// In en, this message translates to:
  /// **'Total Sent'**
  String get invoiceTotalSent;

  /// No description provided for @invoiceAwaiting.
  ///
  /// In en, this message translates to:
  /// **'Awaiting'**
  String get invoiceAwaiting;

  /// No description provided for @invoiceColInvoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice #'**
  String get invoiceColInvoice;

  /// No description provided for @invoiceColDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get invoiceColDate;

  /// No description provided for @invoiceColMethod.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get invoiceColMethod;

  /// No description provided for @invoiceColAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get invoiceColAmount;

  /// No description provided for @invoiceColStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get invoiceColStatus;

  /// No description provided for @invoiceMethodDirectTransfer.
  ///
  /// In en, this message translates to:
  /// **'Direct Transfer'**
  String get invoiceMethodDirectTransfer;

  /// No description provided for @invoiceMethodKeenWallet.
  ///
  /// In en, this message translates to:
  /// **'KeenWallet'**
  String get invoiceMethodKeenWallet;

  /// No description provided for @invoiceMethodCardPayment.
  ///
  /// In en, this message translates to:
  /// **'Card Payment'**
  String get invoiceMethodCardPayment;

  /// No description provided for @invoiceStatusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get invoiceStatusPaid;

  /// No description provided for @invoiceStatusOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get invoiceStatusOverdue;

  /// No description provided for @invoiceUrgentAction.
  ///
  /// In en, this message translates to:
  /// **'Urgent Action'**
  String get invoiceUrgentAction;

  /// No description provided for @invoiceDueIn24h.
  ///
  /// In en, this message translates to:
  /// **'DUE IN 24H'**
  String get invoiceDueIn24h;

  /// No description provided for @invoiceSentBy.
  ///
  /// In en, this message translates to:
  /// **'SENT BY: {name}'**
  String invoiceSentBy(String name);

  /// No description provided for @invoiceTipTitle.
  ///
  /// In en, this message translates to:
  /// **'Mr. K\'s Financial Tip'**
  String get invoiceTipTitle;

  /// No description provided for @invoiceTipTabletBody.
  ///
  /// In en, this message translates to:
  /// **'Paying your invoices 2 days early earns you 50 bonus \'Savvy Points\'! Keep leveling up your wealth.'**
  String get invoiceTipTabletBody;

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

  /// No description provided for @adashiMyGroupsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Adashi Groups'**
  String get adashiMyGroupsTitle;

  /// No description provided for @adashiActiveCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Active'**
  String adashiActiveCount(int count);

  /// No description provided for @adashiActiveInCircles.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{You are not in any savings circles yet} =1{You are active in 1 savings circle} other{You are active in {count} savings circles}}'**
  String adashiActiveInCircles(int count);

  /// No description provided for @adashiStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get adashiStatusActive;

  /// No description provided for @adashiStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get adashiStatusCompleted;

  /// No description provided for @adashiFrequencyWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get adashiFrequencyWeekly;

  /// No description provided for @adashiFrequencyMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get adashiFrequencyMonthly;

  /// No description provided for @adashiPerCycleSuffix.
  ///
  /// In en, this message translates to:
  /// **'/ cycle'**
  String get adashiPerCycleSuffix;

  /// No description provided for @adashiPerCycleLine.
  ///
  /// In en, this message translates to:
  /// **'{amount} per cycle'**
  String adashiPerCycleLine(String amount);

  /// No description provided for @adashiMembersParticipating.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No members yet} =1{1 member participating} other{{count} members participating}}'**
  String adashiMembersParticipating(int count);

  /// No description provided for @adashiNextPayout.
  ///
  /// In en, this message translates to:
  /// **'Next payout'**
  String get adashiNextPayout;

  /// No description provided for @adashiPayoutInDays.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =0{Today} =1{In 1 day} other{In {days} days}}'**
  String adashiPayoutInDays(int days);

  /// No description provided for @adashiNextPayoutDays.
  ///
  /// In en, this message translates to:
  /// **'Next payout: {days, plural, =0{today} =1{1 day} other{{days} days}}'**
  String adashiNextPayoutDays(int days);

  /// No description provided for @adashiCycleProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Cycle Progress'**
  String get adashiCycleProgressTitle;

  /// No description provided for @adashiCycleCount.
  ///
  /// In en, this message translates to:
  /// **'{current} of {total}'**
  String adashiCycleCount(int current, int total);

  /// No description provided for @adashiCreate.
  ///
  /// In en, this message translates to:
  /// **'Create adashi'**
  String get adashiCreate;

  /// No description provided for @adashiNewGroup.
  ///
  /// In en, this message translates to:
  /// **'New Group'**
  String get adashiNewGroup;

  /// No description provided for @adashiSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Find a group...'**
  String get adashiSearchHint;

  /// No description provided for @adashiJoinTitle.
  ///
  /// In en, this message translates to:
  /// **'Join a Circle'**
  String get adashiJoinTitle;

  /// No description provided for @adashiJoinBody.
  ///
  /// In en, this message translates to:
  /// **'Looking for something new? Explore community-run Adashi groups.'**
  String get adashiJoinBody;

  /// No description provided for @adashiBrowseExplore.
  ///
  /// In en, this message translates to:
  /// **'Browse Explore'**
  String get adashiBrowseExplore;

  /// No description provided for @adashiDidYouKnowTitle.
  ///
  /// In en, this message translates to:
  /// **'Did you know?'**
  String get adashiDidYouKnowTitle;

  /// No description provided for @adashiDidYouKnowBody.
  ///
  /// In en, this message translates to:
  /// **'Adashi groups help you reach your goals 3x faster than saving alone. Mr K keeps everyone on track!'**
  String get adashiDidYouKnowBody;

  /// No description provided for @adashiHubAdminName.
  ///
  /// In en, this message translates to:
  /// **'{name} (Admin)'**
  String adashiHubAdminName(String name);

  /// No description provided for @adashiHubRateAdmin.
  ///
  /// In en, this message translates to:
  /// **'Rate admin'**
  String get adashiHubRateAdmin;

  /// No description provided for @adashiHubReputation.
  ///
  /// In en, this message translates to:
  /// **'{score} reputation'**
  String adashiHubReputation(String score);

  /// No description provided for @adashiHubCycle.
  ///
  /// In en, this message translates to:
  /// **'Cycle {number}'**
  String adashiHubCycle(int number);

  /// No description provided for @adashiHubCollecting.
  ///
  /// In en, this message translates to:
  /// **'Collecting'**
  String get adashiHubCollecting;

  /// No description provided for @adashiHubActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get adashiHubActive;

  /// No description provided for @adashiHubPaidMembers.
  ///
  /// In en, this message translates to:
  /// **'Paid {paid} of {total} members'**
  String adashiHubPaidMembers(int paid, int total);

  /// No description provided for @adashiHubPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String adashiHubPercent(int percent);

  /// No description provided for @adashiHubTotalCollected.
  ///
  /// In en, this message translates to:
  /// **'Total Collected'**
  String get adashiHubTotalCollected;

  /// No description provided for @adashiHubCollectedOf.
  ///
  /// In en, this message translates to:
  /// **'{collected} / {target}'**
  String adashiHubCollectedOf(String collected, String target);

  /// No description provided for @adashiHubThisCycle.
  ///
  /// In en, this message translates to:
  /// **'This cycle:'**
  String get adashiHubThisCycle;

  /// No description provided for @adashiHubReceives.
  ///
  /// In en, this message translates to:
  /// **'{name} receives {amount}'**
  String adashiHubReceives(String name, String amount);

  /// No description provided for @adashiHubContribute.
  ///
  /// In en, this message translates to:
  /// **'Contribute {amount}'**
  String adashiHubContribute(String amount);

  /// No description provided for @adashiHubRotationTitle.
  ///
  /// In en, this message translates to:
  /// **'Rotation timeline'**
  String get adashiHubRotationTitle;

  /// No description provided for @adashiHubReceivingNow.
  ///
  /// In en, this message translates to:
  /// **'Receiving now'**
  String get adashiHubReceivingNow;

  /// No description provided for @adashiHubReceivedOn.
  ///
  /// In en, this message translates to:
  /// **'Received: {date}'**
  String adashiHubReceivedOn(String date);

  /// No description provided for @adashiHubProjectedOn.
  ///
  /// In en, this message translates to:
  /// **'Projected: {date}'**
  String adashiHubProjectedOn(String date);

  /// No description provided for @adashiHubYouUpcoming.
  ///
  /// In en, this message translates to:
  /// **'You (Upcoming)'**
  String get adashiHubYouUpcoming;

  /// No description provided for @adashiHubYourTurn.
  ///
  /// In en, this message translates to:
  /// **'Your turn'**
  String get adashiHubYourTurn;

  /// No description provided for @adashiHubPayoutAccount.
  ///
  /// In en, this message translates to:
  /// **'Payout Account'**
  String get adashiHubPayoutAccount;

  /// No description provided for @adashiHubEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get adashiHubEdit;

  /// No description provided for @adashiHubCyclesHistory.
  ///
  /// In en, this message translates to:
  /// **'Cycles history'**
  String get adashiHubCyclesHistory;

  /// No description provided for @adashiHubSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get adashiHubSeeAll;

  /// No description provided for @adashiHubColCycle.
  ///
  /// In en, this message translates to:
  /// **'Cycle'**
  String get adashiHubColCycle;

  /// No description provided for @adashiHubColTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get adashiHubColTotal;

  /// No description provided for @adashiHubColStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get adashiHubColStatus;

  /// No description provided for @adashiHubClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get adashiHubClosed;

  /// No description provided for @adashiHubDisputesTitle.
  ///
  /// In en, this message translates to:
  /// **'Disputes'**
  String get adashiHubDisputesTitle;

  /// No description provided for @adashiHubDisputesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No active disputes in this Adashi group. Keep up the timely contributions!'**
  String get adashiHubDisputesEmpty;

  /// No description provided for @adashiHubTitle.
  ///
  /// In en, this message translates to:
  /// **'Adashi Hub'**
  String get adashiHubTitle;

  /// No description provided for @adashiHubWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}! Your group is thriving.'**
  String adashiHubWelcome(String name);

  /// No description provided for @adashiHubMasterOrganiser.
  ///
  /// In en, this message translates to:
  /// **'Master Organiser'**
  String get adashiHubMasterOrganiser;

  /// No description provided for @adashiHubProductDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get adashiHubProductDetails;

  /// No description provided for @adashiHubReputationLabel.
  ///
  /// In en, this message translates to:
  /// **'Reputation'**
  String get adashiHubReputationLabel;

  /// No description provided for @adashiHubPayoutDetails.
  ///
  /// In en, this message translates to:
  /// **'Payout Details'**
  String get adashiHubPayoutDetails;

  /// No description provided for @adashiHubTarget.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get adashiHubTarget;

  /// No description provided for @adashiHubCollectedSuffix.
  ///
  /// In en, this message translates to:
  /// **'collected'**
  String get adashiHubCollectedSuffix;

  /// No description provided for @adashiHubNextPayoutLine.
  ///
  /// In en, this message translates to:
  /// **'Next payout: {date}'**
  String adashiHubNextPayoutLine(String date);

  /// No description provided for @adashiHubMascotTip.
  ///
  /// In en, this message translates to:
  /// **'Keep the energy up! 6 members have already contributed today.'**
  String get adashiHubMascotTip;

  /// No description provided for @adashiHubResolveNow.
  ///
  /// In en, this message translates to:
  /// **'Resolve now'**
  String get adashiHubResolveNow;

  /// No description provided for @adashiHubClosedCases.
  ///
  /// In en, this message translates to:
  /// **'Closed cases'**
  String get adashiHubClosedCases;

  /// No description provided for @adashiHubAvgResolve.
  ///
  /// In en, this message translates to:
  /// **'Avg. resolve time'**
  String get adashiHubAvgResolve;

  /// No description provided for @adashiHubGroupHealth.
  ///
  /// In en, this message translates to:
  /// **'Group Health'**
  String get adashiHubGroupHealth;

  /// No description provided for @adashiHubTotalSaved.
  ///
  /// In en, this message translates to:
  /// **'Total Saved YTD'**
  String get adashiHubTotalSaved;

  /// No description provided for @adashiHubSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security Status'**
  String get adashiHubSecurity;

  /// No description provided for @adashiCreateCost.
  ///
  /// In en, this message translates to:
  /// **'Costs 1 Keen'**
  String get adashiCreateCost;

  /// No description provided for @adashiCreateCostNote.
  ///
  /// In en, this message translates to:
  /// **'Costs 1 Keen note'**
  String get adashiCreateCostNote;

  /// No description provided for @adashiCreateIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s set up your circle!'**
  String get adashiCreateIntroTitle;

  /// No description provided for @adashiCreateIntroBody.
  ///
  /// In en, this message translates to:
  /// **'Fill in the details below to start saving together.'**
  String get adashiCreateIntroBody;

  /// No description provided for @adashiCreateName.
  ///
  /// In en, this message translates to:
  /// **'Adashi Name'**
  String get adashiCreateName;

  /// No description provided for @adashiCreateNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Dream Vacation Fund'**
  String get adashiCreateNameHint;

  /// No description provided for @adashiCreatePerCycle.
  ///
  /// In en, this message translates to:
  /// **'₦ per cycle'**
  String get adashiCreatePerCycle;

  /// No description provided for @adashiCreatePerCycleHint.
  ///
  /// In en, this message translates to:
  /// **'5,000'**
  String get adashiCreatePerCycleHint;

  /// No description provided for @adashiCreateCycleDays.
  ///
  /// In en, this message translates to:
  /// **'Cycle (Days)'**
  String get adashiCreateCycleDays;

  /// No description provided for @adashiCreateCycleDuration.
  ///
  /// In en, this message translates to:
  /// **'Cycle duration (days)'**
  String get adashiCreateCycleDuration;

  /// No description provided for @adashiCreateDaysOption.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String adashiCreateDaysOption(int days);

  /// No description provided for @adashiCreateStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get adashiCreateStartDate;

  /// No description provided for @adashiCreateStartDateHint.
  ///
  /// In en, this message translates to:
  /// **'mm/dd/yyyy'**
  String get adashiCreateStartDateHint;

  /// No description provided for @adashiCreateRotationMode.
  ///
  /// In en, this message translates to:
  /// **'Rotation mode'**
  String get adashiCreateRotationMode;

  /// No description provided for @adashiCreateAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get adashiCreateAuto;

  /// No description provided for @adashiCreateManual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get adashiCreateManual;

  /// No description provided for @adashiCreateAutoHint.
  ///
  /// In en, this message translates to:
  /// **'Auto mode selects the next recipient automatically.'**
  String get adashiCreateAutoHint;

  /// No description provided for @adashiCreateMakePublic.
  ///
  /// In en, this message translates to:
  /// **'Make public'**
  String get adashiCreateMakePublic;

  /// No description provided for @adashiCreateMakePublicHint.
  ///
  /// In en, this message translates to:
  /// **'Visible to others in Explore'**
  String get adashiCreateMakePublicHint;

  /// No description provided for @adashiCreateCollectionBank.
  ///
  /// In en, this message translates to:
  /// **'Collection bank'**
  String get adashiCreateCollectionBank;

  /// No description provided for @adashiCreatePayoutDetails.
  ///
  /// In en, this message translates to:
  /// **'Payout Details'**
  String get adashiCreatePayoutDetails;

  /// No description provided for @adashiCreateBank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get adashiCreateBank;

  /// No description provided for @adashiCreateSelectBank.
  ///
  /// In en, this message translates to:
  /// **'Select Bank'**
  String get adashiCreateSelectBank;

  /// No description provided for @adashiCreateNuban.
  ///
  /// In en, this message translates to:
  /// **'NUBAN'**
  String get adashiCreateNuban;

  /// No description provided for @adashiCreateNubanHint.
  ///
  /// In en, this message translates to:
  /// **'0123456789'**
  String get adashiCreateNubanHint;

  /// No description provided for @adashiCreateAccountName.
  ///
  /// In en, this message translates to:
  /// **'Account name'**
  String get adashiCreateAccountName;

  /// No description provided for @adashiCreateAccountNameHint.
  ///
  /// In en, this message translates to:
  /// **'Verified account holder'**
  String get adashiCreateAccountNameHint;

  /// No description provided for @adashiCreateTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the KeenPocket Terms of Service and acknowledge circle management rules.'**
  String get adashiCreateTerms;

  /// No description provided for @adashiCreateSubmit.
  ///
  /// In en, this message translates to:
  /// **'Create Adashi'**
  String get adashiCreateSubmit;

  /// No description provided for @adashiCreateTabletTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your Adashi'**
  String get adashiCreateTabletTitle;

  /// No description provided for @adashiCreateTabletBody.
  ///
  /// In en, this message translates to:
  /// **'Gather your friends, set your cycle, and start saving together. It\'s easy and transparent!'**
  String get adashiCreateTabletBody;

  /// No description provided for @adashiCreateAddMembersNote.
  ///
  /// In en, this message translates to:
  /// **'You can add members on the next step.'**
  String get adashiCreateAddMembersNote;

  /// No description provided for @adashiRotationScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Adashi: {name}'**
  String adashiRotationScreenTitle(String name);

  /// No description provided for @adashiRotationCurrentPot.
  ///
  /// In en, this message translates to:
  /// **'Current Pot'**
  String get adashiRotationCurrentPot;

  /// No description provided for @adashiRotationCollected.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Collected'**
  String adashiRotationCollected(int percent);

  /// No description provided for @adashiRotationTarget.
  ///
  /// In en, this message translates to:
  /// **'Target: {amount}'**
  String adashiRotationTarget(String amount);

  /// No description provided for @adashiRotationNextPayout.
  ///
  /// In en, this message translates to:
  /// **'Next Payout: {days, plural, =1{1 day left} other{{days} days left}}'**
  String adashiRotationNextPayout(int days);

  /// No description provided for @adashiRotationTipTitle.
  ///
  /// In en, this message translates to:
  /// **'Mr K\'s Tip'**
  String get adashiRotationTipTitle;

  /// No description provided for @adashiRotationOrder.
  ///
  /// In en, this message translates to:
  /// **'Rotation Order'**
  String get adashiRotationOrder;

  /// No description provided for @adashiRotationCycle.
  ///
  /// In en, this message translates to:
  /// **'Cycle {n}'**
  String adashiRotationCycle(int n);

  /// No description provided for @adashiRotationCycleActive.
  ///
  /// In en, this message translates to:
  /// **'Cycle {n} (Active)'**
  String adashiRotationCycleActive(int n);

  /// No description provided for @adashiRotationCycleNext.
  ///
  /// In en, this message translates to:
  /// **'Cycle {n} (Next)'**
  String adashiRotationCycleNext(int n);

  /// No description provided for @adashiRotationPaid.
  ///
  /// In en, this message translates to:
  /// **'{amount} Paid'**
  String adashiRotationPaid(String amount);

  /// No description provided for @adashiRotationPayout.
  ///
  /// In en, this message translates to:
  /// **'Payout: {amount}'**
  String adashiRotationPayout(String amount);

  /// No description provided for @adashiRotationDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 day left} other{{days} days left}}'**
  String adashiRotationDaysLeft(int days);

  /// No description provided for @adashiRotationExpected.
  ///
  /// In en, this message translates to:
  /// **'Expected {date}'**
  String adashiRotationExpected(String date);

  /// No description provided for @adashiRotationTransactionLog.
  ///
  /// In en, this message translates to:
  /// **'Transaction Log'**
  String get adashiRotationTransactionLog;

  /// No description provided for @adashiRotationGroupChat.
  ///
  /// In en, this message translates to:
  /// **'Group Chat'**
  String get adashiRotationGroupChat;

  /// No description provided for @adashiRotationInvite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get adashiRotationInvite;

  /// No description provided for @adashiRotationMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get adashiRotationMembers;

  /// No description provided for @adashiRotationActiveCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Active'**
  String adashiRotationActiveCount(int count);

  /// No description provided for @adashiRotationContributed.
  ///
  /// In en, this message translates to:
  /// **'Contributed'**
  String get adashiRotationContributed;

  /// No description provided for @adashiRotationStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get adashiRotationStatus;

  /// No description provided for @adashiRotationPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get adashiRotationPending;

  /// No description provided for @adashiRotationPayNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get adashiRotationPayNow;

  /// No description provided for @adashiRotationScheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get adashiRotationScheduled;

  /// No description provided for @adashiRotationYouBadge.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get adashiRotationYouBadge;

  /// No description provided for @adashiRotationInviteMember.
  ///
  /// In en, this message translates to:
  /// **'Invite New Member'**
  String get adashiRotationInviteMember;

  /// No description provided for @adashiRotationKycLevel.
  ///
  /// In en, this message translates to:
  /// **'KYC Level {level}'**
  String adashiRotationKycLevel(int level);

  /// No description provided for @adashiManageTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Adashi'**
  String get adashiManageTitle;

  /// No description provided for @adashiManageCircleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Circle: {name}'**
  String adashiManageCircleSubtitle(String name);

  /// No description provided for @adashiManageMembersTitle.
  ///
  /// In en, this message translates to:
  /// **'Circle Members'**
  String get adashiManageMembersTitle;

  /// No description provided for @adashiManageMembersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Members'**
  String adashiManageMembersCount(int count);

  /// No description provided for @adashiManageColPos.
  ///
  /// In en, this message translates to:
  /// **'Pos'**
  String get adashiManageColPos;

  /// No description provided for @adashiManageColMember.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get adashiManageColMember;

  /// No description provided for @adashiManageColStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get adashiManageColStatus;

  /// No description provided for @adashiManageReceiver.
  ///
  /// In en, this message translates to:
  /// **'Receiver'**
  String get adashiManageReceiver;

  /// No description provided for @adashiManageStatusReceived.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get adashiManageStatusReceived;

  /// No description provided for @adashiManageStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get adashiManageStatusActive;

  /// No description provided for @adashiManageAddMember.
  ///
  /// In en, this message translates to:
  /// **'Add Member'**
  String get adashiManageAddMember;

  /// No description provided for @adashiManagePhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get adashiManagePhoneLabel;

  /// No description provided for @adashiManagePhoneHint.
  ///
  /// In en, this message translates to:
  /// **'+1 (555) 000-0000'**
  String get adashiManagePhoneHint;

  /// No description provided for @adashiManageInvite.
  ///
  /// In en, this message translates to:
  /// **'Invite to Circle'**
  String get adashiManageInvite;

  /// No description provided for @adashiManageVerifyPayments.
  ///
  /// In en, this message translates to:
  /// **'Verify Payments'**
  String get adashiManageVerifyPayments;

  /// No description provided for @adashiManageReconcile.
  ///
  /// In en, this message translates to:
  /// **'Reconcile & Rotate'**
  String get adashiManageReconcile;

  /// No description provided for @adashiManageReconcileCaption.
  ///
  /// In en, this message translates to:
  /// **'Calculates balances and moves the payout to position #{position}'**
  String adashiManageReconcileCaption(String position);

  /// No description provided for @adashiManageOverrides.
  ///
  /// In en, this message translates to:
  /// **'Admin Overrides'**
  String get adashiManageOverrides;

  /// No description provided for @adashiManageSetReceiver.
  ///
  /// In en, this message translates to:
  /// **'Set Receiver'**
  String get adashiManageSetReceiver;

  /// No description provided for @adashiManageDeactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get adashiManageDeactivate;

  /// No description provided for @adashiManageAdjContrib.
  ///
  /// In en, this message translates to:
  /// **'Adj. Contrib'**
  String get adashiManageAdjContrib;

  /// No description provided for @adashiManageSetPosition.
  ///
  /// In en, this message translates to:
  /// **'Set Position'**
  String get adashiManageSetPosition;

  /// No description provided for @adashiManagePauseCircle.
  ///
  /// In en, this message translates to:
  /// **'Pause Circle'**
  String get adashiManagePauseCircle;

  /// No description provided for @adashiManageMarkPayout.
  ///
  /// In en, this message translates to:
  /// **'Mark Payout'**
  String get adashiManageMarkPayout;

  /// No description provided for @adashiManageMarkDispute.
  ///
  /// In en, this message translates to:
  /// **'Mark Dispute'**
  String get adashiManageMarkDispute;

  /// No description provided for @adashiManagePublicVisibility.
  ///
  /// In en, this message translates to:
  /// **'Public Visibility'**
  String get adashiManagePublicVisibility;

  /// No description provided for @adashiManageShowPayoutNames.
  ///
  /// In en, this message translates to:
  /// **'Show Payout Names'**
  String get adashiManageShowPayoutNames;

  /// No description provided for @adashiManageBankDetails.
  ///
  /// In en, this message translates to:
  /// **'Bank Details'**
  String get adashiManageBankDetails;

  /// No description provided for @adashiManageCircleRules.
  ///
  /// In en, this message translates to:
  /// **'Circle Rules'**
  String get adashiManageCircleRules;

  /// No description provided for @adashiManageClone.
  ///
  /// In en, this message translates to:
  /// **'Clone'**
  String get adashiManageClone;

  /// No description provided for @adashiManageExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get adashiManageExport;

  /// No description provided for @adashiManageSlot.
  ///
  /// In en, this message translates to:
  /// **'Slot {current} of {total}'**
  String adashiManageSlot(int current, int total);

  /// No description provided for @adashiManageCurrentRotation.
  ///
  /// In en, this message translates to:
  /// **'Current Rotation'**
  String get adashiManageCurrentRotation;

  /// No description provided for @adashiManageMascotTip.
  ///
  /// In en, this message translates to:
  /// **'Mr K says: \"Remember to verify all receipts before rotating!\"'**
  String get adashiManageMascotTip;

  /// No description provided for @adashiManageMembersFraction.
  ///
  /// In en, this message translates to:
  /// **'{active} / {total} Members'**
  String adashiManageMembersFraction(int active, int total);

  /// No description provided for @adashiManagePaymentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{amount} • Contribution'**
  String adashiManagePaymentSubtitle(String amount);

  /// No description provided for @adashiManageEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Member Email or Username'**
  String get adashiManageEmailLabel;

  /// No description provided for @adashiManageEmailHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. mr.k@keenpocket.com'**
  String get adashiManageEmailHint;

  /// No description provided for @adashiManageRotationSlot.
  ///
  /// In en, this message translates to:
  /// **'Rotation Slot'**
  String get adashiManageRotationSlot;

  /// No description provided for @adashiManageNextAvailable.
  ///
  /// In en, this message translates to:
  /// **'Next Available ({slot})'**
  String adashiManageNextAvailable(String slot);

  /// No description provided for @adashiManageSendInvite.
  ///
  /// In en, this message translates to:
  /// **'Send Invite'**
  String get adashiManageSendInvite;

  /// No description provided for @adashiManageReschedule.
  ///
  /// In en, this message translates to:
  /// **'Reschedule'**
  String get adashiManageReschedule;

  /// No description provided for @adashiManageCycleLength.
  ///
  /// In en, this message translates to:
  /// **'Cycle Length'**
  String get adashiManageCycleLength;

  /// No description provided for @adashiManageAuditLog.
  ///
  /// In en, this message translates to:
  /// **'Audit Log'**
  String get adashiManageAuditLog;

  /// No description provided for @adashiManageDissolve.
  ///
  /// In en, this message translates to:
  /// **'Dissolve Circle'**
  String get adashiManageDissolve;

  /// No description provided for @adashiManageExportLedger.
  ///
  /// In en, this message translates to:
  /// **'Export Ledger (CSV)'**
  String get adashiManageExportLedger;

  /// No description provided for @adashiManageCloneSettings.
  ///
  /// In en, this message translates to:
  /// **'Clone Settings'**
  String get adashiManageCloneSettings;

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

  /// No description provided for @profileLevel.
  ///
  /// In en, this message translates to:
  /// **'LVL {level}'**
  String profileLevel(int level);

  /// No description provided for @profileTrustScore.
  ///
  /// In en, this message translates to:
  /// **'Trust Score'**
  String get profileTrustScore;

  /// No description provided for @profileKycCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'KYC Identity Check'**
  String get profileKycCheckTitle;

  /// No description provided for @profileKycCheckBody.
  ///
  /// In en, this message translates to:
  /// **'Verify your ID to unlock higher pocket limits.'**
  String get profileKycCheckBody;

  /// No description provided for @profileVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get profileVerify;

  /// No description provided for @profileStatPaymentReliability.
  ///
  /// In en, this message translates to:
  /// **'Payment Reliability'**
  String get profileStatPaymentReliability;

  /// No description provided for @profileStatPocketsJoined.
  ///
  /// In en, this message translates to:
  /// **'Pockets Joined'**
  String get profileStatPocketsJoined;

  /// No description provided for @profileStatAdashisCompleted.
  ///
  /// In en, this message translates to:
  /// **'Adashis Completed'**
  String get profileStatAdashisCompleted;

  /// No description provided for @profileStatAvgRating.
  ///
  /// In en, this message translates to:
  /// **'Avg Rating'**
  String get profileStatAvgRating;

  /// No description provided for @profileViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get profileViewAll;

  /// No description provided for @profileRecentReviews.
  ///
  /// In en, this message translates to:
  /// **'Recent Reviews'**
  String get profileRecentReviews;

  /// No description provided for @profileSeeAllReviews.
  ///
  /// In en, this message translates to:
  /// **'See all {count} reviews'**
  String profileSeeAllReviews(int count);

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Profile Photo'**
  String get settingsProfilePhoto;

  /// No description provided for @settingsPhotoBlurb.
  ///
  /// In en, this message translates to:
  /// **'Update your photo to make your profile stand out to your connections.'**
  String get settingsPhotoBlurb;

  /// No description provided for @settingsUploadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload New Photo'**
  String get settingsUploadPhoto;

  /// No description provided for @settingsAccountInfo.
  ///
  /// In en, this message translates to:
  /// **'Account Info'**
  String get settingsAccountInfo;

  /// No description provided for @settingsName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get settingsName;

  /// No description provided for @settingsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get settingsEmail;

  /// No description provided for @settingsPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get settingsPhone;

  /// No description provided for @settingsContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support to change your email or phone.'**
  String get settingsContactSupport;

  /// No description provided for @settingsNotifPrefs.
  ///
  /// In en, this message translates to:
  /// **'Notification Preferences'**
  String get settingsNotifPrefs;

  /// No description provided for @settingsPushNotif.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get settingsPushNotif;

  /// No description provided for @settingsPushNotifSub.
  ///
  /// In en, this message translates to:
  /// **'Real-time alerts on your device'**
  String get settingsPushNotifSub;

  /// No description provided for @settingsSmsNotif.
  ///
  /// In en, this message translates to:
  /// **'SMS Notifications'**
  String get settingsSmsNotif;

  /// No description provided for @settingsSmsNotifSub.
  ///
  /// In en, this message translates to:
  /// **'Critical account updates via text'**
  String get settingsSmsNotifSub;

  /// No description provided for @settingsWhatsappNotif.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Updates'**
  String get settingsWhatsappNotif;

  /// No description provided for @settingsWhatsappNotifSub.
  ///
  /// In en, this message translates to:
  /// **'Weekly summaries and rewards'**
  String get settingsWhatsappNotifSub;

  /// No description provided for @settingsChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePassword;

  /// No description provided for @settingsCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get settingsCurrentPassword;

  /// No description provided for @settingsNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get settingsNewPassword;

  /// No description provided for @settingsConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get settingsConfirmPassword;

  /// No description provided for @settingsUpdatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get settingsUpdatePassword;

  /// No description provided for @settingsBankAccounts.
  ///
  /// In en, this message translates to:
  /// **'Bank Accounts'**
  String get settingsBankAccounts;

  /// No description provided for @settingsManage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get settingsManage;

  /// No description provided for @settingsPrimaryAccount.
  ///
  /// In en, this message translates to:
  /// **'Primary Linked Account'**
  String get settingsPrimaryAccount;

  /// No description provided for @settingsAppSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get settingsAppSettings;

  /// No description provided for @settingsDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsDarkMode;

  /// No description provided for @settingsMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get settingsMore;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String settingsVersion(String version);

  /// No description provided for @publicProfileYou.
  ///
  /// In en, this message translates to:
  /// **'(you)'**
  String get publicProfileYou;

  /// No description provided for @publicProfileVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get publicProfileVerified;

  /// No description provided for @publicProfileRating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get publicProfileRating;

  /// No description provided for @publicProfileGroups.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get publicProfileGroups;

  /// No description provided for @publicProfileTrust.
  ///
  /// In en, this message translates to:
  /// **'Trust'**
  String get publicProfileTrust;

  /// No description provided for @publicProfileGroupsBy.
  ///
  /// In en, this message translates to:
  /// **'Groups by {name}'**
  String publicProfileGroupsBy(String name);

  /// No description provided for @publicProfileOpenPocket.
  ///
  /// In en, this message translates to:
  /// **'Open Pocket'**
  String get publicProfileOpenPocket;

  /// No description provided for @publicProfileAdashiCircle.
  ///
  /// In en, this message translates to:
  /// **'Adashi Circle'**
  String get publicProfileAdashiCircle;

  /// No description provided for @publicProfileFunded.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Funded'**
  String publicProfileFunded(int percent);

  /// No description provided for @publicProfileRatingsReceived.
  ///
  /// In en, this message translates to:
  /// **'Ratings Received'**
  String get publicProfileRatingsReceived;

  /// No description provided for @publicProfileAddRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Add a Recommendation'**
  String get publicProfileAddRecommendation;

  /// No description provided for @publicProfileLegendTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re a Legend, {name}!'**
  String publicProfileLegendTitle(String name);

  /// No description provided for @publicProfileLegendBody.
  ///
  /// In en, this message translates to:
  /// **'Your reputation score is in the top 5% of Lagos contributors this month. Keep it up!'**
  String get publicProfileLegendBody;

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

  /// No description provided for @moneyPayoutAccount.
  ///
  /// In en, this message translates to:
  /// **'Payout account'**
  String get moneyPayoutAccount;

  /// No description provided for @moneyBankLabel.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get moneyBankLabel;

  /// No description provided for @moneyNubanLabel.
  ///
  /// In en, this message translates to:
  /// **'NUBAN'**
  String get moneyNubanLabel;

  /// No description provided for @moneyEditAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit account'**
  String get moneyEditAccount;

  /// No description provided for @moneyNoAccounts.
  ///
  /// In en, this message translates to:
  /// **'No payout account yet.'**
  String get moneyNoAccounts;

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

  /// No description provided for @trustScoreCaption.
  ///
  /// In en, this message translates to:
  /// **'Trust score'**
  String get trustScoreCaption;

  /// No description provided for @trustMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since {date}'**
  String trustMemberSince(String date);

  /// No description provided for @trustReliability.
  ///
  /// In en, this message translates to:
  /// **'Payment reliability'**
  String get trustReliability;

  /// No description provided for @trustPocketsJoined.
  ///
  /// In en, this message translates to:
  /// **'Pockets joined'**
  String get trustPocketsJoined;

  /// No description provided for @trustAdashisCompleted.
  ///
  /// In en, this message translates to:
  /// **'Adashis completed'**
  String get trustAdashisCompleted;

  /// No description provided for @trustAvgRating.
  ///
  /// In en, this message translates to:
  /// **'Avg rating ({count})'**
  String trustAvgRating(int count);

  /// No description provided for @trustRateTitle.
  ///
  /// In en, this message translates to:
  /// **'Rate {name}'**
  String trustRateTitle(String name);

  /// No description provided for @trustRateCommentHint.
  ///
  /// In en, this message translates to:
  /// **'Add a comment (optional)'**
  String get trustRateCommentHint;

  /// No description provided for @trustRateSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit rating'**
  String get trustRateSubmit;

  /// No description provided for @trustVouch.
  ///
  /// In en, this message translates to:
  /// **'Vouch'**
  String get trustVouch;

  /// No description provided for @trustInviteToPocket.
  ///
  /// In en, this message translates to:
  /// **'Invite to pocket'**
  String get trustInviteToPocket;

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

  /// No description provided for @discoverSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search pockets & adashi…'**
  String get discoverSearchPlaceholder;

  /// No description provided for @discoverFilterTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get discoverFilterTrending;

  /// No description provided for @discoverFilterSchoolFees.
  ///
  /// In en, this message translates to:
  /// **'School Fees'**
  String get discoverFilterSchoolFees;

  /// No description provided for @discoverFilterGroceries.
  ///
  /// In en, this message translates to:
  /// **'Groceries'**
  String get discoverFilterGroceries;

  /// No description provided for @discoverFilterTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get discoverFilterTravel;

  /// No description provided for @discoverPopularPockets.
  ///
  /// In en, this message translates to:
  /// **'Popular Pockets'**
  String get discoverPopularPockets;

  /// No description provided for @discoverViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get discoverViewAll;

  /// No description provided for @discoverContribution.
  ///
  /// In en, this message translates to:
  /// **'Contribution'**
  String get discoverContribution;

  /// No description provided for @discoverMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get discoverMembers;

  /// No description provided for @discoverStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get discoverStartDate;

  /// No description provided for @discoverAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin: {name}'**
  String discoverAdmin(String name);

  /// No description provided for @discoverBadgeKyc.
  ///
  /// In en, this message translates to:
  /// **'KYC Verified'**
  String get discoverBadgeKyc;

  /// No description provided for @discoverBadgeOfficial.
  ///
  /// In en, this message translates to:
  /// **'Official'**
  String get discoverBadgeOfficial;

  /// No description provided for @discoverBadgeAdashi.
  ///
  /// In en, this message translates to:
  /// **'Adashi'**
  String get discoverBadgeAdashi;

  /// No description provided for @discoverJoin.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get discoverJoin;

  /// No description provided for @discoverRating.
  ///
  /// In en, this message translates to:
  /// **'({rating})'**
  String discoverRating(String rating);

  /// No description provided for @discoverPerUnit.
  ///
  /// In en, this message translates to:
  /// **'/{unit}'**
  String discoverPerUnit(String unit);

  /// No description provided for @discoverTipTitle.
  ///
  /// In en, this message translates to:
  /// **'Mr K\'s Tip!'**
  String get discoverTipTitle;

  /// No description provided for @discoverTip.
  ///
  /// In en, this message translates to:
  /// **'Always check for the verified badge when joining public pockets!'**
  String get discoverTip;

  /// No description provided for @exploreManagedBy.
  ///
  /// In en, this message translates to:
  /// **'Managed by {name}'**
  String exploreManagedBy(String name);

  /// No description provided for @exploreRep.
  ///
  /// In en, this message translates to:
  /// **'{rating} Rep'**
  String exploreRep(String rating);

  /// No description provided for @exploreMembersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Members'**
  String exploreMembersCount(int count);

  /// No description provided for @explorePerCycle.
  ///
  /// In en, this message translates to:
  /// **'{amount} / cycle'**
  String explorePerCycle(String amount);

  /// No description provided for @exploreCycleLength.
  ///
  /// In en, this message translates to:
  /// **'{days}-day cycle'**
  String exploreCycleLength(int days);

  /// No description provided for @exploreAdminManaged.
  ///
  /// In en, this message translates to:
  /// **'Admin-managed — ask to be added'**
  String get exploreAdminManaged;

  /// No description provided for @exploreCircleRules.
  ///
  /// In en, this message translates to:
  /// **'Circle Rules'**
  String get exploreCircleRules;

  /// No description provided for @exploreJoinCircle.
  ///
  /// In en, this message translates to:
  /// **'Join Circle'**
  String get exploreJoinCircle;

  /// No description provided for @exploreMrKSays.
  ///
  /// In en, this message translates to:
  /// **'Mr. K says:'**
  String get exploreMrKSays;

  /// No description provided for @exploreVitalStats.
  ///
  /// In en, this message translates to:
  /// **'Circle Vital Stats'**
  String get exploreVitalStats;

  /// No description provided for @exploreMembersLabel.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get exploreMembersLabel;

  /// No description provided for @explorePerCycleLabel.
  ///
  /// In en, this message translates to:
  /// **'Per Cycle'**
  String get explorePerCycleLabel;

  /// No description provided for @exploreCycleLengthLabel.
  ///
  /// In en, this message translates to:
  /// **'Cycle Length'**
  String get exploreCycleLengthLabel;

  /// No description provided for @exploreMembersOfCapacity.
  ///
  /// In en, this message translates to:
  /// **'{filled}/{total}'**
  String exploreMembersOfCapacity(int filled, int total);

  /// No description provided for @exploreDaysValue.
  ///
  /// In en, this message translates to:
  /// **'{days} Days'**
  String exploreDaysValue(int days);

  /// No description provided for @exploreNextPayout.
  ///
  /// In en, this message translates to:
  /// **'Next Payout Progress'**
  String get exploreNextPayout;

  /// No description provided for @exploreRatingLabel.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get exploreRatingLabel;

  /// No description provided for @exploreCirclesLabel.
  ///
  /// In en, this message translates to:
  /// **'Circles'**
  String get exploreCirclesLabel;

  /// No description provided for @exploreCompletionLabel.
  ///
  /// In en, this message translates to:
  /// **'Completion'**
  String get exploreCompletionLabel;

  /// No description provided for @exploreCircleOrganiser.
  ///
  /// In en, this message translates to:
  /// **'{circle} Organiser'**
  String exploreCircleOrganiser(String circle);

  /// No description provided for @exploreLimitedSpots.
  ///
  /// In en, this message translates to:
  /// **'Limited spots available.'**
  String get exploreLimitedSpots;

  /// No description provided for @insightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Insights & Reports'**
  String get insightsTitle;

  /// No description provided for @insightsYearInReview.
  ///
  /// In en, this message translates to:
  /// **'Year in Review'**
  String get insightsYearInReview;

  /// No description provided for @insightsHeroBody.
  ///
  /// In en, this message translates to:
  /// **'Wow! You\'ve had an incredible year of smart saving and generous giving, Mr. K is proud!'**
  String get insightsHeroBody;

  /// No description provided for @insightsTotalSaved.
  ///
  /// In en, this message translates to:
  /// **'Total Saved ₦'**
  String get insightsTotalSaved;

  /// No description provided for @insightsTotalSavedCaption.
  ///
  /// In en, this message translates to:
  /// **'verified contributions'**
  String get insightsTotalSavedCaption;

  /// No description provided for @insightsSavedThisYear.
  ///
  /// In en, this message translates to:
  /// **'Saved This Year ₦'**
  String get insightsSavedThisYear;

  /// No description provided for @insightsSavedThisYearCaption.
  ///
  /// In en, this message translates to:
  /// **'24% increase from 2023'**
  String get insightsSavedThisYearCaption;

  /// No description provided for @insightsDonated.
  ///
  /// In en, this message translates to:
  /// **'Donated (Sadaqah) ₦'**
  String get insightsDonated;

  /// No description provided for @insightsDonatedCaption.
  ///
  /// In en, this message translates to:
  /// **'making a difference'**
  String get insightsDonatedCaption;

  /// No description provided for @insightsContributions.
  ///
  /// In en, this message translates to:
  /// **'Contributions'**
  String get insightsContributions;

  /// No description provided for @insightsContributionsCaption.
  ///
  /// In en, this message translates to:
  /// **'verified transactions'**
  String get insightsContributionsCaption;

  /// No description provided for @insightsPockets.
  ///
  /// In en, this message translates to:
  /// **'Pockets'**
  String get insightsPockets;

  /// No description provided for @insightsPocketsCaption.
  ///
  /// In en, this message translates to:
  /// **'active goals'**
  String get insightsPocketsCaption;

  /// No description provided for @insightsAdashi.
  ///
  /// In en, this message translates to:
  /// **'Adashi'**
  String get insightsAdashi;

  /// No description provided for @insightsAdashiCaption.
  ///
  /// In en, this message translates to:
  /// **'community circles'**
  String get insightsAdashiCaption;

  /// No description provided for @insightsFootnote.
  ///
  /// In en, this message translates to:
  /// **'KeenPocket keeps the records — it never holds your money.'**
  String get insightsFootnote;

  /// No description provided for @insightsShareMyYear.
  ///
  /// In en, this message translates to:
  /// **'Share My Year'**
  String get insightsShareMyYear;

  /// No description provided for @insightsMrKAdvice.
  ///
  /// In en, this message translates to:
  /// **'Mr. K\'s Advice'**
  String get insightsMrKAdvice;

  /// No description provided for @insightsMrKAdviceBody.
  ///
  /// In en, this message translates to:
  /// **'Building wealth is a marathon, not a sprint. Your consistency this year is truly inspiring. Why not aim for a 5% increase in your Sadaqah next month?'**
  String get insightsMrKAdviceBody;

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
  /// **'Hello, {name}'**
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

  /// No description provided for @dashboardAdashiGroups.
  ///
  /// In en, this message translates to:
  /// **'Adashi groups'**
  String get dashboardAdashiGroups;

  /// No description provided for @dashboardReputation.
  ///
  /// In en, this message translates to:
  /// **'Reputation'**
  String get dashboardReputation;

  /// No description provided for @dashboardWalletBalance.
  ///
  /// In en, this message translates to:
  /// **'Wallet balance'**
  String get dashboardWalletBalance;

  /// No description provided for @dashboardComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get dashboardComplete;

  /// No description provided for @dashboardWeekStreak.
  ///
  /// In en, this message translates to:
  /// **'Week streak'**
  String get dashboardWeekStreak;

  /// No description provided for @dashboardFreezesLeft.
  ///
  /// In en, this message translates to:
  /// **'Freezes left'**
  String get dashboardFreezesLeft;

  /// No description provided for @dashboardResetsMonday.
  ///
  /// In en, this message translates to:
  /// **'Resets Monday'**
  String get dashboardResetsMonday;

  /// No description provided for @dashboardClaimReward.
  ///
  /// In en, this message translates to:
  /// **'Claim reward'**
  String get dashboardClaimReward;

  /// No description provided for @dashboardContributionTrend.
  ///
  /// In en, this message translates to:
  /// **'Contribution trend'**
  String get dashboardContributionTrend;

  /// No description provided for @dashboardMyPockets.
  ///
  /// In en, this message translates to:
  /// **'My Pockets'**
  String get dashboardMyPockets;

  /// No description provided for @dashboardMyAdashi.
  ///
  /// In en, this message translates to:
  /// **'My Adashi'**
  String get dashboardMyAdashi;

  /// No description provided for @dashboardViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get dashboardViewAll;

  /// No description provided for @dashboardPerHand.
  ///
  /// In en, this message translates to:
  /// **'{amount} / hand'**
  String dashboardPerHand(String amount);

  /// No description provided for @dashboardPerCycle.
  ///
  /// In en, this message translates to:
  /// **'{amount} / cycle'**
  String dashboardPerCycle(String amount);

  /// No description provided for @dashboardMembersParticipating.
  ///
  /// In en, this message translates to:
  /// **'{count} members participating'**
  String dashboardMembersParticipating(int count);

  /// No description provided for @dashboardJoinGroup.
  ///
  /// In en, this message translates to:
  /// **'Join group'**
  String get dashboardJoinGroup;

  /// No description provided for @dashboardPoints.
  ///
  /// In en, this message translates to:
  /// **'PTS'**
  String get dashboardPoints;

  /// No description provided for @dashboardTabOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get dashboardTabOverview;

  /// No description provided for @dashboardTabHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get dashboardTabHistory;

  /// No description provided for @dashboardTabAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get dashboardTabAnalytics;

  /// No description provided for @dashboardSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search…'**
  String get dashboardSearchHint;

  /// No description provided for @dashboardSavedThisMonth.
  ///
  /// In en, this message translates to:
  /// **'You\'ve saved {amount} this month. Keep it up!'**
  String dashboardSavedThisMonth(String amount);

  /// No description provided for @dashboardStreakTitle.
  ///
  /// In en, this message translates to:
  /// **'{count}-week streak!'**
  String dashboardStreakTitle(int count);

  /// No description provided for @dashboardStreakSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re on fire! {count} streak freezes left 🧊'**
  String dashboardStreakSubtitle(int count);

  /// No description provided for @dashboardLast7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get dashboardLast7Days;

  /// No description provided for @dashboardTrendCaption.
  ///
  /// In en, this message translates to:
  /// **'Visualizing your progress…'**
  String get dashboardTrendCaption;

  /// No description provided for @dashboardInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get dashboardInProgress;

  /// No description provided for @dashboardActiveCycle.
  ///
  /// In en, this message translates to:
  /// **'Active cycle'**
  String get dashboardActiveCycle;

  /// No description provided for @dashboardGoalReached.
  ///
  /// In en, this message translates to:
  /// **'{percent}% of goal reached'**
  String dashboardGoalReached(int percent);

  /// No description provided for @dashboardFooter.
  ///
  /// In en, this message translates to:
  /// **'KeenPocket keeps the records — it never holds your money.'**
  String get dashboardFooter;

  /// No description provided for @dashboardCopyright.
  ///
  /// In en, this message translates to:
  /// **'© KeenPocket Nigeria'**
  String get dashboardCopyright;

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

  /// No description provided for @charityRaised.
  ///
  /// In en, this message translates to:
  /// **'{amount} raised'**
  String charityRaised(String amount);

  /// No description provided for @charityGoal.
  ///
  /// In en, this message translates to:
  /// **'{amount} goal'**
  String charityGoal(String amount);

  /// No description provided for @charityReached.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Reached'**
  String charityReached(int percent);

  /// No description provided for @charityEnterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Donation Amount'**
  String get charityEnterAmount;

  /// No description provided for @charityDonateNow.
  ///
  /// In en, this message translates to:
  /// **'Donate Now'**
  String get charityDonateNow;

  /// No description provided for @charitySecure.
  ///
  /// In en, this message translates to:
  /// **'Your contribution is secure and transparent.'**
  String get charitySecure;

  /// No description provided for @charityFinancialGoal.
  ///
  /// In en, this message translates to:
  /// **'Financial Goal'**
  String get charityFinancialGoal;

  /// No description provided for @charityResourceGoal.
  ///
  /// In en, this message translates to:
  /// **'Resource Goal'**
  String get charityResourceGoal;

  /// No description provided for @charityItemsProgress.
  ///
  /// In en, this message translates to:
  /// **'{current} / {total}'**
  String charityItemsProgress(int current, int total);

  /// No description provided for @charityDonateItems.
  ///
  /// In en, this message translates to:
  /// **'Donate Items'**
  String get charityDonateItems;

  /// No description provided for @charitySelectItem.
  ///
  /// In en, this message translates to:
  /// **'Select Item'**
  String get charitySelectItem;

  /// No description provided for @charityQty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get charityQty;

  /// No description provided for @charityPledgeItems.
  ///
  /// In en, this message translates to:
  /// **'Pledge Items'**
  String get charityPledgeItems;

  /// No description provided for @charityRecentContributions.
  ///
  /// In en, this message translates to:
  /// **'Recent Contributions'**
  String get charityRecentContributions;

  /// No description provided for @charityViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get charityViewAll;

  /// No description provided for @charityMascotTitle.
  ///
  /// In en, this message translates to:
  /// **'Mr. K says: \"You\'re a Hero!\"'**
  String get charityMascotTitle;

  /// No description provided for @charityMascotBody.
  ///
  /// In en, this message translates to:
  /// **'Small acts, when multiplied by millions of people, can transform the world. Thank you for your kindness!'**
  String get charityMascotBody;

  /// No description provided for @charityHeroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help us provide essential supplies to those in need. Every contribution brings us closer to our goal.'**
  String get charityHeroSubtitle;

  /// No description provided for @charityMakeContribution.
  ///
  /// In en, this message translates to:
  /// **'Make a Contribution'**
  String get charityMakeContribution;

  /// No description provided for @charityTabMoney.
  ///
  /// In en, this message translates to:
  /// **'Money'**
  String get charityTabMoney;

  /// No description provided for @charityTabResources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get charityTabResources;

  /// No description provided for @charityAddNote.
  ///
  /// In en, this message translates to:
  /// **'Add a Note (Optional)'**
  String get charityAddNote;

  /// No description provided for @charityAddNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Write something inspiring…'**
  String get charityAddNoteHint;

  /// No description provided for @charitySecuredPay.
  ///
  /// In en, this message translates to:
  /// **'Secured with KeenPocket Pay. No transaction fees.'**
  String get charitySecuredPay;

  /// No description provided for @charityRecentHeroes.
  ///
  /// In en, this message translates to:
  /// **'Recent Heroes'**
  String get charityRecentHeroes;

  /// No description provided for @charitySetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Charity Drive Setup'**
  String get charitySetupTitle;

  /// No description provided for @charitySetupGreetingTitle.
  ///
  /// In en, this message translates to:
  /// **'Hi! I\'m Mr. K'**
  String get charitySetupGreetingTitle;

  /// No description provided for @charitySetupGreetingBody.
  ///
  /// In en, this message translates to:
  /// **'Let\'s set up something amazing together. Every bit counts!'**
  String get charitySetupGreetingBody;

  /// No description provided for @charityDriveTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Drive Title'**
  String get charityDriveTitleLabel;

  /// No description provided for @charityDriveTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Winter Warmth Initiative'**
  String get charityDriveTitleHint;

  /// No description provided for @charityDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get charityDescriptionLabel;

  /// No description provided for @charityDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Tell your donors what this drive is about…'**
  String get charityDescriptionHint;

  /// No description provided for @charityGoalTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Goal Type'**
  String get charityGoalTypeLabel;

  /// No description provided for @charityGoalTypeAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get charityGoalTypeAmount;

  /// No description provided for @charityGoalTypeItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get charityGoalTypeItems;

  /// No description provided for @charityTargetAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Target Amount (₦)'**
  String get charityTargetAmountLabel;

  /// No description provided for @charityTargetAmountHint.
  ///
  /// In en, this message translates to:
  /// **'50,000'**
  String get charityTargetAmountHint;

  /// No description provided for @charityItemNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Item Name'**
  String get charityItemNameLabel;

  /// No description provided for @charityUnitLabel.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get charityUnitLabel;

  /// No description provided for @charityAddAnotherItem.
  ///
  /// In en, this message translates to:
  /// **'Add Another Item'**
  String get charityAddAnotherItem;

  /// No description provided for @charityShowBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Show donor breakdown'**
  String get charityShowBreakdown;

  /// No description provided for @charityShowBreakdownSub.
  ///
  /// In en, this message translates to:
  /// **'Let people see who donated what'**
  String get charityShowBreakdownSub;

  /// No description provided for @charityProTipLabel.
  ///
  /// In en, this message translates to:
  /// **'Pro Tip:'**
  String get charityProTipLabel;

  /// No description provided for @charityProTipBody.
  ///
  /// In en, this message translates to:
  /// **'Drives with clear descriptions and visual item lists usually get 40% more engagement!'**
  String get charityProTipBody;

  /// No description provided for @charitySaveDrive.
  ///
  /// In en, this message translates to:
  /// **'Save Drive'**
  String get charitySaveDrive;

  /// No description provided for @charityDonateTitle.
  ///
  /// In en, this message translates to:
  /// **'Donation'**
  String get charityDonateTitle;

  /// No description provided for @charityActiveRelief.
  ///
  /// In en, this message translates to:
  /// **'Active Relief'**
  String get charityActiveRelief;

  /// No description provided for @charityDonateTabletDescription.
  ///
  /// In en, this message translates to:
  /// **'Join our community pocket to provide urgent medical aid and logistical support for families displaced by recent climate events. Every contribution counts toward our collective goal.'**
  String get charityDonateTabletDescription;

  /// No description provided for @charityMascotImpact.
  ///
  /// In en, this message translates to:
  /// **'You\'re making a huge impact! This pocket has grown 15% since yesterday. Let\'s keep the momentum going!'**
  String get charityMascotImpact;

  /// No description provided for @charityEnterAmountTablet.
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get charityEnterAmountTablet;

  /// No description provided for @charityResourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Resource'**
  String get charityResourceLabel;

  /// No description provided for @charityCreateDriveTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Your Drive'**
  String get charityCreateDriveTitle;

  /// No description provided for @charityCreateDriveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help others by setting up a focused savings target.'**
  String get charityCreateDriveSubtitle;

  /// No description provided for @charityGoalTypeAmountFull.
  ///
  /// In en, this message translates to:
  /// **'Amount (₦)'**
  String get charityGoalTypeAmountFull;

  /// No description provided for @charityGoalTypeItemsFull.
  ///
  /// In en, this message translates to:
  /// **'Items Target'**
  String get charityGoalTypeItemsFull;

  /// No description provided for @charitySetupTabletTip.
  ///
  /// In en, this message translates to:
  /// **'Setting a clear, realistic goal helps donors feel more confident! Drives with detailed descriptions raise 40% more on KeenPocket.'**
  String get charitySetupTabletTip;

  /// No description provided for @charityLivePreview.
  ///
  /// In en, this message translates to:
  /// **'Live Preview'**
  String get charityLivePreview;

  /// No description provided for @charityTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get charityTrending;

  /// No description provided for @charitySupportDrive.
  ///
  /// In en, this message translates to:
  /// **'Support Drive'**
  String get charitySupportDrive;

  /// No description provided for @charityLaunchDrive.
  ///
  /// In en, this message translates to:
  /// **'Launch Charity Drive'**
  String get charityLaunchDrive;

  /// No description provided for @charitySaveDraft.
  ///
  /// In en, this message translates to:
  /// **'Save as Draft'**
  String get charitySaveDraft;

  /// No description provided for @charityTargetLabel.
  ///
  /// In en, this message translates to:
  /// **'Target: {amount}'**
  String charityTargetLabel(String amount);

  /// No description provided for @charityPreviewTitleFallback.
  ///
  /// In en, this message translates to:
  /// **'Your Charity Title'**
  String get charityPreviewTitleFallback;

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

  /// No description provided for @plansWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to your Plans!'**
  String get plansWelcomeTitle;

  /// No description provided for @plansWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'I\'m Mr. K, your grocery sidekick. Let\'s make sure you never miss an item or blow your budget again. Ready to organize your June haul?'**
  String get plansWelcomeBody;

  /// No description provided for @plansCadenceMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get plansCadenceMonthly;

  /// No description provided for @plansCadenceWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get plansCadenceWeekly;

  /// No description provided for @plansBoughtCount.
  ///
  /// In en, this message translates to:
  /// **'Bought {count}'**
  String plansBoughtCount(int count);

  /// No description provided for @plansPendingCount.
  ///
  /// In en, this message translates to:
  /// **'Pending {count}'**
  String plansPendingCount(int count);

  /// No description provided for @plansDeferredCount.
  ///
  /// In en, this message translates to:
  /// **'Deferred {count}'**
  String plansDeferredCount(int count);

  /// No description provided for @plansBudgetProgress.
  ///
  /// In en, this message translates to:
  /// **'Budget Progress'**
  String get plansBudgetProgress;

  /// No description provided for @plansCreatePlan.
  ///
  /// In en, this message translates to:
  /// **'Create plan'**
  String get plansCreatePlan;

  /// No description provided for @plansCockpitTitle.
  ///
  /// In en, this message translates to:
  /// **'Savings Cockpit'**
  String get plansCockpitTitle;

  /// No description provided for @plansCockpitSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your grocery strategy for the month'**
  String get plansCockpitSubtitle;

  /// No description provided for @plansMonthlyGoal.
  ///
  /// In en, this message translates to:
  /// **'Monthly Goal'**
  String get plansMonthlyGoal;

  /// No description provided for @plansGoalReached.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Reached'**
  String plansGoalReached(int percent);

  /// No description provided for @plansStatBought.
  ///
  /// In en, this message translates to:
  /// **'Bought'**
  String get plansStatBought;

  /// No description provided for @plansStatPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get plansStatPending;

  /// No description provided for @plansStatDeferred.
  ///
  /// In en, this message translates to:
  /// **'Deferred'**
  String get plansStatDeferred;

  /// No description provided for @plansDoingGreatTitle.
  ///
  /// In en, this message translates to:
  /// **'Doing Great!'**
  String get plansDoingGreatTitle;

  /// No description provided for @plansDoingGreatBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve saved over {amount} this week by choosing deferred items wisely. Mr. K is proud of your grocery discipline!'**
  String plansDoingGreatBody(String amount);

  /// No description provided for @plansViewAnalytics.
  ///
  /// In en, this message translates to:
  /// **'View Analytics'**
  String get plansViewAnalytics;

  /// No description provided for @plansHighPriorityItems.
  ///
  /// In en, this message translates to:
  /// **'High Priority Items'**
  String get plansHighPriorityItems;

  /// No description provided for @plansSavingsHack.
  ///
  /// In en, this message translates to:
  /// **'Savings Hack'**
  String get plansSavingsHack;

  /// No description provided for @plansSavingsHackBody.
  ///
  /// In en, this message translates to:
  /// **'Shopping on Tuesdays at FreshMarket can save you 5% on dairy and grains. Sync your \'Family Groceries\' plan for Tuesday!'**
  String get plansSavingsHackBody;

  /// No description provided for @plansAiNudge.
  ///
  /// In en, this message translates to:
  /// **'AI-Nudge Suggestion'**
  String get plansAiNudge;

  /// No description provided for @planCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'New Plan'**
  String get planCreateTitle;

  /// No description provided for @planCreateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s map out your next financial journey!'**
  String get planCreateSubtitle;

  /// No description provided for @planCreateMascotTip.
  ///
  /// In en, this message translates to:
  /// **'\"Planning is the first step to winning, champion!\" — Mr. K'**
  String get planCreateMascotTip;

  /// No description provided for @planTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Plan Title'**
  String get planTitleLabel;

  /// No description provided for @planTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Dream Vacation 2024'**
  String get planTitleHint;

  /// No description provided for @planPeriodType.
  ///
  /// In en, this message translates to:
  /// **'Period Type'**
  String get planPeriodType;

  /// No description provided for @planPeriodMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get planPeriodMonth;

  /// No description provided for @planPeriodYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get planPeriodYear;

  /// No description provided for @planSelectMonthYear.
  ///
  /// In en, this message translates to:
  /// **'Select Month & Year'**
  String get planSelectMonthYear;

  /// No description provided for @planTargetBudget.
  ///
  /// In en, this message translates to:
  /// **'Target Budget (Optional)'**
  String get planTargetBudget;

  /// No description provided for @planBudgetHint.
  ///
  /// In en, this message translates to:
  /// **'0.00'**
  String get planBudgetHint;

  /// No description provided for @planSmartTip.
  ///
  /// In en, this message translates to:
  /// **'Smart Tip: Any items you carry over from previous plans will automatically get a ⭐ STAR PRIORITY status!'**
  String get planSmartTip;

  /// No description provided for @planCarryOver.
  ///
  /// In en, this message translates to:
  /// **'Carry over deferred items'**
  String get planCarryOver;

  /// No description provided for @planCarryOverSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Include unfinished items from last plan'**
  String get planCarryOverSubtitle;

  /// No description provided for @planCreateSubmit.
  ///
  /// In en, this message translates to:
  /// **'Create Plan'**
  String get planCreateSubmit;

  /// No description provided for @planPoweredBy.
  ///
  /// In en, this message translates to:
  /// **'Powered by KeenPocket Intelligence'**
  String get planPoweredBy;

  /// No description provided for @planSaveDraft.
  ///
  /// In en, this message translates to:
  /// **'Save Draft'**
  String get planSaveDraft;

  /// No description provided for @planCreateMyPlan.
  ///
  /// In en, this message translates to:
  /// **'Create My Plan'**
  String get planCreateMyPlan;

  /// No description provided for @planReadyToSave.
  ///
  /// In en, this message translates to:
  /// **'Ready to save, Chef?'**
  String get planReadyToSave;

  /// No description provided for @planReadyToSaveBody.
  ///
  /// In en, this message translates to:
  /// **'Setting a clear period and budget helps me find the best deals for your household this season!'**
  String get planReadyToSaveBody;

  /// No description provided for @planTabletTitle.
  ///
  /// In en, this message translates to:
  /// **'Grocery Plan'**
  String get planTabletTitle;

  /// No description provided for @planTabletSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Savings Cockpit • Design your budget flow'**
  String get planTabletSubtitle;

  /// No description provided for @planStarPriorityTip.
  ///
  /// In en, this message translates to:
  /// **'Smart Tip: Star Priority'**
  String get planStarPriorityTip;

  /// No description provided for @planStarPriorityTipBody.
  ///
  /// In en, this message translates to:
  /// **'Mark items with a Star Priority to ensure they are funded first in your Savings Cockpit.'**
  String get planStarPriorityTipBody;

  /// No description provided for @planStatDuration.
  ///
  /// In en, this message translates to:
  /// **'Plan Duration'**
  String get planStatDuration;

  /// No description provided for @planStatDurationValue.
  ///
  /// In en, this message translates to:
  /// **'31 Days'**
  String get planStatDurationValue;

  /// No description provided for @planStatAvgItems.
  ///
  /// In en, this message translates to:
  /// **'Avg. Items'**
  String get planStatAvgItems;

  /// No description provided for @planStatAvgItemsValue.
  ///
  /// In en, this message translates to:
  /// **'42 Units'**
  String get planStatAvgItemsValue;

  /// No description provided for @planStatEstSavings.
  ///
  /// In en, this message translates to:
  /// **'Est. Savings'**
  String get planStatEstSavings;

  /// No description provided for @planStatEstSavingsValue.
  ///
  /// In en, this message translates to:
  /// **'12% Boost'**
  String get planStatEstSavingsValue;

  /// No description provided for @planDetailPlanningPeriod.
  ///
  /// In en, this message translates to:
  /// **'Planning Period: {period}'**
  String planDetailPlanningPeriod(String period);

  /// No description provided for @planDetailPersonalPlan.
  ///
  /// In en, this message translates to:
  /// **'Personal Plan'**
  String get planDetailPersonalPlan;

  /// No description provided for @planDetailDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get planDetailDraft;

  /// No description provided for @planDetailTotalItems.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get planDetailTotalItems;

  /// No description provided for @planDetailBought.
  ///
  /// In en, this message translates to:
  /// **'Bought'**
  String get planDetailBought;

  /// No description provided for @planDetailDeferred.
  ///
  /// In en, this message translates to:
  /// **'Deferred'**
  String get planDetailDeferred;

  /// No description provided for @planDetailEstimated.
  ///
  /// In en, this message translates to:
  /// **'Estimated'**
  String get planDetailEstimated;

  /// No description provided for @planDetailBudgetHealth.
  ///
  /// In en, this message translates to:
  /// **'Budget Health'**
  String get planDetailBudgetHealth;

  /// No description provided for @planDetailSpentOf.
  ///
  /// In en, this message translates to:
  /// **'Spent: {spent} / {budget}'**
  String planDetailSpentOf(String spent, String budget);

  /// No description provided for @planDetailItemChecklist.
  ///
  /// In en, this message translates to:
  /// **'Item Checklist'**
  String get planDetailItemChecklist;

  /// No description provided for @planItemQtyPrice.
  ///
  /// In en, this message translates to:
  /// **'{qty} × {price}'**
  String planItemQtyPrice(int qty, String price);

  /// No description provided for @planItemPurchased.
  ///
  /// In en, this message translates to:
  /// **'Purchased'**
  String get planItemPurchased;

  /// No description provided for @planItemPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get planItemPending;

  /// No description provided for @planItemDeferred.
  ///
  /// In en, this message translates to:
  /// **'Deferred'**
  String get planItemDeferred;

  /// No description provided for @planItemBuyIt.
  ///
  /// In en, this message translates to:
  /// **'I\'ll buy it'**
  String get planItemBuyIt;

  /// No description provided for @planItemReactivate.
  ///
  /// In en, this message translates to:
  /// **'Re-activate'**
  String get planItemReactivate;

  /// No description provided for @planAddNewItem.
  ///
  /// In en, this message translates to:
  /// **'Add New Item'**
  String get planAddNewItem;

  /// No description provided for @planItemNameHint.
  ///
  /// In en, this message translates to:
  /// **'Item name (e.g. Milk)'**
  String get planItemNameHint;

  /// No description provided for @planItemQtyHint.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get planItemQtyHint;

  /// No description provided for @planAddItem.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get planAddItem;

  /// No description provided for @planSharedWith.
  ///
  /// In en, this message translates to:
  /// **'Shared with'**
  String get planSharedWith;

  /// No description provided for @planCollaboratorsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Collaborators'**
  String planCollaboratorsCount(int count);

  /// No description provided for @planRoleOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get planRoleOwner;

  /// No description provided for @planRoleCollaborator.
  ///
  /// In en, this message translates to:
  /// **'Collaborator'**
  String get planRoleCollaborator;

  /// No description provided for @planInviteLabel.
  ///
  /// In en, this message translates to:
  /// **'Invite via Email or Phone'**
  String get planInviteLabel;

  /// No description provided for @planInviteHint.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get planInviteHint;

  /// No description provided for @planInviteSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get planInviteSend;

  /// No description provided for @planQuickAdd.
  ///
  /// In en, this message translates to:
  /// **'Quick Add'**
  String get planQuickAdd;

  /// No description provided for @planColStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get planColStatus;

  /// No description provided for @planColItem.
  ///
  /// In en, this message translates to:
  /// **'Item Description'**
  String get planColItem;

  /// No description provided for @planColCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get planColCategory;

  /// No description provided for @planColPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get planColPrice;

  /// No description provided for @planColActions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get planColActions;

  /// No description provided for @planGreatList.
  ///
  /// In en, this message translates to:
  /// **'Great list!'**
  String get planGreatList;

  /// No description provided for @planGreatListBody.
  ///
  /// In en, this message translates to:
  /// **'You\'re crushing your savings goal this week!'**
  String get planGreatListBody;

  /// No description provided for @shoppingListTitle.
  ///
  /// In en, this message translates to:
  /// **'Shopping list'**
  String get shoppingListTitle;

  /// No description provided for @shoppingUnitPrice.
  ///
  /// In en, this message translates to:
  /// **'{price} / unit'**
  String shoppingUnitPrice(String price);

  /// No description provided for @shoppingSharing.
  ///
  /// In en, this message translates to:
  /// **'× {count} sharing'**
  String shoppingSharing(int count);

  /// No description provided for @shoppingTotalCost.
  ///
  /// In en, this message translates to:
  /// **'Total cost'**
  String get shoppingTotalCost;

  /// No description provided for @shoppingEstimatedTotal.
  ///
  /// In en, this message translates to:
  /// **'Estimated group total'**
  String get shoppingEstimatedTotal;

  /// No description provided for @shoppingSuggestItem.
  ///
  /// In en, this message translates to:
  /// **'Suggest item'**
  String get shoppingSuggestItem;

  /// No description provided for @shoppingSuggestionsClosed.
  ///
  /// In en, this message translates to:
  /// **'Suggestions closed'**
  String get shoppingSuggestionsClosed;

  /// No description provided for @shoppingEmpty.
  ///
  /// In en, this message translates to:
  /// **'No items yet — suggest the first one.'**
  String get shoppingEmpty;

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

  /// No description provided for @groupChatMembersOnline.
  ///
  /// In en, this message translates to:
  /// **'{count} members online'**
  String groupChatMembersOnline(int count);

  /// No description provided for @groupChatEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No messages yet — say hello 👋'**
  String get groupChatEmptyTitle;

  /// No description provided for @groupChatEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Be the first to start the conversation.'**
  String get groupChatEmptyMessage;

  /// No description provided for @disputesTitle.
  ///
  /// In en, this message translates to:
  /// **'Disputes'**
  String get disputesTitle;

  /// No description provided for @disputesRaise.
  ///
  /// In en, this message translates to:
  /// **'Raise a dispute'**
  String get disputesRaise;

  /// No description provided for @disputesActiveCases.
  ///
  /// In en, this message translates to:
  /// **'Active cases'**
  String get disputesActiveCases;

  /// No description provided for @disputesOpenCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No open cases} =1{1 open} other{{count} open}}'**
  String disputesOpenCount(int count);

  /// No description provided for @disputesResolvedThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Resolved this month'**
  String get disputesResolvedThisMonth;

  /// No description provided for @disputesAvgResolution.
  ///
  /// In en, this message translates to:
  /// **'Avg. resolution time'**
  String get disputesAvgResolution;

  /// No description provided for @disputesResolutionNote.
  ///
  /// In en, this message translates to:
  /// **'Resolution note'**
  String get disputesResolutionNote;

  /// No description provided for @disputesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No disputes — all clear.'**
  String get disputesEmpty;

  /// No description provided for @disputeStatusOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get disputeStatusOpen;

  /// No description provided for @disputeStatusResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get disputeStatusResolved;

  /// No description provided for @disputeStatusDismissed.
  ///
  /// In en, this message translates to:
  /// **'Dismissed'**
  String get disputeStatusDismissed;

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
