import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/profile/presentation/view_models/profile_view.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(StateStatus.initial) StateStatus status,
    ProfileView? profile,
    Failure? failure,
  }) = _ProfileState;
}
