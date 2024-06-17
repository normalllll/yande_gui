import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_provider.dart';

class YandeImage extends StatelessWidget {
  final String url;
  final Color? color;

  final BlendMode? colorBlendMode;

  final double? width;

  final double? height;

  final BoxFit? fit;

  final Widget Function(Widget imageWidget)? imageBuilder;

  final Widget? placeholderWidget;

  final bool? gesture;

  const YandeImage(
    this.url, {
    super.key,
    this.color,
    this.colorBlendMode,
    this.width,
    this.height,
    this.fit,
    this.imageBuilder,
    this.placeholderWidget,
    this.gesture,
  });

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      image: YandeExtendedImageProvider(
        url,
        cache: true,
        printError: false,
      ),
      handleLoadingProgress: true,
      initGestureConfigHandler: switch (gesture) {
        true => (state) => GestureConfig(
              minScale: 0.9,
              animationMinScale: 0.7,
              maxScale: 3.0,
              animationMaxScale: 3.5,
              speed: 1.0,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              inPageView: false,
              initialAlignment: InitialAlignment.center,
            ),
        _ => null,
      },
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            if (state.loadingProgress case ImageChunkEvent event?) {
              if (event.expectedTotalBytes case int total?) {
                double progress = switch (total == 0) {
                  true => 1.0,
                  false => event.cumulativeBytesLoaded / total,
                };
                if (placeholderWidget case Widget widget?) {
                  return Stack(
                    children: [
                      widget,
                      Positioned(left: 0, top: 0, right: 0, child: LinearProgressIndicator(value: progress)),
                    ],
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(5),
                    child: Center(child: CupertinoActivityIndicator()),
                  );
                }
              }
            } else {
              if (placeholderWidget case Widget widget?) {
                return Stack(
                  children: [
                    widget,
                    const Positioned(left: 0, top: 0, right: 0, child: LinearProgressIndicator()),
                  ],
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(child: CupertinoActivityIndicator()),
                );
              }
            }
            return const Padding(
              padding: EdgeInsets.all(5),
              child: Center(child: CupertinoActivityIndicator()),
            );
          case LoadState.completed:
            return imageBuilder?.call(state.completedWidget);
          case LoadState.failed:
            return Center(child: IconButton(icon: const Icon(Icons.refresh_outlined), onPressed: state.reLoadImage));
        }
        return null;
      },
      color: color,
      colorBlendMode: colorBlendMode,
      enableMemoryCache: false,
      width: width,
      height: height,
      fit: fit ?? BoxFit.fitWidth,
    );
  }
}
