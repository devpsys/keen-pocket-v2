import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/storage/token_storage.dart';
import 'package:mocktail/mocktail.dart';

class _MockSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late _MockSecureStorage storage;
  late SecureTokenStorage subject;

  setUp(() {
    storage = _MockSecureStorage();
    subject = SecureTokenStorage(storage);
  });

  test('reads access and refresh tokens', () async {
    when(
      () => storage.read(key: any(named: 'key')),
    ).thenAnswer((_) async => 'token');
    expect(await subject.readAccessToken(), 'token');
    expect(await subject.readRefreshToken(), 'token');
  });

  test('saves tokens (refresh optional)', () async {
    when(
      () => storage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});
    await subject.saveTokens(accessToken: 'at', refreshToken: 'rt');
    verify(
      () => storage.write(
        key: any(named: 'key'),
        value: 'at',
      ),
    ).called(1);
    verify(
      () => storage.write(
        key: any(named: 'key'),
        value: 'rt',
      ),
    ).called(1);
  });

  test('clear deletes both keys', () async {
    when(() => storage.delete(key: any(named: 'key'))).thenAnswer((_) async {});
    await subject.clear();
    verify(() => storage.delete(key: any(named: 'key'))).called(2);
  });
}
