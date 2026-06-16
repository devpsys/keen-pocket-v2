import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/pockets/domain/value_objects/money.dart';

part 'pocket.freezed.dart';

/// Per-resource role a user holds in a specific pocket. Authorization is a
/// domain concern — derived here, never re-implemented in widgets.
enum PocketRole { organiser, member, guest }

/// A monthly savings pocket. Pure domain entity (no JSON/Flutter).
@freezed
abstract class Pocket with _$Pocket {
  const factory Pocket({
    required String id,
    required String name,
    required String organiserId,
    required Money handPrice,
    required int totalHands,
    required int filledHands,
    required int memberCount,
    @Default(false) bool isPublic,
    @Default(<String>{}) Set<String> memberIds,
  }) = _Pocket;

  const Pocket._();

  /// Resolves the [PocketRole] for [userId] (the heart of pocket authorization).
  PocketRole roleOf(String userId) {
    if (userId == organiserId) return PocketRole.organiser;
    if (memberIds.contains(userId)) return PocketRole.member;
    return PocketRole.guest;
  }

  bool canManage(String userId) => roleOf(userId) == PocketRole.organiser;

  /// 0.0–1.0 fraction of hands filled.
  double get fillRate => totalHands == 0 ? 0 : filledHands / totalHands;

  bool get isFull => filledHands >= totalHands;
}
