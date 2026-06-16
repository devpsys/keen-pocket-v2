import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/school/presentation/cubit/school_cubit.dart';
import 'package:keenpockets/features/school/presentation/cubit/school_state.dart';

/// School fee management. Backend-gap → flag-gated (built dark).
class SchoolPage extends StatelessWidget {
  const SchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.school);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.schoolTitle)),
      body: FeatureGuard(
        enabled: enabled,
        comingSoon: KpComingSoonCard(
          title: context.l10n.comingSoonTitle,
          message: context.l10n.comingSoonMessage,
        ),
        child: BlocProvider<SchoolCubit>(
          create: (_) => getIt<SchoolCubit>()..load(),
          child: const _SchoolView(),
        ),
      ),
    );
  }
}

class _SchoolView extends StatelessWidget {
  const _SchoolView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolCubit, SchoolState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          loaded: (context) {
            final s = state.school;
            if (s == null) return const SizedBox.shrink();
            return ListView(
              padding: const EdgeInsets.all(KpSpacing.l),
              children: [
                Text(s.name, style: context.textTheme.headlineMedium),
                const Gap.l(),
                _Stat(
                  label: context.l10n.schoolClasses,
                  value: '${s.classCount}',
                ),
                _Stat(
                  label: context.l10n.schoolStudents,
                  value: '${s.studentCount}',
                ),
                _Stat(
                  label: context.l10n.schoolFeesCollected,
                  value: s.feesCollected.format(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(value, style: context.textTheme.titleMedium),
        ],
      ),
    );
  }
}
