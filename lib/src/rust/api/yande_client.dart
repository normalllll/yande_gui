// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.40.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../yande/model/post.dart';
import '../yande/model/similar.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<List<Post>> getPosts(
        {required List<String> tags, required int limit, required int page}) =>
    RustLib.instance.api
        .crateApiYandeClientGetPosts(tags: tags, limit: limit, page: page);

Future<Similar> getSimilar({required PlatformInt64 postId}) =>
    RustLib.instance.api.crateApiYandeClientGetSimilar(postId: postId);

Future<void> downloadToFile(
        {required String url,
        required String filePath,
        required FutureOr<void> Function(BigInt, BigInt) progressCallback}) =>
    RustLib.instance.api.crateApiYandeClientDownloadToFile(
        url: url, filePath: filePath, progressCallback: progressCallback);

Future<Uint8List> downloadToMemory(
        {required String url,
        required FutureOr<void> Function(BigInt, BigInt) progressCallback}) =>
    RustLib.instance.api.crateApiYandeClientDownloadToMemory(
        url: url, progressCallback: progressCallback);
