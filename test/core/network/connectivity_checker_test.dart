import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:mocktail/mocktail.dart';

class _MockConnectivity extends Mock implements Connectivity {}

void main() {
  late _MockConnectivity connectivity;
  late ConnectivityCheckerImpl subject;

  setUp(() {
    connectivity = _MockConnectivity();
    subject = ConnectivityCheckerImpl(connectivity);
  });

  test('online when any result is not none', () async {
    when(
      () => connectivity.checkConnectivity(),
    ).thenAnswer((_) async => [ConnectivityResult.wifi]);
    expect(await subject.isConnected, isTrue);
  });

  test('offline when only none', () async {
    when(
      () => connectivity.checkConnectivity(),
    ).thenAnswer((_) async => [ConnectivityResult.none]);
    expect(await subject.isConnected, isFalse);
  });
}
