import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/error/exceptions.dart';
import 'package:keenpockets/core/storage/token_storage.dart';
import 'package:keenpockets/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:keenpockets/features/auth/data/models/auth_user_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  late _MockTokenStorage tokens;
  late SharedPreferences prefs;
  late AuthLocalDataSourceImpl subject;

  const user = AuthUserModel(id: '1', email: 'a@b.com', name: 'Ada');

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    tokens = _MockTokenStorage();
    subject = AuthLocalDataSourceImpl(tokens, prefs);
  });

  test(
    'cacheSession stores tokens and user, getCachedUser reads it back',
    () async {
      when(
        () => tokens.saveTokens(
          accessToken: any(named: 'accessToken'),
          refreshToken: any(named: 'refreshToken'),
        ),
      ).thenAnswer((_) async {});

      await subject.cacheSession(
        accessToken: 'at',
        refreshToken: 'rt',
        user: user,
      );

      verify(
        () => tokens.saveTokens(accessToken: 'at', refreshToken: 'rt'),
      ).called(1);
      final cached = await subject.getCachedUser();
      expect(cached, user);
    },
  );

  test('getCachedUser returns null when nothing cached', () async {
    expect(await subject.getCachedUser(), isNull);
  });

  test('cacheSession wraps storage errors in CacheException', () async {
    when(
      () => tokens.saveTokens(
        accessToken: any(named: 'accessToken'),
        refreshToken: any(named: 'refreshToken'),
      ),
    ).thenThrow(Exception('boom'));

    expect(
      () => subject.cacheSession(accessToken: 'at', user: user),
      throwsA(isA<CacheException>()),
    );
  });

  test('clear removes tokens and cached user', () async {
    when(() => tokens.clear()).thenAnswer((_) async {});
    await prefs.setString('kp.cached_user', '{}');
    await subject.clear();
    verify(() => tokens.clear()).called(1);
    expect(prefs.getString('kp.cached_user'), isNull);
  });
}
