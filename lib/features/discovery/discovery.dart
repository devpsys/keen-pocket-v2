/// Public surface of the `discovery` feature. Other features import only this
/// barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/discover_item.dart';
export 'domain/repositories/discovery_repository.dart';
export 'domain/usecases/discover_groups.dart';
export 'presentation/pages/discovery_page.dart';
export 'presentation/view_models/discover_item_view.dart'
    hide DiscoverItemType, DiscoverBadge;
