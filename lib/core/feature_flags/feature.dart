/// Client feature flags. Keys mirror the backend env names so the
/// [FeatureFlagService] can hydrate directly from status endpoints
/// (`payments/status`, `kyc/status`, …) and Remote Config.
enum Feature {
  wallet('WALLET_ENABLED'),
  payments('PAYMENTS_ENABLED'),
  payouts('PAYOUTS_ENABLED'),
  kyc('KYC_ENABLED'),
  otp('OTP_ENABLED'),
  referrals('REFERRALS_ENABLED'),
  gamification('GAMIFICATION_ENABLED'),
  charity('CHARITY_ENABLED'),
  chat('CHAT_ENABLED'),
  school('SCHOOL_ENABLED'),
  plans('PLANS_ENABLED');

  const Feature(this.key);

  /// Backend/Remote-Config flag key.
  final String key;
}
