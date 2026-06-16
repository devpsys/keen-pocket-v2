import 'package:flutter/material.dart';

/// Centered progress indicator used for the `loading` state of any screen.
class AppLoadingView extends StatelessWidget {
  const AppLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
