import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/trust/presentation/widgets/trust_fixtures.dart';
import 'package:keenpockets/features/trust/presentation/widgets/vouch_fixtures.dart';
import 'package:keenpockets/features/trust/presentation/widgets/vouch_tablet_widgets.dart';
import 'package:keenpockets/features/trust/presentation/widgets/vouch_widgets.dart';

/// Vouch requests inbox (design `vouches_inbox` / `vouch_requests_tablet`):
/// review incoming join requests and recommend or decline. Presentation-only.
class VouchesInboxPage extends StatefulWidget {
  const VouchesInboxPage({this.requests, super.key});

  final List<VouchRequest>? requests;

  @override
  State<VouchesInboxPage> createState() => _VouchesInboxPageState();
}

class _VouchesInboxPageState extends State<VouchesInboxPage> {
  late final List<VouchRequest> _requests =
      widget.requests ?? List.of(kVouchRequests);
  var _selected = 0;

  void _resolve(VouchRequest r) {
    setState(() {
      _requests.remove(r);
      if (_selected >= _requests.length) _selected = 0;
    });
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
        IconButton(
          onPressed: () {},
          icon: Icon(
            KpIcons.notificationsOutlined,
            color: context.colorScheme.primary,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: KpSpacing.m),
          child: Center(
            child: KpNetworkAvatar(url: kTrustAvatarUrl, radius: KpSpacing.m),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (context.isExpanded) {
      return AppTabletShell(
        selectedIndex: kPocketsTabIndex,
        body: Scaffold(body: SafeArea(child: _tablet(context))),
      );
    }
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(child: _phone(context)),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.vouchTitle, style: context.textTheme.headlineMedium),
        const Gap.xxs(),
        Text(
          context.l10n.vouchSubtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _phone(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        _header(context),
        const Gap.l(),
        if (_requests.isEmpty)
          VouchEmptyState(
            onRefresh: () => setState(
              () => _requests
                ..clear()
                ..addAll(kVouchRequests),
            ),
          )
        else
          for (final r in _requests) ...[
            VouchRequestCard(
              request: r,
              onRecommend: () => _resolve(r),
              onDecline: () => _resolve(r),
            ),
            const Gap.l(),
          ],
      ],
    );
  }

  Widget _tablet(BuildContext context) {
    if (_requests.isEmpty) {
      return Center(
        child: VouchEmptyState(
          onRefresh: () => setState(() {
            _requests.addAll(kVouchRequests);
          }),
        ),
      );
    }
    final selected = _requests[_selected.clamp(0, _requests.length - 1)];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(context),
            const Gap.l(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              context.l10n.vouchPendingCount(_requests.length),
                              style: context.textTheme.titleLarge,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: KpSpacing.s,
                              vertical: KpSpacing.xxs,
                            ),
                            decoration: BoxDecoration(
                              color: context.colorScheme.primaryContainer,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(KpRadii.pill),
                              ),
                            ),
                            child: Text(
                              context.l10n.vouchNewActivity,
                              style: context.textTheme.labelSmall?.copyWith(
                                color: context.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap.m(),
                      for (var i = 0; i < _requests.length; i++) ...[
                        VouchListRow(
                          request: _requests[i],
                          selected: i == _selected,
                          onTap: () => setState(() => _selected = i),
                        ),
                        const Gap.s(),
                      ],
                    ],
                  ),
                ),
                const Gap.l(horizontal: true),
                Expanded(
                  flex: 7,
                  child: VouchDetailPanel(
                    request: selected,
                    onRecommend: () => _resolve(selected),
                    onDecline: () => _resolve(selected),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
