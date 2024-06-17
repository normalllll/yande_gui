import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yande_gui/pages/downloader/logic.dart';

class DownloadTaskWidget extends ConsumerWidget {
  final DownloadTaskProvider provider;

  const DownloadTaskWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    return Card(
      child: ListTile(
        title: Text(state.post.id.toString()),
        subtitle: LinearProgressIndicator(value: state.progress),
        trailing: switch (state.type) {
          DownloadTaskStateType.idle => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ref.read(provider.notifier).doDownload();
              },
              child: const Icon(Icons.download_outlined),
            ),
          DownloadTaskStateType.busy => const CupertinoActivityIndicator(),
          DownloadTaskStateType.completed => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ref.read(provider.notifier).doDownload(retry: true);
              },
              child: const Icon(Icons.check_outlined),
            ),
          DownloadTaskStateType.failed => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ref.read(provider.notifier).doDownload(retry: true);
              },
              child: const Icon(Icons.error_outline),
            ),
        },
      ),
    );
  }
}
