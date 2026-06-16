import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/dio_error_mapper.dart';
import 'package:keenpockets/features/auth/data/dtos/login_request_dto.dart';
import 'package:keenpockets/features/auth/data/dtos/login_response_dto.dart';

/// Remote authentication API. The ONLY auth code allowed to touch the network.
abstract interface class AuthRemoteDataSource {
  Future<LoginResponseDto> login(LoginRequestDto request);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<LoginResponseDto> login(LoginRequestDto request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: request.toJson(),
      );
      return LoginResponseDto.fromJson(response.data!);
    } on DioException catch (e) {
      // Normalize transport errors into the app's exception hierarchy.
      throw DioErrorMapper.map(e);
    }
  }
}
