import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/profile/data/dtos/profile_dto.dart';

/// Remote profile API. The only profile code that touches HTTP.
abstract interface class ProfileRemoteDataSource {
  Future<ProfileDto> getProfile();
}

@LazySingleton(as: ProfileRemoteDataSource, env: ['prod', 'staging'])
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<ProfileDto> getProfile() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/me');
      return ProfileDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
