import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yande_gui/image_saver.dart';
import 'package:yande_gui/rust_lib.dart';
import 'package:yande_gui/src/rust/yande/model/post.dart';

part 'logic.g.dart';

enum DownloadTaskStateType {
  idle,
  busy,
  completed,
  failed,
}

class DownloadTaskState {
  final Post post;
  final double progress;
  final DownloadTaskStateType type;

  DownloadTaskState({
    required this.post,
    required this.progress,
    required this.type,
  });

  DownloadTaskState copyWith({
    Post? post,
    double? progress,
    DownloadTaskStateType? type,
  }) {
    return DownloadTaskState(
      post: post ?? this.post,
      progress: progress ?? this.progress,
      type: type ?? this.type,
    );
  }
}

class DownloaderState {
  final List<DownloadTaskProvider> tasks;

  DownloaderState({
    required this.tasks,
  });

  DownloaderState copyWith({
    List<DownloadTaskProvider>? tasks,
  }) {
    return DownloaderState(
      tasks: tasks ?? this.tasks,
    );
  }
}

@Riverpod(keepAlive: true)
class Downloader extends _$Downloader {
  @override
  DownloaderState build() {
    return DownloaderState(
      tasks: [],
    );
  }

  Future<DownloadTaskProvider?> addTask(Post post) async {
    if (state.tasks.any((provider) => provider.post.id == post.id)) {
      EasyLoading.showToast('Download task already exists');
      return null;
    }
    if (await ImageSaver.existImage('${post.id}.${post.fileExt}',post.fileSize)) {
      EasyLoading.showToast('Image file already exists');
      return null;
    }
    final provider = downloadTaskProvider(post: post);
    state = state.copyWith(tasks: [...state.tasks, provider]);
    return provider;
  }
}

@Riverpod(keepAlive: true)
class DownloadTask extends _$DownloadTask {
  @override
  DownloadTaskState build({required Post post}) {
    return DownloadTaskState(
      post: post,
      progress: 0,
      type: DownloadTaskStateType.busy,
    );
  }

  void updateProgress(int received, int total) {
    state = state.copyWith(progress: received / total);
  }

  void doDownload({bool retry = false}) {
    state = state.copyWith(type: DownloadTaskStateType.busy, progress: 0);
    if (retry) {
      EasyLoading.showToast('Retry download task ${state.post.id}');
    } else {
      EasyLoading.showToast('Download task start ${state.post.id}');
    }
    YandeClient.downloadToMemory(
      url: state.post.fileUrl,
      progressCallback: (received, total) async {
        updateProgress(received, total);
      },
    ).then((bytes) {
      try {
        ImageSaver.saveImage(bytes, '${state.post.id}.${state.post.fileExt}');
        EasyLoading.showSuccess('Downloaded ${state.post.id}');
        state = state.copyWith(type: DownloadTaskStateType.completed);
      } catch (e) {
        EasyLoading.showError('Save ${state.post.id} failed: $e');
        state = state.copyWith(type: DownloadTaskStateType.failed);
      }
    }).catchError((e) {
      EasyLoading.showError('Download ${state.post.id} failed: $e');
      state = state.copyWith(type: DownloadTaskStateType.failed);
    });
  }
}
