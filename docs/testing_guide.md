# Testing Guide

Every feature ships with tests. Minimum **80%** line coverage (enforced in CI by
`scripts/check_coverage.sh`). The metric covers the *testable* surface — these
are excluded from the denominator (separator-agnostic, works on Windows + CI):
generated code (`*.g.dart`, `*.freezed.dart`, `*.config.dart`, `**/generated/`),
DI wiring (`core/di/`, `core/network/network_module.dart`) and the app
composition root (`app/`, `main.dart`). Everything else — core logic, features,
design system, shared widgets — counts.

## Test types & where they live
```
test/
├── helpers/pump_app.dart                  # widget-test harness (theme + l10n)
├── core/...                               # core unit/widget tests
└── features/<feature>/
    ├── domain/usecases/*_test.dart        # unit (mock repository)
    ├── data/repositories/*_test.dart      # repository (mock data sources)
    └── presentation/
        ├── bloc/*_test.dart               # bloc_test
        └── widgets/*_test.dart            # widget (MockBloc)
```

Tooling: `flutter_test`, `bloc_test`, `mocktail`.

## Unit test (use case)
```dart
class _MockAuthRepository extends Mock implements AuthRepository {}

test('returns ValidationFailure when email empty', () async {
  final useCase = LoginUseCase(_MockAuthRepository());
  final r = await useCase(const LoginParams(email: '', password: 'password123'));
  expect(r.failureOrNull, isA<ValidationFailure>());
});
```

## Repository test (exception → failure mapping)
```dart
when(() => remote.login(any())).thenThrow(const ServerException('x', statusCode: 500));
final r = await repository.login(email: 'a@b.com', password: 'password123');
expect((r.failureOrNull! as ServerFailure).statusCode, 500);
```
Register fallbacks for custom types: `registerFallbackValue(const LoginRequestModel(...))`.

## Bloc test
```dart
blocTest<AuthBloc, AuthState>(
  'emits [loading, success] on valid login',
  setUp: () => when(() => login(any())).thenAnswer((_) async => const Result.success(user)),
  build: () => AuthBloc(login, logout),
  act: (b) => b.add(const AuthEvent.loginRequested(email: 'a@b.com', password: 'password123')),
  expect: () => [
    isA<AuthState>().having((s) => s.status, 'status', StateStatus.loading),
    isA<AuthState>().having((s) => s.status, 'status', StateStatus.success),
  ],
);
```

## Widget test
```dart
class _MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

testWidgets('dispatches LoginRequested', (tester) async {
  whenListen(bloc, const Stream<AuthState>.empty(), initialState: const AuthState());
  await tester.pumpApp(BlocProvider<AuthBloc>.value(value: bloc, child: const Scaffold(body: LoginForm())));
  await tester.enterText(find.byType(TextField).at(0), 'a@b.com');
  await tester.tap(find.text('Log in'));
  verify(() => bloc.add(const AuthEvent.loginRequested(email: 'a@b.com', password: ''))).called(1);
});
```

## Commands
```bash
flutter test                 # all tests
flutter test --coverage      # with coverage → coverage/lcov.info
bash scripts/check_coverage.sh 80
```

## Guidelines
- Mock at the boundary you own (use case → mock repo; repo → mock data sources;
  bloc → mock use cases; widget → MockBloc). Never hit the real network.
- Assert on `Result`/`Failure` types, not on string messages.
- One behavior per test; name tests as observable outcomes.
