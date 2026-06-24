import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/group_collaboration/presentation/cubit/disputes_hub_state.dart';
import 'package:keenpockets/features/group_collaboration/presentation/disputes_fixtures.dart';

/// PRESENTATION-ONLY: sample-backed disputes hub (designs `disputes_hub` /
/// `disputes_hub_tablet`). Swap for a real use case when the API exists.
@injectable
class DisputesHubCubit extends Cubit<DisputesHubState> {
  DisputesHubCubit() : super(const DisputesHubState());

  Future<void> load(String groupId) async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        disputes: kDisputes,
        selectedId: kDisputes.isNotEmpty ? kDisputes.first.id : null,
        resolvedThisMonth: kDisputesResolvedThisMonth,
        avgResolution: kDisputesAvgResolution,
      ),
    );
  }

  /// Tablet master-detail: select the case shown in the detail pane.
  void select(String id) => emit(state.copyWith(selectedId: id));

  /// Reveal the admin resolution actions on each open case (phone).
  void toggleAdminView() => emit(state.copyWith(adminView: !state.adminView));
}
