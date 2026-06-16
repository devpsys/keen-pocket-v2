import 'package:flutter/material.dart';

/// Centered progress indicator for the `loading` universal state.
class KpLoadingView extends StatelessWidget {
  const KpLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
