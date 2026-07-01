/// Public surface of the `charity` feature. Other features import only this
/// barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/charity_drive.dart';
export 'domain/repositories/charity_repository.dart';
export 'domain/usecases/get_charity_drive.dart';
export 'presentation/pages/charity_page.dart';
export 'presentation/pages/charity_setup_page.dart';
export 'presentation/view_models/charity_view.dart';
export 'presentation/widgets/charity_donate_card.dart';
