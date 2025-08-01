import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yande_gui/download_foreground_service_plugin.dart';
import 'package:yande_gui/i18n.dart';
import 'package:yande_gui/services/settings_service.dart';
import 'package:path/path.dart' as path;

import '../download_task.dart';
import '../downloader_platform.dart';
import 'download_queue_manger.dart';

class DownloaderAndroid<T> extends DownloaderPlatform<T> {
  late final _downloadQueueManager = DownloadQueueManager(
    getMaxConcurrentDownloads: () => SettingsService.maxConcurrentDownloads,
    onFirstTaskStarted: onFirstTaskStarted,
    onAllTasksCompleted: onAllTasksCompleted,
    onProgressChanged: onProgressChanged,
  );

  final MethodChannel _channel = MethodChannel('image_saver');

  Future<void> onFirstTaskStarted() async {
    try {
      await DownloadForegroundServicePlugin.startService(title: 'Yande GUI Downloader', text: 'Download start');
      await Future.delayed(const Duration(milliseconds: 300));
    } catch (e) {
      log('onFirstTaskStarted: startService:$e');
    }
  }

  Future<void> onAllTasksCompleted() async {
    try {
      DownloadForegroundServicePlugin.stopService();
    } catch (e) {
      log('onAllTasksCompleted: stopService:$e');
    }
  }

  void onProgressChanged(int total, int completed, int failed, int canceled, double overallProgress) {
    try {
      DownloadForegroundServicePlugin.updateProgress(
        title: 'Yande GUI Downloader',
        text: '🖼️$total ✅$completed ❌$failed ✖️$canceled ${(overallProgress * 100).toStringAsFixed(1)}%',

        progress: (overallProgress * 100).toInt(),
      );
    } catch (e) {
      log('onProgressChanged: updateProgress:$e');
    }
  }

  Future<void> _ensureNotificationPermission() async {
    final status = await Permission.notification.status;

    // TODO openDialog: Tell users what the permission application is for
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return;
    }

    if (!status.isGranted) {
      final result = await Permission.notification.request();
      await Future.delayed(const Duration(milliseconds: 300));
      if (!result.isGranted) {
        return;
      }
    }
  }

  Future<bool> _requestPermission({required Permission permission, required String deniedMsg, required String permanentlyDeniedMsg}) async {
    var status = await permission.status;

    if (status.isPermanentlyDenied) {
      EasyLoading.showError(permanentlyDeniedMsg);
      await Future.delayed(const Duration(seconds: 2));
      openAppSettings();
      return false;
    }

    if (!status.isGranted) {
      status = await permission.request();
      if (!status.isGranted) {
        EasyLoading.showError(deniedMsg);
        return false;
      }
    }
    return true;
  }

  Future<bool> saveImage(String filePath, String fileName) async {
    final bool result = await _channel.invokeMethod('saveImage', {'filePath': filePath, 'fileName': fileName});
    return result;
  }

  Future<bool> existImage(String fileName, int? fileSize) async {
    final bool result = await _channel.invokeMethod('existImage', {'fileName': fileName});
    return result;
  }

  @override
  Future<void> init() async {
    SettingsService.maxConcurrentDownloadsStream.listen((_) {
      _downloadQueueManager.schedule();
    });
  }

  @override
  Future<bool> checkPrerequisites(DownloadTask task) async {
    try {
      await _ensureNotificationPermission();
      final androidInfo = await DeviceInfoPlugin().androidInfo;

      bool ok;
      if (androidInfo.version.sdkInt >= 33) {
        ok = await _requestPermission(
          permission: Permission.photos, // Android 13+ READ_MEDIA_IMAGES
          deniedMsg: i18n.downloads.messages.photosDenied,
          permanentlyDeniedMsg: i18n.downloads.messages.photosPermanentlyDenied,
        );
      } else {
        ok = await _requestPermission(
          permission: Permission.storage, // READ/WRITE_EXTERNAL_STORAGE
          deniedMsg: i18n.downloads.messages.storageDenied,
          permanentlyDeniedMsg: i18n.downloads.messages.storagePermanentlyDenied,
        );
      }
      if (!ok) return false;
    } catch (e) {
      EasyLoading.showError(i18n.downloads.messages.deviceInfoError);
      return false;
    }

    if (await existImage(task.fileName, null)) {
      EasyLoading.showError(i18n.downloads.messages.imageFileExists);
      return false;
    }
    return true;
  }

  @override
  Future<void> handleTask(DownloadTask task) async {
    final cacheDirectory = await getApplicationCacheDirectory();

    final downloadsCachePath = path.join(cacheDirectory.path, 'yande_gui');

    final filePath = path.join(downloadsCachePath, task.fileName);
    _downloadQueueManager.startTask(
      taskId: task.taskId,
      url: task.url,
      filePath: filePath,
      maxSegmentsPerTask: SettingsService.maxSegmentsPerTask,
      onEvent: (event) async {
        switch (event) {
          case DownloadEventStart():
            task.emit(task.state.copyWith(status: DownloadStatus.busying));
            break;
          case DownloadEventProgress(:final value):
            task.emit(task.state.copyWith(status: DownloadStatus.busying, progress: value));
            break;
          case DownloadEventSuccess():
            await saveImage(filePath, task.fileName);
            EasyLoading.showSuccess(i18n.downloads.messages.downloadCompletedWith(task.fileName));
            task.emit(task.state.copyWith(status: DownloadStatus.completed));
            break;
          case DownloadEventError(:final error):
            EasyLoading.showError(i18n.downloads.messages.downloadFailedWith(task.fileName));
            task.emit(task.state.copyWith(status: DownloadStatus.failed, error: error));
            break;
        }
      },
    );
  }

  @override
  void cancelTask(String taskId) {
    // TODO: implement cancelTask
  }
}
