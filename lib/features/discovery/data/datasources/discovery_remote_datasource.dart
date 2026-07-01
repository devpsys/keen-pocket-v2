import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/discovery/data/dtos/discover_item_dto.dart';

/// Remote discovery API. The only discovery code that touches HTTP.
abstract interface class DiscoveryRemoteDataSource {
  Future<List<DiscoverItemDto>> discover(String query);
}

@LazySingleton(as: DiscoveryRemoteDataSource, env: ['prod', 'staging'])
class DiscoveryRemoteDataSourceImpl implements DiscoveryRemoteDataSource {
  const DiscoveryRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<DiscoverItemDto>> discover(String query) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/discover',
        queryParameters: {if (query.isNotEmpty) 'q': query},
      );
      return (response.data ?? <dynamic>[])
          .map((e) => DiscoverItemDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
