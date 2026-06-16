# State Management Guide

We use **Bloc/Cubit exclusively**. `setState` for business logic, Provider,
Riverpod, GetX and MobX are forbidden.

## Anatomy of a screen's state

Every feature state is an immutable Freezed class exposing the canonical
[`StateStatus`](../lib/core/presentation/state_status.dart):
`initial / loading / success / empty / failure`.

```dart
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(StateStatus.initial) StateStatus status,
    AuthUser? user,
    Failure? failure,
    @Default(<String, String>{}) Map<String, String> fieldErrors,
  }) = _AuthState;
  const AuthState._();
}
```

## Bloc vs Cubit
- **Bloc** (events) for screens with multiple discrete user intents (forms,
  flows). Events are a Freezed `sealed` union.
- **Cubit** (methods) for simple state that is set directly.

## Pattern: handle a Result in the Bloc

```dart
Future<void> _onLoginRequested(LoginRequested e, Emitter<AuthState> emit) async {
  emit(state.copyWith(status: StateStatus.loading, failure: null));
  final result = await _loginUseCase(LoginParams(email: e.email, password: e.password));
  // fpdart Either.fold is positional: (onLeft = failure, onRight = success).
  emit(result.fold(
    (f) => state.copyWith(status: StateStatus.failure, failure: f),
    (u) => state.copyWith(status: StateStatus.success, user: u),
  ));
}
```

## Rendering all four states

```dart
BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) => switch (state.status) {
    StateStatus.loading => const KpLoadingView(),
    StateStatus.empty   => KpEmptyView(title: context.l10n.emptyTitle, message: context.l10n.emptyMessage),
    StateStatus.failure => KpErrorView(
        message: state.failure!.localizedMessage(context),
        onRetry: () => context.read<AuthBloc>().add(const AuthEvent.sessionChecked()),
      ),
    _ => YourSuccessView(state),
  },
);
```

## ✅ Correct
```dart
context.read<AuthBloc>().add(AuthEvent.loginRequested(email: e, password: p));
```

## ❌ Incorrect
```dart
// Business logic in setState
setState(() => isLoggedIn = api.login(e, p));   // forbidden

// Calling a repository/use case directly from a widget
final repo = getIt<AuthRepository>();            // forbidden (no_repository_in_ui)
```

## Rules
- Blocs depend on **use cases**, never repositories or data sources.
- Blocs/use cases never read from `getIt` — everything is constructor-injected.
- States are immutable (Freezed); emit a new state, never mutate.
- Provide a Bloc with `BlocProvider(create: (_) => getIt<XBloc>())` at the page root.
