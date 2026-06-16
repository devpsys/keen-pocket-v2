import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/administration/presentation/view_models/admin_view.dart';

part 'admin_state.freezed.dart';

@freezed
abstract class AdminState with _$AdminState {
  const factory AdminState({
    @Default(StateStatus.initial) StateStatus status,
    AdminView? data,
  }) = _AdminState;
}
