import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/data/dtos/wallet_dto.dart';

/// Remote wallet API. The only wallet code that touches HTTP.
abstract interface class WalletRemoteDataSource {
  Future<WalletDto> getWallet();
}

@LazySingleton(as: WalletRemoteDataSource, env: ['prod', 'staging'])
class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  const WalletRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<WalletDto> getWallet() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/wallet');
      return WalletDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
