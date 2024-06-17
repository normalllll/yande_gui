import 'dart:typed_data';

import 'package:yande_gui/src/rust/api/yande_client.dart' as rust;
import 'package:yande_gui/src/rust/frb_generated.dart' as rust;
import 'package:yande_gui/src/rust/yande/model/post.dart';
import 'package:yande_gui/src/rust/yande/model/similar.dart';

Future<void> rustInit() async {
  await rust.RustLib.init();
}

class YandeClient {
  static Future<List<Post>> getPosts({
    required List<String> tags,
    required int limit,
    required int page,
  }) async {
    return rust.getPosts(tags: tags, limit: limit, page: page);
  }

  static Future<Similar> getSimilar({
    required int id,
  }) async {
    return rust.getSimilar(postId: id);
  }

  static Future<void> downloadToFile({
    required String url,
    required String filePath,
    required Future<void> Function(BigInt, BigInt) progressCallback,
  }) async {
    return rust.downloadToFile(
      url: url,
      filePath: filePath,
      progressCallback: progressCallback,
    );
  }

  static Future<Uint8List> downloadToMemory({
    required String url,
    required Future<void> Function(BigInt, BigInt) progressCallback,
  }) async {
    return rust.downloadToMemory(
      url: url,
      progressCallback: progressCallback,
    );
  }
}
