/// Public surface of the `notifications` feature. Other features import only
/// this barrel (domain + pages) — never `data/` or `presentation/` internals.
library;

export 'domain/entities/app_notification.dart';
export 'domain/repositories/notifications_repository.dart';
export 'domain/usecases/get_notifications.dart';
export 'domain/usecases/mark_all_read.dart';
export 'presentation/pages/notifications_page.dart';
export 'presentation/view_models/notification_view.dart' hide NotificationKind;
