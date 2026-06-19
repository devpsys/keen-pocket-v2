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
    return CircleAvatar(
      radius: radius,
      backgroundColor: context.colorScheme.primaryContainer,
      foregroundImage: NetworkImage(url),
      onForegroundImageError: (_, _) {},
      child: Icon(fallbackIcon, color: context.colorScheme.onPrimaryContainer),
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
    return ClipRRect(
      borderRadius: borderRadius ?? KpRadii.allM,
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, _, _) => SizedBox(
          width: width,
          height: height,
          child: Icon(
            fallbackIcon,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
