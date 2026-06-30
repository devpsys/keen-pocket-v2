import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/permissions/access_policy.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/administration/presentation/admin_fixtures.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_state.dart';

/// Admin console. Authorization is a domain/permission concern: non-super-admins
/// get the `permissionDenied` state (no privileged data is ever loaded for them).
/// Figures are PRESENTATION-ONLY placeholders.
@injectable
class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this._session) : super(const AdminState());

  final SessionManager _session;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    final policy = AccessPolicy(_session.currentUser);
    if (!policy.isSuperAdmin) {
      emit(state.copyWith(status: StateStatus.permissionDenied));
      return;
    }
    emit(state.copyWith(status: StateStatus.success, data: kAdmin));
  }
}
