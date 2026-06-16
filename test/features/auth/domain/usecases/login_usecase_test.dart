import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/error/failures.dart';
import 'package:keenpockets/core/result/result.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';
import 'package:keenpockets/features/auth/domain/repositories/auth_repository.dart';
import 'package:keenpockets/features/auth/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository repository;
  late LoginUseCase useCase;

  const user = AuthUser(id: '1', email: 'ada@keenpockets.dev', name: 'Ada');

  setUp(() {
    repository = _MockAuthRepository();
    useCase = LoginUseCase(repository);
  });

  group('LoginUseCase validation', () {
    test('fails with ValidationFailure when email is empty', () async {
      final result = await useCase(
        const LoginParams(email: '', password: 'password123'),
      );

      final failure = result.failureOrNull;
      expect(failure, isA<ValidationFailure>());
      expect((failure! as ValidationFailure).fieldErrors['email'], 'required');
      verifyNever(
        () => repository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      );
    });

    test('fails with ValidationFailure when email is malformed', () async {
      final result = await useCase(
        const LoginParams(email: 'not-an-email', password: 'password123'),
      );
      expect(
        (result.failureOrNull! as ValidationFailure).fieldErrors['email'],
        'invalid',
      );
    });

    test('fails with ValidationFailure when password too short', () async {
      final result = await useCase(
        const LoginParams(email: 'ada@keenpockets.dev', password: 'short'),
      );
      expect(
        (result.failureOrNull! as ValidationFailure).fieldErrors['password'],
        'too_short',
      );
    });
  });

  group('LoginUseCase delegation', () {
    test('delegates to repository and returns user on valid input', () async {
      when(
        () => repository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => const Result.success(user));

      final result = await useCase(
        const LoginParams(
          email: ' ada@keenpockets.dev ',
          password: 'password123',
        ),
      );

      expect(result.valueOrNull, user);
      // Email is trimmed before reaching the repository.
      verify(
        () => repository.login(
          email: 'ada@keenpockets.dev',
          password: 'password123',
        ),
      ).called(1);
    });

    test('propagates repository failure', () async {
      when(
        () => repository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => const Result.failure(ServerFailure()));

      final result = await useCase(
        const LoginParams(
          email: 'ada@keenpockets.dev',
          password: 'password123',
        ),
      );
      expect(result.failureOrNull, isA<ServerFailure>());
    });
  });
}
