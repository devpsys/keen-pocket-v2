/// Public surface of the `friends` feature. Other features import only this
/// barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/referral.dart';
export 'domain/repositories/referrals_repository.dart';
export 'domain/usecases/get_referrals.dart';
export 'presentation/pages/friends_page.dart';
export 'presentation/view_models/referral_view.dart' hide ReferralStatus;
