import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Locks device orientation by form factor: **tablets** (shortest side ≥ 600dp)
/// are forced to landscape, **phones** to portrait. The designs ship phone
/// (portrait) and tablet (landscape) renders, so the UI always matches.
///
/// `shortestSide` is orientation-independent, so the classification is stable
/// regardless of how the device is currently held. On platforms where
/// [SystemChrome.setPreferredOrientations] is a no-op (desktop/web) this is
/// harmless.
class OrientationLocker extends StatefulWidget {
  const OrientationLocker({required this.child, super.key});

  final Widget child;

  @override
  State<OrientationLocker> createState() => _OrientationLockerState();
}

class _OrientationLockerState extends State<OrientationLocker> {
  static const _phone = <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];
  static const _tablet = <DeviceOrientation>[
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  List<DeviceOrientation>? _applied;

  void _apply(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    final orientations = isTablet ? _tablet : _phone;
    // Identity check on the const lists — re-applies only if the class changes.
    if (identical(_applied, orientations)) return;
    _applied = orientations;
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Widget build(BuildContext context) {
    _apply(context);
    return widget.child;
  }
}
