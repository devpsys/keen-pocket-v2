import 'package:flutter/material.dart';

import '../../presentation/state_status.dart';
import 'kp_loading_view.dart';

/// Renders the universal screen states from a [StateStatus] so pages don't
/// re-implement the loading/empty/failure/permission/feature-disabled switch.
///
/// [loaded] is required (initial + success render it). Per-state widgets are
/// optional and supplied by the caller already localized — e.g.
/// `failure: KpErrorView(message: failure.localizedMessage(context), ...)`.
/// Anything not supplied falls back to an empty box (loading falls back to
/// [KpLoadingView]).
class KpAsyncView extends StatelessWidget {
  const KpAsyncView({
    required this.status,
    required this.loaded,
    this.loading,
    this.empty,
    this.failure,
    this.permissionDenied,
    this.featureDisabled,
    super.key,
  });

  final StateStatus status;
  final WidgetBuilder loaded;
  final Widget? loading;
  final Widget? empty;
  final Widget? failure;
  final Widget? permissionDenied;
  final Widget? featureDisabled;

  @override
  Widget build(BuildContext context) {
    const fallback = SizedBox.shrink();
    return switch (status) {
      StateStatus.initial || StateStatus.success => loaded(context),
      StateStatus.loading => loading ?? const KpLoadingView(),
      StateStatus.empty => empty ?? fallback,
      StateStatus.failure => failure ?? fallback,
      StateStatus.permissionDenied => permissionDenied ?? failure ?? fallback,
      StateStatus.featureDisabled => featureDisabled ?? fallback,
    };
  }
}
