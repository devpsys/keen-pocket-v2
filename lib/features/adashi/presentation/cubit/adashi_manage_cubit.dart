import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/adashi/presentation/cubit/adashi_manage_state.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_samples.dart';

/// Drives the organiser "manage circle" screen (members, payments, overrides).
///
/// PRESENTATION-ONLY: reads placeholder samples; swap for a use case when the
/// domain layer lands.
@injectable
class AdashiManageCubit extends Cubit<AdashiManageState> {
  AdashiManageCubit() : super(const AdashiManageState());

  Future<void> load(String id) async {
    emit(state.copyWith(status: StateStatus.loading));
    final manage = AdashiSamples.manage(id);
    emit(
      state.copyWith(
        status: manage == null ? StateStatus.empty : StateStatus.success,
        manage: manage,
      ),
    );
  }
}
