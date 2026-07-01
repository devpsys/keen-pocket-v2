import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/charity/data/dtos/charity_drive_dto.dart';

/// Remote charity API. The only charity code that touches HTTP.
abstract interface class CharityRemoteDataSource {
  Future<CharityDriveDto> getDrive(String pocketId);
}

@LazySingleton(as: CharityRemoteDataSource, env: ['prod', 'staging'])
class CharityRemoteDataSourceImpl implements CharityRemoteDataSource {
  const CharityRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<CharityDriveDto> getDrive(String pocketId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/pockets/$pocketId/charity',
      );
      return CharityDriveDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
