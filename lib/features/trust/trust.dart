/// Public surface of the `trust` feature. Other features import only this
/// barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/trust_profile.dart';
export 'domain/repositories/trust_repository.dart';
export 'domain/usecases/get_trust_profile.dart';
export 'presentation/pages/kyc_verification_page.dart';
export 'presentation/pages/trust_page.dart';
export 'presentation/pages/vouches_inbox_page.dart';
export 'presentation/view_models/trust_view.dart';
export 'presentation/widgets/kyc_widgets.dart';
export 'presentation/widgets/rate_organiser_sheet.dart';
export 'presentation/widgets/reputation_block.dart';
export 'presentation/widgets/reputation_chip.dart';
