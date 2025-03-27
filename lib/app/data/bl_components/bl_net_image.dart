import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

/// ExtendedImage.network
class BlImageNetwork extends StatelessWidget {
  const BlImageNetwork({
    super.key,
    this.url,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit,
    this.placeholder,
    this.borderRadius,
    this.border,
    this.matchTextDirection = false,
  });

  final String? url;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final String? placeholder;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final bool matchTextDirection;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url ?? "",
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      shape: BoxShape.rectangle,
      borderRadius: borderRadius,
      border: border,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      matchTextDirection: matchTextDirection,
      loadStateChanged: (ExtendedImageState state) {
        // BlLogger.debug("state.extendedImageLoadState = ${state.extendedImageLoadState}");
        if (state.extendedImageLoadState == LoadState.loading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 1,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
          );
        } else if (state.extendedImageLoadState == LoadState.failed) {
          return ClipRRect(
            borderRadius: borderRadius ?? BorderRadiusDirectional.circular(20),
            child: Image.asset(
              placeholder ?? "assets/images/app/bl_logo.png",
              fit: BoxFit.cover,
            ),
          );
        }
        return null;
      },
    );
  }
}

/// ExtendedImage.asset
class AppImageAsset extends StatelessWidget {
  const AppImageAsset(
    this.name, {
    super.key,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit = BoxFit.cover,
    this.placeholder = "assets/images/app/app_home_anchor_detail_video_placeholder.png",
    this.borderRadius,
    this.border,
    this.matchTextDirection = false,
  });

  final String name;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit fit;
  final String placeholder;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final bool matchTextDirection;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.asset(
      name,
      width: width,
      height: height,
      fit: fit,
      shape: BoxShape.rectangle,
      borderRadius: borderRadius,
      border: border,
      matchTextDirection: matchTextDirection,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      loadStateChanged: (ExtendedImageState state) {
        if (state.extendedImageLoadState == LoadState.failed || state.extendedImageLoadState == LoadState.loading) {
          return ClipRRect(
            borderRadius: borderRadius ?? BorderRadiusDirectional.circular(20),
            child: Image.asset(
              placeholder,
              fit: BoxFit.cover,
            ),
          );
        }
        return null;
      },
    );
  }
}
