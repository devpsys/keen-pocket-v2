import 'package:bloc_test/bloc_test.dart';
import 'package:core/presentation/state_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';
import 'package:keenpockets/features/auth/presentation/widgets/login_form.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_app.dart';

class _MockAuthBloc extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}

void main() {
  late _MockAuthBloc bloc;

  setUp(() => bloc = _MockAuthBloc());

  Widget subject() => BlocProvider<AuthBloc>.value(
    value: bloc,
    child: const Scaffold(body: LoginForm()),
  );

  testWidgets('renders email and password fields', (tester) async {
    whenListen(
      bloc,
      const Stream<AuthState>.empty(),
      initialState: const AuthState(),
    );

    await tester.pumpApp(subject());

    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('dispatches LoginRequested with entered credentials', (
    tester,
  ) async {
    whenListen(
      bloc,
      const Stream<AuthState>.empty(),
      initialState: const AuthState(),
    );

    await tester.pumpApp(subject());

    await tester.enterText(find.byType(TextField).at(0), 'ada@keenpockets.dev');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
    await tester.tap(find.text('Log in'));
    await tester.pump();

    verify(
      () => bloc.add(
        const AuthEvent.loginRequested(
          email: 'ada@keenpockets.dev',
          password: 'password123',
        ),
      ),
    ).called(1);
  });

  testWidgets('shows a spinner while loading', (tester) async {
    whenListen(
      bloc,
      const Stream<AuthState>.empty(),
      initialState: const AuthState(status: StateStatus.loading),
    );

    await tester.pumpApp(subject());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
