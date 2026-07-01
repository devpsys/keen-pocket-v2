/// Public surface of the `profile` feature. Other features import only this
/// barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/profile.dart';
export 'domain/repositories/profile_repository.dart';
export 'domain/usecases/get_profile.dart';
export 'presentation/pages/profile_page.dart';
export 'presentation/view_models/profile_view.dart';
