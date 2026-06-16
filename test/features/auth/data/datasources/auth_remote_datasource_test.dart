import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/error/exceptions.dart';
import 'package:keenpockets/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:keenpockets/features/auth/data/dtos/login_request_dto.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

void main() {
  late _MockDio dio;
  late AuthRemoteDataSourceImpl subject;

  final options = RequestOptions(path: '/auth/login');
  const request = LoginRequestDto(email: 'a@b.com', password: 'password123');

  setUp(() {
    dio = _MockDio();
    subject = AuthRemoteDataSourceImpl(dio);
  });

  test('posts credentials and parses the response', () async {
    when(
      () => dio.post<Map<String, dynamic>>(any(), data: any(named: 'data')),
    ).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        requestOptions: options,
        statusCode: 200,
        data: {
          'access_token': 'at',
          'refresh_token': 'rt',
          'user': {'id': '1', 'email': 'a@b.com', 'full_name': 'Ada'},
        },
      ),
    );

    final result = await subject.login(request);

    expect(result.accessToken, 'at');
    expect(result.user.name, 'Ada');
    verify(
      () =>
          dio.post<Map<String, dynamic>>('/auth/login', data: request.toJson()),
    ).called(1);
  });

  test('translates DioException into an AppException', () async {
    when(
      () => dio.post<Map<String, dynamic>>(any(), data: any(named: 'data')),
    ).thenThrow(
      DioException(
        requestOptions: options,
        type: DioExceptionType.connectionError,
      ),
    );

    expect(() => subject.login(request), throwsA(isA<NetworkException>()));
  });
}
