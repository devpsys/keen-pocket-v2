import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/pockets/domain/usecases/get_my_pockets.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_state.dart';

/// Drives the pockets list. Simple, derived UI → Cubit (not Bloc).
@injectable
class PocketsCubit extends Cubit<PocketsState> {
  PocketsCubit(this._getMyPockets) : super(const PocketsState());

  final GetMyPockets _getMyPockets;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getMyPockets(const NoParams());
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (pockets) => state.copyWith(
          status: pockets.isEmpty ? StateStatus.empty : StateStatus.success,
          pockets: pockets,
          failure: null,
        ),
      ),
    );
  }
}
