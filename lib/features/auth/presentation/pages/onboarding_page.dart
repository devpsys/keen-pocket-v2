import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/auth/presentation/widgets/auth_chrome.dart';

/// Onboarding carousel (design phase B — `onboarding_carousel`). Pre-auth;
/// `onDone`/`onSkip` route to login (injected by the router).
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({this.onDone, this.onSkip, super.key});

  final VoidCallback? onDone;
  final VoidCallback? onSkip;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slides = [
      (
        mood: KpMascotMood.wave,
        title: context.l10n.onboard1Title,
        body: context.l10n.onboard1Body,
      ),
      (
        mood: KpMascotMood.think,
        title: context.l10n.onboard2Title,
        body: context.l10n.onboard2Body,
      ),
      (
        mood: KpMascotMood.celebrate,
        title: context.l10n.onboard3Title,
        body: context.l10n.onboard3Body,
      ),
    ];
    final isLast = _page == slides.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(KpSpacing.m),
              child: AuthTopBar(
                trailing: TextButton(
                  onPressed: widget.onSkip,
                  child: Text(context.l10n.onboardingSkip),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, i) {
                  final s = slides[i];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(KpSpacing.l),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KpCard(
                          child: Column(
                            children: [
                              KpMascot(mood: s.mood, size: 160),
                              const Gap.s(),
                              Text(
                                context.l10n.mascotName,
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                context.l10n.brandWordmark,
                                style: context.textTheme.labelLarge?.copyWith(
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap.xl(),
                        Text(s.title, style: context.textTheme.headlineLarge),
                        const Gap.s(),
                        Text(
                          s.body,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < slides.length; i++)
                  _Dot(active: i == _page),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(KpSpacing.l),
              child: KpButton(
                label: isLast
                    ? context.l10n.onboardingStart
                    : context.l10n.onboardingNext,
                caps: true,
                onPressed: () {
                  if (isLast) {
                    widget.onDone?.call();
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: KpSpacing.xxs),
      width: active ? KpSpacing.l : KpSpacing.xs,
      height: KpSpacing.xs,
      decoration: BoxDecoration(
        color: active
            ? context.colorScheme.primary
            : context.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
    );
  }
}
