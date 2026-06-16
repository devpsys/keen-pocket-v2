import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:keenpockets/core/sync/outbox_entry.dart';
import 'package:keenpockets/core/sync/outbox_handler.dart';
import 'package:keenpockets/features/contributions/data/datasources/contribution_remote_datasource.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';

/// Outbox type for a queued contribution submission.
const String kContributionSubmitType = 'contribution.submit';

/// Replays queued `contribution.submit` mutations against the backend.
@injectable
class ContributionOutboxHandler implements OutboxHandler {
  const ContributionOutboxHandler(this._remote);

  final ContributionRemoteDataSource _remote;

  @override
  String get type => kContributionSubmitType;

  @override
  Future<bool> process(OutboxEntry entry) async {
    final p = entry.payload;
    final host = p['host'] == ContributionHost.adashi.name
        ? ContributionHost.adashi
        : ContributionHost.pocket;
    final context = ContributionContext(
      host: host,
      hostId: p['hostId'] as String,
      reference: p['reference'] as String?,
    );
    try {
      await _remote.submitContribution(
        context: context,
        amountKobo: p['amountKobo'] as int,
      );
      return true;
    } on AppException {
      return false; // keep queued; SyncService will retry
    }
  }
}
