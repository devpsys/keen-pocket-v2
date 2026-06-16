/// Public surface of the `pockets` feature. Other features import only this
/// barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/pocket.dart';
export 'domain/repositories/pocket_repository.dart';
export 'domain/usecases/get_my_pockets.dart';
export 'domain/usecases/get_pocket_detail.dart';
export 'domain/value_objects/hands.dart';
export 'presentation/pages/pocket_detail_page.dart';
export 'presentation/pages/pockets_page.dart';
