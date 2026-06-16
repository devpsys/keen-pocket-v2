import 'package:bloc_test/bloc_test.dart';
import 'package:core/error/failures.dart';
import 'package:core/presentation/state_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';
import 'package:keenpockets/features/auth/presentation/pages/login_page.dart';

import '../../../../helpers/pump_app.dart';

class _MockAuthBloc extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}

void main() {
  late _MockAuthBloc bloc;

  const user = AuthUser(id: '1', email: 'ada@keenpockets.dev', name: 'Ada');

  setUp(() {
    bloc = _MockAuthBloc();
    // LoginPage resolves its bloc from the service locator.
    if (getIt.isRegistered<AuthBloc>()) getIt.unregister<AuthBloc>();
    getIt.registerFactory<AuthBloc>(() => bloc);
  });

  tearDown(() => getIt.reset());

  testWidgets('renders the welcome header and the login form', (tester) async {
    whenListen(
      bloc,
      const Stream<AuthState>.empty(),
      initialState: const AuthState(),
    );

    await tester.pumpApp(const LoginPage());

    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('calls onAuthenticated when state becomes success', (
    tester,
  ) async {
    var authenticated = false;
    whenListen(
      bloc,
      Stream.fromIterable(const [
        AuthState(status: StateStatus.success, user: user),
      ]),
      initialState: const AuthState(),
    );

    await tester.pumpApp(
      LoginPage(onAuthenticated: () => authenticated = true),
    );
    await tester.pump();

    expect(authenticated, isTrue);
  });

  testWidgets('shows a snackbar on a non-field failure', (tester) async {
    whenListen(
      bloc,
      Stream.fromIterable(const [
        AuthState(status: StateStatus.failure, failure: ServerFailure()),
      ]),
      initialState: const AuthState(),
    );

    await tester.pumpApp(const LoginPage());
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
  });
}
