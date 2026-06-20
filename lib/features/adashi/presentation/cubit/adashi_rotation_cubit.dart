import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/adashi/presentation/cubit/adashi_rotation_state.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_samples.dart';

/// Drives a single Adashi's rotation screen (pot, cycles, members).
///
/// PRESENTATION-ONLY: reads placeholder samples; swap for a use case when the
/// domain layer lands.
@injectable
class AdashiRotationCubit extends Cubit<AdashiRotationState> {
  AdashiRotationCubit() : super(const AdashiRotationState());

  Future<void> load(String id) async {
    emit(state.copyWith(status: StateStatus.loading));
    final rotation = AdashiSamples.rotation(id);
    emit(
      state.copyWith(
        status: rotation == null ? StateStatus.empty : StateStatus.success,
        rotation: rotation,
      ),
    );
  }
}
