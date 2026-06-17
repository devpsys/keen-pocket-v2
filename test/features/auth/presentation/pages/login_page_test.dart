import 'package:bloc_test/bloc_test.dart';
import 'package:core/error/failures.dart';
import 'package:core/presentation/state_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';
import 'package:keenpockets/features/auth/presentation/pages/login_page.dart';

import '../../../../helpers/pump_app.dart';

class _MockAuthBloc extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}

void main() {
  late _MockAuthBloc bloc;

  setUp(() => bloc = _MockAuthBloc());

  // LoginPage reads the app-wide AuthBloc provided above the router.
  Widget subject() =>
      BlocProvider<AuthBloc>.value(value: bloc, child: const LoginPage());

  testWidgets('renders the welcome header and the login form', (tester) async {
    whenListen(
      bloc,
      const Stream<AuthState>.empty(),
      initialState: const AuthState(),
    );

    await tester.pumpApp(subject());

    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('renders the two-column hero + form on a wide tablet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    whenListen(
      bloc,
      const Stream<AuthState>.empty(),
      initialState: const AuthState(),
    );

    await tester.pumpApp(subject());

    // Hero copy + the form's two fields are both present in the wide layout.
    expect(find.text('Welcome back!'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('shows a snackbar on a non-field failure', (tester) async {
    whenListen(
      bloc,
      Stream.fromIterable(const [
        AuthState(status: StateStatus.failure, failure: ServerFailure()),
      ]),
      initialState: const AuthState(),
    );

    await tester.pumpApp(subject());
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
  });
}
