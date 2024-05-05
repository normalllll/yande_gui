import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yande_gui/components/yande_image/yande_image.dart';
import 'package:yande_gui/pages/downloader/logic.dart';
import 'package:yande_gui/pages/post_detail/post_similar_widget.dart';
import 'package:yande_gui/src/rust/yande/model/post.dart';
import 'package:yande_gui/widgets/auto_scaffold/auto_scaffold.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  ConsumerState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  Post get post => widget.post;

  @override
  void dispose() {
    EasyLoading.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoScaffold(
      titleWidget: Text('Post :${post.id}'),
      builder: (context, horizontal) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('id: ${post.id}'),
                  Text('author: ${post.author}'),
                  Text('width: ${post.width}'),
                  Text('height: ${post.height}'),
                  Text('score: ${post.score}'),
                  Text('size: ${(post.fileSize / 1024 / 1024).toStringAsFixed(2)}MB'),
                  Text('parent: ${post.parentId}'),
                  Text('hasChildren: ${post.hasChildren}'),
                  Wrap(
                    children: [
                      for (final tag in post.tags.split(' '))
                        GestureDetector(
                          onTap: () {
                            //set clipboard
                            Clipboard.setData(ClipboardData(text: tag));
                            EasyLoading.showSuccess('Copied $tag');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Chip(
                              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                              label: Text(tag),
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: LayoutBuilder(builder: (context, constraints) {
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
              }),
            ),
            if (post.parentId != null || post.hasChildren) SliverToBoxAdapter(child: PostSimilarWidget(id: post.id)),
          ],
        );
      },
    );
  }
}
