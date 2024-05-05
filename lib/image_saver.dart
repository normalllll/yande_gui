import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ImageSaver {
  static const MethodChannel _channel = MethodChannel('io.github.normalllll.yande_gui/imagesaver');

  static Future<bool> saveImage(Uint8List imageBytes, String filename) async {
    if (Platform.isAndroid) {
      try {
        final bool result = await _channel.invokeMethod('saveImage', {
          'imageBytes': imageBytes,
          'filename': filename,
        });
        return result;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      try {
        final downloadDir = await getDownloadsDirectory();
        final file = File(path.join(downloadDir!.path, 'yande', filename));
        await file.create(recursive: true);
        await file.writeAsBytes(imageBytes);
        return true;
      } catch (e) {
        EasyLoading.showError(e.toString());
        print(e);
        return false;
      }
    }
  }

  static Future<bool> existImage(String filename, int fileSize) async {
    if (Platform.isAndroid) {
      try {
        final bool result = await _channel.invokeMethod('existImage', {
          'filename': filename,
          'fileSize': fileSize,
        });
        return result;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      try {
        final downloadDir = await getDownloadsDirectory();
        final file = File(path.join(downloadDir!.path, 'yande', filename));
        return await file.exists() && await file.length() == fileSize;
      } catch (e) {
        EasyLoading.showError(e.toString());
        print(e);
        return false;
      }
    }
  }
}
