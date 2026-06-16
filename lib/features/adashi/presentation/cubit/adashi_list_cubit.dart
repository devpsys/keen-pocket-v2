import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_state.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_samples.dart';

/// Drives the Adashi list.
///
/// PRESENTATION-ONLY: reads placeholder samples. When the domain layer lands,
/// inject a `GetMyAdashis` use case and fold its `Result` here instead.
@injectable
class AdashiListCubit extends Cubit<AdashiListState> {
  AdashiListCubit() : super(const AdashiListState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    final circles = AdashiSamples.list();
    emit(
      state.copyWith(
        status: circles.isEmpty ? StateStatus.empty : StateStatus.success,
        circles: circles,
      ),
    );
  }
}
