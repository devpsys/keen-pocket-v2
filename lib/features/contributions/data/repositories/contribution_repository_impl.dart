import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/core/sync/outbox_store.dart';
import 'package:keenpockets/features/contributions/data/datasources/contribution_remote_datasource.dart';
import 'package:keenpockets/features/contributions/data/mappers/invoice_mapper.dart';
import 'package:keenpockets/features/contributions/data/sync/contribution_outbox_handler.dart';
import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/domain/repositories/contribution_repository.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';

/// Implements [ContributionRepository] over the remote ledger API. Maps every
/// [AppException] to a [Failure]; nothing throws across the boundary. When
/// offline, a contribution is queued to the outbox (optimistic) instead of
/// failing — the [SyncService] flushes it on reconnect.
@LazySingleton(as: ContributionRepository)
class ContributionRepositoryImpl implements ContributionRepository {
  const ContributionRepositoryImpl(
    this._remote,
    this._connectivity,
    this._outbox,
  );

  final ContributionRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;
  final OutboxStore _outbox;

  @override
  Future<Result<List<Invoice>>> getInvoices(ContributionContext context) async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dtos = await _remote.getInvoices(context);
      return Right(dtos.map((d) => d.toEntity()).toList());
    } on AppException catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Result<Invoice>> submitContribution({
    required ContributionContext context,
    required Money amount,
  }) async {
    if (!await _connectivity.isConnected) {
      // Optimistic offline path: queue and return a pending invoice.
      final idempotencyKey =
          '$kContributionSubmitType:${context.host.name}:${context.hostId}:'
          '${context.reference ?? '-'}:${amount.kobo}';
      await _outbox.enqueue(
        type: kContributionSubmitType,
        payload: {
          'host': context.host.name,
          'hostId': context.hostId,
          'reference': context.reference,
          'amountKobo': amount.kobo,
        },
        idempotencyKey: idempotencyKey,
      );
      return Right(
        Invoice(id: 'queued:$idempotencyKey', contributorId: '', total: amount),
      );
    }
    try {
      final dto = await _remote.submitContribution(
        context: context,
        amountKobo: amount.kobo,
      );
      return Right(dto.toEntity());
    } on AppException catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Result<Invoice>> verifyInvoice(String invoiceId) async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dto = await _remote.verifyInvoice(invoiceId);
      return Right(dto.toEntity());
    } on AppException catch (e) {
      return Left(_mapException(e));
    }
  }

  Failure _mapException(AppException e) => switch (e) {
    NetworkException() => NetworkFailure(message: e.message, cause: e),
    UnauthorizedException() => AuthFailure(message: e.message, cause: e),
    ValidationException() => ValidationFailure(
      message: e.message,
      fieldErrors: e.fieldErrors,
      cause: e,
    ),
    CacheException() => CacheFailure(message: e.message, cause: e),
    ServerException() => ServerFailure(
      message: e.message,
      statusCode: e.statusCode,
      cause: e,
    ),
  };
}
