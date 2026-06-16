import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_state.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_samples.dart';

/// Drives a single Adashi's detail (rotation timeline).
///
/// PRESENTATION-ONLY: reads placeholder samples; swap for a `GetAdashiDetail`
/// use case when the domain layer lands.
@injectable
class AdashiDetailCubit extends Cubit<AdashiDetailState> {
  AdashiDetailCubit() : super(const AdashiDetailState());

  Future<void> load(String id) async {
    emit(state.copyWith(status: StateStatus.loading));
    final adashi = AdashiSamples.detail(id);
    emit(
      state.copyWith(
        status: adashi == null ? StateStatus.empty : StateStatus.success,
        adashi: adashi,
      ),
    );
  }
}
