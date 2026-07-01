import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/trust/data/dtos/trust_profile_dto.dart';

/// Remote trust/reputation API. The only trust code that touches HTTP.
abstract interface class TrustRemoteDataSource {
  Future<TrustProfileDto> getMyTrust();
}

@LazySingleton(as: TrustRemoteDataSource, env: ['prod', 'staging'])
class TrustRemoteDataSourceImpl implements TrustRemoteDataSource {
  const TrustRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<TrustProfileDto> getMyTrust() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/me/trust');
      return TrustProfileDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
