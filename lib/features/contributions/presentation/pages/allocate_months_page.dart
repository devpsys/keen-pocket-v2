import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_cubit.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_state.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/allocate_fixtures.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/allocate_widgets.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/contribute_fixtures.dart';

/// Allocate-across-months step (design `allocate_months` / `_tablet`): split the
/// contribution over pending months, then submit. Pops `true` on success.
class AllocateMonthsPage extends StatelessWidget {
  const AllocateMonthsPage({required this.context, this.amount, super.key});

  final ContributionContext context;

  /// The contribution being split across months (defaults to the fixture total).
  final Money? amount;

  @override
  Widget build(BuildContext _) {
    return BlocProvider<ContributeCubit>(
      create: (_) => getIt<ContributeCubit>(),
      child: _AllocateView(context: context, amount: amount ?? kAllocateTotal),
    );
  }
}

class _AllocateView extends StatefulWidget {
  const _AllocateView({required this.context, required this.amount});

  final ContributionContext context;
  final Money amount;

  @override
  State<_AllocateView> createState() => _AllocateViewState();
}

class _AllocateViewState extends State<_AllocateView> {
  late final List<TextEditingController> _controllers = [
    for (final m in kAllocateMonths)
      TextEditingController(text: '${m.allocated}'),
  ];

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit(BuildContext context) {
    context.read<ContributeCubit>().submit(
      context: widget.context,
      amount: widget.amount,
    );
  }

  Color _tint(BuildContext context, int i) => switch (i % 3) {
    0 => context.colorScheme.primary,
    1 => context.colorScheme.secondary,
    _ => context.colorScheme.tertiary,
  };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContributeCubit, ContributeState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.contributionSubmitted)),
          );
          Navigator.of(context).pop(true);
        } else if (state.status.isFailure && state.failure != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failure!.localizedMessage(context))),
          );
        }
      },
      builder: (context, state) {
        final loading = state.status.isLoading;
        if (context.isExpanded) {
          return AppTabletShell(
            selectedIndex: kPocketsTabIndex,
            body: Scaffold(body: SafeArea(child: _tablet(context))),
          );
        }
        return Scaffold(
          appBar: _appBar(context),
          body: SafeArea(child: _phone(context, loading)),
        );
      },
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: context.colorScheme.primary),
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        context.l10n.brandWordmark,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: KpSpacing.m),
          child: Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.colorScheme.primaryContainer,
                width: 2,
              ),
            ),
            child: const KpNetworkAvatar(url: kContributeAvatarUrl, radius: 14),
          ),
        ),
      ],
    );
  }

  Widget _submitBar(BuildContext context, bool loading) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.m),
        child: KpButton(
          label: context.l10n.allocateSubmit,
          icon: Icons.send_rounded,
          isLoading: loading,
          onPressed: () => _submit(context),
        ),
      ),
    );
  }

  Widget _phone(BuildContext context, bool loading) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(KpSpacing.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AllocateHeader(allocated: widget.amount, total: widget.amount),
                const Gap.xl(),
                const AllocateNote(),
                const Gap.xl(),
                AllocateMonthsHeading(count: kAllocateMonths.length),
                const Gap.m(),
                for (var i = 0; i < kAllocateMonths.length; i++) ...[
                  if (i > 0) const Gap.m(),
                  AllocateMonthCard(
                    month: kAllocateMonths[i],
                    tint: _tint(context, i),
                    controller: _controllers[i],
                  ),
                ],
              ],
            ),
          ),
        ),
        _submitBar(context, loading),
      ],
    );
  }

  Widget _tablet(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.fromLTRB(
            KpSpacing.xl,
            KpSpacing.xl,
            KpSpacing.xl,
            KpSpacing.xxxl + KpSpacing.xl,
          ),
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AllocateTabletHeader(
                    allocated: widget.amount,
                    total: widget.amount,
                  ),
                  const Gap.xl(),
                  const AllocateConfirmationBanner(),
                  const Gap.l(),
                  AllocateMonthsHeading(count: kAllocateMonths.length),
                  const Gap.m(),
                  _grid(context),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: KpSpacing.xl,
          bottom: KpSpacing.xl,
          child: AllocateSubmitPill(onPressed: () => _submit(context)),
        ),
      ],
    );
  }

  Widget _grid(BuildContext context) {
    const columns = 3;
    final rows = <Widget>[];
    for (var i = 0; i < kAllocateMonths.length; i += columns) {
      if (i > 0) rows.add(const Gap.m());
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var c = 0; c < columns; c++) ...[
              if (c > 0) const Gap.m(horizontal: true),
              Expanded(
                child: i + c < kAllocateMonths.length
                    ? AllocateMonthCardTablet(
                        month: kAllocateMonths[i + c],
                        controller: _controllers[i + c],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }
}
