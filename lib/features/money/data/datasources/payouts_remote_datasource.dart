import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/data/dtos/payouts_dto.dart';

/// Remote payouts/bank API. The only payouts code that touches HTTP.
abstract interface class PayoutsRemoteDataSource {
  Future<PayoutsHubDto> getPayoutsHub();
}

@LazySingleton(as: PayoutsRemoteDataSource, env: ['prod', 'staging'])
class PayoutsRemoteDataSourceImpl implements PayoutsRemoteDataSource {
  const PayoutsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<PayoutsHubDto> getPayoutsHub() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/payouts');
      return PayoutsHubDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
