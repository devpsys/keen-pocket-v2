import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/pockets/data/dtos/pocket_dto.dart';

/// Remote pockets API. The only pockets code allowed to touch the network.
abstract interface class PocketRemoteDataSource {
  Future<List<PocketDto>> getMyPockets();
  Future<PocketDto> getPocket(String id);
}

@LazySingleton(as: PocketRemoteDataSource)
class PocketRemoteDataSourceImpl implements PocketRemoteDataSource {
  const PocketRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<PocketDto>> getMyPockets() async {
    try {
      final response = await _dio.get<List<dynamic>>('my-pockets');
      return (response.data ?? <dynamic>[])
          .map((e) => PocketDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<PocketDto> getPocket(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('pocket/$id');
      return PocketDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
