import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/friends/data/dtos/referral_dto.dart';

/// Remote referrals API. The only referrals code that touches HTTP.
abstract interface class ReferralsRemoteDataSource {
  Future<ReferralDto> getReferrals();
}

@LazySingleton(as: ReferralsRemoteDataSource, env: ['prod', 'staging'])
class ReferralsRemoteDataSourceImpl implements ReferralsRemoteDataSource {
  const ReferralsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<ReferralDto> getReferrals() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/referrals');
      return ReferralDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
