import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_cubit.dart';
import 'package:keenpockets/features/contributions/presentation/cubit/contribute_state.dart';

/// Form to submit a contribution for a [context]. Pops `true` on success.
class ContributePage extends StatelessWidget {
  const ContributePage({required this.context, super.key});

  final ContributionContext context;

  @override
  Widget build(BuildContext _) {
    return BlocProvider<ContributeCubit>(
      create: (_) => getIt<ContributeCubit>(),
      child: _ContributeView(context: context),
    );
  }
}

class _ContributeView extends StatefulWidget {
  const _ContributeView({required this.context});

  final ContributionContext context;

  @override
  State<_ContributeView> createState() => _ContributeViewState();
}

class _ContributeViewState extends State<_ContributeView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final naira = num.tryParse(_controller.text.trim()) ?? 0;
    context.read<ContributeCubit>().submit(
      context: widget.context,
      amount: Money.naira(naira),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.contributeTitle)),
      body: BlocConsumer<ContributeCubit, ContributeState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.l10n.contributionSubmitted)),
            );
            Navigator.of(context).pop(true);
          } else if (state.status.isFailure &&
              state.fieldErrors.isEmpty &&
              state.failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure!.localizedMessage(context))),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(KpSpacing.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KpTextField(
                    label: context.l10n.contributeAmountLabel,
                    hint: context.l10n.contributeAmountHint,
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    errorText: state.fieldErrors.containsKey('amount')
                        ? context.l10n.contributeAmountInvalid
                        : null,
                  ),
                  const Gap.l(),
                  KpButton(
                    label: context.l10n.contributeSubmit,
                    isLoading: state.status.isLoading,
                    onPressed: () => _submit(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
