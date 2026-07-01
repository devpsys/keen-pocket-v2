import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/plans/data/dtos/plan_dto.dart';

/// Remote plans API. The only plans code that touches HTTP.
abstract interface class PlansRemoteDataSource {
  Future<List<PlanDto>> getPlans();
}

@LazySingleton(as: PlansRemoteDataSource, env: ['prod', 'staging'])
class PlansRemoteDataSourceImpl implements PlansRemoteDataSource {
  const PlansRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<PlanDto>> getPlans() async {
    try {
      final response = await _dio.get<List<dynamic>>('/plans');
      return (response.data ?? <dynamic>[])
          .map((e) => PlanDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
