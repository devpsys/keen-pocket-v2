import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/contributions/data/dtos/invoice_dto.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';

/// Remote contribution-ledger API. The only contributions code touching HTTP.
abstract interface class ContributionRemoteDataSource {
  Future<List<InvoiceDto>> getInvoices(ContributionContext context);
  Future<InvoiceDto> submitContribution({
    required ContributionContext context,
    required int amountKobo,
  });
  Future<InvoiceDto> verifyInvoice(String invoiceId);
}

@LazySingleton(as: ContributionRemoteDataSource)
class ContributionRemoteDataSourceImpl implements ContributionRemoteDataSource {
  const ContributionRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<InvoiceDto>> getInvoices(ContributionContext context) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        'invoices',
        queryParameters: {
          'host': context.host.name,
          'host_id': context.hostId,
          if (context.reference != null) 'reference': context.reference,
        },
      );
      return (response.data ?? <dynamic>[])
          .map((e) => InvoiceDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<InvoiceDto> submitContribution({
    required ContributionContext context,
    required int amountKobo,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'invoice/create',
        data: {
          'host': context.host.name,
          'host_id': context.hostId,
          'reference': context.reference,
          'amount': amountKobo,
        },
      );
      return InvoiceDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<InvoiceDto> verifyInvoice(String invoiceId) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'payment/status/update',
        data: {'invoice_id': invoiceId, 'status': 'verified'},
      );
      return InvoiceDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
