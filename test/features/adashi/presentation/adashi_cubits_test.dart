import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_state.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_state.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';

void main() {
  group('AdashiListCubit', () {
    blocTest<AdashiListCubit, AdashiListState>(
      'emits [loading, success] with circles',
      build: AdashiListCubit.new,
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<AdashiListState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<AdashiListState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.circles, 'circles', isNotEmpty),
      ],
    );
  });

  group('AdashiDetailCubit', () {
    blocTest<AdashiDetailCubit, AdashiDetailState>(
      'emits [loading, success] for a known id with a derived rotation',
      build: AdashiDetailCubit.new,
      act: (cubit) => cubit.load('a1'),
      expect: () => [
        isA<AdashiDetailState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<AdashiDetailState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.adashi?.rotation, 'rotation', isNotEmpty)
            .having(
              (s) => s.adashi?.currentReceiver?.status,
              'current receiver',
              RotationStatus.current,
            ),
      ],
    );

    blocTest<AdashiDetailCubit, AdashiDetailState>(
      'emits [loading, empty] for an unknown id',
      build: AdashiDetailCubit.new,
      act: (cubit) => cubit.load('does-not-exist'),
      expect: () => [
        isA<AdashiDetailState>().having(
          (s) => s.status,
          'status',
          StateStatus.loading,
        ),
        isA<AdashiDetailState>().having(
          (s) => s.status,
          'status',
          StateStatus.empty,
        ),
      ],
    );
  });
}
