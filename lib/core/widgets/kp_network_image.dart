import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Circular avatar backed by a remote image (the designs use hosted portraits),
/// with a graceful icon fallback while loading or on error.
class KpNetworkAvatar extends StatelessWidget {
  const KpNetworkAvatar({
    required this.url,
    this.radius = 20,
    this.fallbackIcon = Icons.person_rounded,
    super.key,
  });

  final String url;
  final double radius;
  final IconData fallbackIcon;

  @override
  Widget build(BuildContext context) {
    final diameter = radius * 2;
    final fallback = _AvatarFallback(
      diameter: diameter,
      icon: fallbackIcon,
      iconSize: radius,
    );
    return ClipOval(
      child: Image.network(
        url,
        width: diameter,
        height: diameter,
        fit: BoxFit.cover,
        // Show the placeholder until the first frame is actually painted
        // (frame == null), then the photo. `loadingBuilder` is unreliable here:
        // it reports a null progress mid-load, leaving a transparent gap.
        frameBuilder: (context, child, frame, _) =>
            frame == null ? fallback : child,
        errorBuilder: (_, _, _) => fallback,
      ),
    );
  }
}

class _AvatarFallback extends StatelessWidget {
  const _AvatarFallback({
    required this.diameter,
    required this.icon,
    required this.iconSize,
  });

  final double diameter;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      alignment: Alignment.center,
      color: context.colorScheme.primaryContainer,
      child: Icon(
        icon,
        size: iconSize,
        color: context.colorScheme.onPrimaryContainer,
      ),
    );
  }
}

/// Rectangular remote image (mascots, banners, thumbnails) with a rounded clip
/// and an icon fallback on error.
class KpNetworkImage extends StatelessWidget {
  const KpNetworkImage({
    required this.url,
    this.width,
    this.height,
    this.borderRadius,
    this.fallbackIcon = Icons.image_rounded,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String url;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final IconData fallbackIcon;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final fallback = SizedBox(
      width: width,
      height: height,
      child: Icon(fallbackIcon, color: context.colorScheme.onSurfaceVariant),
    );
    return ClipRRect(
      borderRadius: borderRadius ?? KpRadii.allM,
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        frameBuilder: (context, child, frame, _) =>
            frame == null ? fallback : child,
        errorBuilder: (_, _, _) => fallback,
      ),
    );
  }
}
