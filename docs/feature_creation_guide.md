# Feature Creation Guide

Use the `auth` feature as the reference implementation. Every new
feature follows the same vertical slice.

## 1. Scaffold the folders

```
features/<feature>/
├── data/
│   ├── datasources/   <feature>_remote_datasource.dart, <feature>_local_datasource.dart
│   ├── dtos/          *_dto.dart  (freezed + json_serializable)
│   ├── mappers/       *_mapper.dart (model ⇄ entity)
│   └── repositories/  <feature>_repository_impl.dart
├── domain/
│   ├── entities/      *.dart        (freezed, pure Dart)
│   ├── repositories/  <feature>_repository.dart  (abstract interface)
│   └── usecases/      *_usecase.dart
└── presentation/
    ├── bloc/          <feature>_bloc.dart, <feature>_event.dart, <feature>_state.dart (freezed)
    ├── pages/         *_page.dart
    └── widgets/       *.dart
```

## 2. Domain first (pure Dart)

```dart
// domain/entities/account.dart
@freezed
abstract class Account with _$Account {
  const factory Account({required String id, required String name}) = _Account;
}

// domain/repositories/account_repository.dart
abstract interface class AccountRepository {
  Future<Result<Account>> fetch(String id);
}

// domain/usecases/get_account_usecase.dart
@injectable
class GetAccountUseCase implements UseCase<Account, String> {
  const GetAccountUseCase(this._repo);
  final AccountRepository _repo;
  @override
  Future<Result<Account>> call(String id) => _repo.fetch(id);
}
```

> ❌ Do **not** import `package:flutter/*` in `domain/`.

## 3. Data layer

```dart
// data/dtos/account_dto.dart
@freezed
abstract class AccountDto with _$AccountDto {
  const factory AccountDto({required String id, required String name}) = _AccountDto;
  factory AccountDto.fromJson(Map<String, dynamic> j) => _$AccountDtoFromJson(j);
}

// data/datasources/account_remote_datasource.dart
@LazySingleton(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  const AccountRemoteDataSourceImpl(this._dio);     // injected Dio
  final Dio _dio;
  @override
  Future<AccountDto> fetch(String id) async {
    try {
      final r = await _dio.get<Map<String, dynamic>>('/accounts/$id');
      return AccountDto.fromJson(r.data!);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);                   // → AppException
    }
  }
}

// data/repositories/account_repository_impl.dart
// Result<T> is an alias for fpdart's Either<Failure, T> (Right = success).
@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  const AccountRepositoryImpl(this._remote);
  final AccountRemoteDataSource _remote;
  @override
  Future<Result<Account>> fetch(String id) async {
    try {
      final dto = await _remote.fetch(id);
      return Right(dto.toEntity());
    } on AppException catch (e) {
      return Left(/* map e → Failure */);
    }
  }
}
```

## 4. Presentation (see the State Management Guide)

```dart
@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> { ... }
```

## 5. Wire it up

1. `dart run build_runner build --delete-conflicting-outputs` (freezed/json/DI).
2. Add a route in `lib/app/router/app_router.dart`.
3. Add user-facing strings to `lib/core/localization/arb/app_en.arb`.
4. Write tests (unit → repo → bloc → widget). Coverage ≥ 80%.
5. `bash scripts/verify.sh`.

## Checklist
- [ ] Domain is Flutter-free.
- [ ] Repository returns `Result`, maps every `AppException`.
- [ ] UI depends on Bloc only.
- [ ] All strings/colors/spacing come from l10n / design system.
- [ ] Tests added.
