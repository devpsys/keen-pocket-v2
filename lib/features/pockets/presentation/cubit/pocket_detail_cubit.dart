import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/domain/usecases/get_pocket_detail.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_state.dart';

/// Loads a pocket and derives the current user's [PocketRole] from the session.
@injectable
class PocketDetailCubit extends Cubit<PocketDetailState> {
  PocketDetailCubit(this._getPocketDetail, this._session)
    : super(const PocketDetailState());

  final GetPocketDetail _getPocketDetail;
  final SessionManager _session;

  Future<void> load(String id) async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getPocketDetail(id);
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (pocket) {
          final userId = _session.currentUser?.id ?? '';
          return state.copyWith(
            status: StateStatus.success,
            pocket: pocket,
            role: pocket.roleOf(userId),
            failure: null,
          );
        },
      ),
    );
  }
}
