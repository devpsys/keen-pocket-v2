import 'package:flutter/widgets.dart';

/// Spacing scale (4-point grid). The single source of truth for gaps,
/// paddings and margins. Raw numbers in `SizedBox`/`EdgeInsets` are rejected by
/// the `no_arbitrary_spacing` lint.
@immutable
abstract final class KpSpacing {
  const KpSpacing._();

  /// 0
  static const double none = 0;

  /// 4
  static const double xxs = 4;

  /// 8
  static const double xs = 8;

  /// 12
  static const double s = 12;

  /// 16
  static const double m = 16;

  /// 24
  static const double l = 24;

  /// 32
  static const double xl = 32;

  /// 48
  static const double xxl = 48;

  /// 64
  static const double xxxl = 64;
}

/// Ready-made vertical/horizontal gap widgets built from [KpSpacing] tokens.
///
/// Use `const Gap.m()` instead of `SizedBox(height: 16)`.
@immutable
class Gap extends StatelessWidget {
  const Gap._(this._size, this._horizontal);

  const Gap.xxs({bool horizontal = false}) : this._(KpSpacing.xxs, horizontal);
  const Gap.xs({bool horizontal = false}) : this._(KpSpacing.xs, horizontal);
  const Gap.s({bool horizontal = false}) : this._(KpSpacing.s, horizontal);
  const Gap.m({bool horizontal = false}) : this._(KpSpacing.m, horizontal);
  const Gap.l({bool horizontal = false}) : this._(KpSpacing.l, horizontal);
  const Gap.xl({bool horizontal = false}) : this._(KpSpacing.xl, horizontal);

  final double _size;
  final bool _horizontal;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: _horizontal ? null : _size,
    width: _horizontal ? _size : null,
  );
}
