import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yande_gui/components/yande_image/yande_image.dart';
import 'package:yande_gui/image_saver.dart';
import 'package:yande_gui/pages/downloader/logic.dart';
import 'package:yande_gui/pages/post_detail/logic.dart';
import 'package:yande_gui/rust_lib.dart';
import 'package:yande_gui/src/rust/yande/model/post.dart';

class PostSimilarWidget extends ConsumerStatefulWidget {
  final int id;

  const PostSimilarWidget({super.key, required this.id});

  @override
  ConsumerState createState() => _PostSimilarWidgetState();
}

class _PostSimilarWidgetState extends ConsumerState<PostSimilarWidget> {
  Widget buildPost(Post post) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = width * post.height / post.width;

      return GestureDetector(
        onLongPress: () {
          ref.read(downloaderProvider.notifier).addTask(post).then((downloadTaskProvider) {
            if (downloadTaskProvider != null) {
              ref.read(downloadTaskProvider.notifier).doDownload();
            }
          });
        },
        child: YandeImage(
          post.sampleUrl,
          width: width,
          height: height,
          gesture: true,
          placeholderWidget: YandeImage(
            post.previewUrl,
            width: width,
            height: height,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = getSimilarProvider(id: widget.id);

    return switch (ref.watch(provider)) {
      AsyncData(:final value) => Column(
          children: [
            const Text('Similar Posts'),
            for (final post in value.posts) ...[
              const Divider(),
              if (post.parentId == widget.id) Text('Parent Post: ${widget.id}') else Text('Child Post: ${post.id}'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: buildPost(post),
              ),
            ],
          ],
        ),
      AsyncError(:final error) => GestureDetector(
          onTap: () => ref.refresh(provider),
          behavior: HitTestBehavior.opaque,
          child: Text('Error: $error'),
        ),
      _ => const Center(
          child: CupertinoActivityIndicator(),
        ),
    };
  }
}
