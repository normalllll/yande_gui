// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.4.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/rustc.dart';
import 'api/yande_client.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'yande/model/post.dart';
import 'yande/model/similar.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({
    required RustLibApi api,
  }) {
    instance.initMockImpl(
      api: api,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {}

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.4.0';

  @override
  int get rustContentHash => -323707379;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'core',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  String crateApiRustcRustcVersion();

  Future<void> crateApiYandeClientYandeClientDownloadToFile(
      {required YandeClient that,
      required String url,
      required String filePath,
      required FutureOr<void> Function(BigInt, BigInt) progressCallback});

  Future<Uint8List> crateApiYandeClientYandeClientDownloadToMemory(
      {required YandeClient that,
      required String url,
      required FutureOr<void> Function(BigInt, BigInt) progressCallback});

  Future<List<Post>> crateApiYandeClientYandeClientGetPosts(
      {required YandeClient that,
      required List<String> tags,
      required int limit,
      required int page});

  Future<Similar> crateApiYandeClientYandeClientGetSimilar(
      {required YandeClient that, required PlatformInt64 postId});

  Future<YandeClient> crateApiYandeClientYandeClientNew({StringArray3? ips});

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_YandeClient;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_YandeClient;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_YandeClientPtr;
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  String crateApiRustcRustcVersion() {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 1)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_String,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiRustcRustcVersionConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiRustcRustcVersionConstMeta => const TaskConstMeta(
        debugName: "rustc_version",
        argNames: [],
      );

  @override
  Future<void> crateApiYandeClientYandeClientDownloadToFile(
      {required YandeClient that,
      required String url,
      required String filePath,
      required FutureOr<void> Function(BigInt, BigInt) progressCallback}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
            that, serializer);
        sse_encode_String(url, serializer);
        sse_encode_String(filePath, serializer);
        sse_encode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(
            progressCallback, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 2, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: sse_decode_AnyhowException,
      ),
      constMeta: kCrateApiYandeClientYandeClientDownloadToFileConstMeta,
      argValues: [that, url, filePath, progressCallback],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiYandeClientYandeClientDownloadToFileConstMeta =>
      const TaskConstMeta(
        debugName: "YandeClient_download_to_file",
        argNames: ["that", "url", "filePath", "progressCallback"],
      );

  @override
  Future<Uint8List> crateApiYandeClientYandeClientDownloadToMemory(
      {required YandeClient that,
      required String url,
      required FutureOr<void> Function(BigInt, BigInt) progressCallback}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
            that, serializer);
        sse_encode_String(url, serializer);
        sse_encode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(
            progressCallback, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 3, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_list_prim_u_8_strict,
        decodeErrorData: sse_decode_AnyhowException,
      ),
      constMeta: kCrateApiYandeClientYandeClientDownloadToMemoryConstMeta,
      argValues: [that, url, progressCallback],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiYandeClientYandeClientDownloadToMemoryConstMeta =>
      const TaskConstMeta(
        debugName: "YandeClient_download_to_memory",
        argNames: ["that", "url", "progressCallback"],
      );

  @override
  Future<List<Post>> crateApiYandeClientYandeClientGetPosts(
      {required YandeClient that,
      required List<String> tags,
      required int limit,
      required int page}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
            that, serializer);
        sse_encode_list_String(tags, serializer);
        sse_encode_u_32(limit, serializer);
        sse_encode_u_32(page, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 4, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_list_post,
        decodeErrorData: sse_decode_AnyhowException,
      ),
      constMeta: kCrateApiYandeClientYandeClientGetPostsConstMeta,
      argValues: [that, tags, limit, page],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiYandeClientYandeClientGetPostsConstMeta =>
      const TaskConstMeta(
        debugName: "YandeClient_get_posts",
        argNames: ["that", "tags", "limit", "page"],
      );

  @override
  Future<Similar> crateApiYandeClientYandeClientGetSimilar(
      {required YandeClient that, required PlatformInt64 postId}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
            that, serializer);
        sse_encode_i_64(postId, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 5, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_similar,
        decodeErrorData: sse_decode_AnyhowException,
      ),
      constMeta: kCrateApiYandeClientYandeClientGetSimilarConstMeta,
      argValues: [that, postId],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiYandeClientYandeClientGetSimilarConstMeta =>
      const TaskConstMeta(
        debugName: "YandeClient_get_similar",
        argNames: ["that", "postId"],
      );

  @override
  Future<YandeClient> crateApiYandeClientYandeClientNew({StringArray3? ips}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_opt_String_array_3(ips, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 6, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData:
            sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiYandeClientYandeClientNewConstMeta,
      argValues: [ips],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiYandeClientYandeClientNewConstMeta =>
      const TaskConstMeta(
        debugName: "YandeClient_new",
        argNames: ["ips"],
      );

  Future<void> Function(int, dynamic, dynamic)
      encode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(
          FutureOr<void> Function(BigInt, BigInt) raw) {
    return (callId, rawArg0, rawArg1) async {
      final arg0 = dco_decode_usize(rawArg0);
      final arg1 = dco_decode_usize(rawArg1);

      Box<void>? rawOutput;
      Box<AnyhowException>? rawError;
      try {
        rawOutput = Box(await raw(arg0, arg1));
      } catch (e, s) {
        rawError = Box(AnyhowException("$e\n\n$s"));
      }

      final serializer = SseSerializer(generalizedFrbRustBinding);
      assert((rawOutput != null) ^ (rawError != null));
      if (rawOutput != null) {
        serializer.buffer.putUint8(0);
        sse_encode_unit(rawOutput.value, serializer);
      } else {
        serializer.buffer.putUint8(1);
        sse_encode_AnyhowException(rawError!.value, serializer);
      }
      final output = serializer.intoRaw();

      generalizedFrbRustBinding.dartFnDeliverOutput(
          callId: callId,
          ptr: output.ptr,
          rustVecLen: output.rustVecLen,
          dataLen: output.dataLen);
    };
  }

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_YandeClient => wire
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_YandeClient => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return AnyhowException(raw as String);
  }

  @protected
  YandeClient
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return YandeClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  YandeClient
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return YandeClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  FutureOr<void> Function(BigInt, BigInt)
      dco_decode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    throw UnimplementedError('');
  }

  @protected
  Object dco_decode_DartOpaque(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return decodeDartOpaque(raw, generalizedFrbRustBinding);
  }

  @protected
  YandeClient
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return YandeClientImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  StringArray3 dco_decode_String_array_3(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return StringArray3((raw as List<dynamic>).map(dco_decode_String).toList());
  }

  @protected
  bool dco_decode_bool(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as bool;
  }

  @protected
  PlatformInt64 dco_decode_box_autoadd_i_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dco_decode_i_64(raw);
  }

  @protected
  PlatformInt64 dco_decode_i_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeI64(raw);
  }

  @protected
  PlatformInt64 dco_decode_isize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeI64(raw);
  }

  @protected
  List<String> dco_decode_list_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_String).toList();
  }

  @protected
  List<Post> dco_decode_list_post(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_post).toList();
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  StringArray3? dco_decode_opt_String_array_3(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw == null ? null : dco_decode_String_array_3(raw);
  }

  @protected
  PlatformInt64? dco_decode_opt_box_autoadd_i_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw == null ? null : dco_decode_box_autoadd_i_64(raw);
  }

  @protected
  Post dco_decode_post(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 37)
      throw Exception('unexpected arr length: expect 37 but see ${arr.length}');
    return Post(
      id: dco_decode_i_64(arr[0]),
      tags: dco_decode_String(arr[1]),
      createdAt: dco_decode_i_64(arr[2]),
      updatedAt: dco_decode_i_64(arr[3]),
      creatorId: dco_decode_i_64(arr[4]),
      author: dco_decode_String(arr[5]),
      change: dco_decode_i_64(arr[6]),
      source: dco_decode_String(arr[7]),
      score: dco_decode_i_64(arr[8]),
      md5: dco_decode_String(arr[9]),
      fileSize: dco_decode_i_64(arr[10]),
      fileExt: dco_decode_String(arr[11]),
      fileUrl: dco_decode_String(arr[12]),
      isShownInIndex: dco_decode_bool(arr[13]),
      previewUrl: dco_decode_String(arr[14]),
      previewWidth: dco_decode_i_64(arr[15]),
      previewHeight: dco_decode_i_64(arr[16]),
      actualPreviewWidth: dco_decode_i_64(arr[17]),
      actualPreviewHeight: dco_decode_i_64(arr[18]),
      sampleUrl: dco_decode_String(arr[19]),
      sampleWidth: dco_decode_i_64(arr[20]),
      sampleHeight: dco_decode_i_64(arr[21]),
      sampleFileSize: dco_decode_i_64(arr[22]),
      jpegUrl: dco_decode_String(arr[23]),
      jpegWidth: dco_decode_i_64(arr[24]),
      jpegHeight: dco_decode_i_64(arr[25]),
      jpegFileSize: dco_decode_i_64(arr[26]),
      rating: dco_decode_String(arr[27]),
      isRatingLocked: dco_decode_bool(arr[28]),
      hasChildren: dco_decode_bool(arr[29]),
      parentId: dco_decode_opt_box_autoadd_i_64(arr[30]),
      status: dco_decode_String(arr[31]),
      isPending: dco_decode_bool(arr[32]),
      width: dco_decode_i_64(arr[33]),
      height: dco_decode_i_64(arr[34]),
      isHeld: dco_decode_bool(arr[35]),
      isNoteLocked: dco_decode_bool(arr[36]),
    );
  }

  @protected
  Similar dco_decode_similar(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Similar(
      posts: dco_decode_list_post(arr[0]),
      source: dco_decode_post(arr[1]),
    );
  }

  @protected
  int dco_decode_u_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  BigInt dco_decode_usize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_String(deserializer);
    return AnyhowException(inner);
  }

  @protected
  YandeClient
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return YandeClientImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  YandeClient
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return YandeClientImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  Object sse_decode_DartOpaque(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_isize(deserializer);
    return decodeDartOpaque(inner, generalizedFrbRustBinding);
  }

  @protected
  YandeClient
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return YandeClientImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  StringArray3 sse_decode_String_array_3(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_String(deserializer);
    return StringArray3(inner);
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  PlatformInt64 sse_decode_box_autoadd_i_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return (sse_decode_i_64(deserializer));
  }

  @protected
  PlatformInt64 sse_decode_i_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getPlatformInt64();
  }

  @protected
  PlatformInt64 sse_decode_isize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getPlatformInt64();
  }

  @protected
  List<String> sse_decode_list_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <String>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_String(deserializer));
    }
    return ans_;
  }

  @protected
  List<Post> sse_decode_list_post(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <Post>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_post(deserializer));
    }
    return ans_;
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  StringArray3? sse_decode_opt_String_array_3(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    if (sse_decode_bool(deserializer)) {
      return (sse_decode_String_array_3(deserializer));
    } else {
      return null;
    }
  }

  @protected
  PlatformInt64? sse_decode_opt_box_autoadd_i_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    if (sse_decode_bool(deserializer)) {
      return (sse_decode_box_autoadd_i_64(deserializer));
    } else {
      return null;
    }
  }

  @protected
  Post sse_decode_post(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_id = sse_decode_i_64(deserializer);
    var var_tags = sse_decode_String(deserializer);
    var var_createdAt = sse_decode_i_64(deserializer);
    var var_updatedAt = sse_decode_i_64(deserializer);
    var var_creatorId = sse_decode_i_64(deserializer);
    var var_author = sse_decode_String(deserializer);
    var var_change = sse_decode_i_64(deserializer);
    var var_source = sse_decode_String(deserializer);
    var var_score = sse_decode_i_64(deserializer);
    var var_md5 = sse_decode_String(deserializer);
    var var_fileSize = sse_decode_i_64(deserializer);
    var var_fileExt = sse_decode_String(deserializer);
    var var_fileUrl = sse_decode_String(deserializer);
    var var_isShownInIndex = sse_decode_bool(deserializer);
    var var_previewUrl = sse_decode_String(deserializer);
    var var_previewWidth = sse_decode_i_64(deserializer);
    var var_previewHeight = sse_decode_i_64(deserializer);
    var var_actualPreviewWidth = sse_decode_i_64(deserializer);
    var var_actualPreviewHeight = sse_decode_i_64(deserializer);
    var var_sampleUrl = sse_decode_String(deserializer);
    var var_sampleWidth = sse_decode_i_64(deserializer);
    var var_sampleHeight = sse_decode_i_64(deserializer);
    var var_sampleFileSize = sse_decode_i_64(deserializer);
    var var_jpegUrl = sse_decode_String(deserializer);
    var var_jpegWidth = sse_decode_i_64(deserializer);
    var var_jpegHeight = sse_decode_i_64(deserializer);
    var var_jpegFileSize = sse_decode_i_64(deserializer);
    var var_rating = sse_decode_String(deserializer);
    var var_isRatingLocked = sse_decode_bool(deserializer);
    var var_hasChildren = sse_decode_bool(deserializer);
    var var_parentId = sse_decode_opt_box_autoadd_i_64(deserializer);
    var var_status = sse_decode_String(deserializer);
    var var_isPending = sse_decode_bool(deserializer);
    var var_width = sse_decode_i_64(deserializer);
    var var_height = sse_decode_i_64(deserializer);
    var var_isHeld = sse_decode_bool(deserializer);
    var var_isNoteLocked = sse_decode_bool(deserializer);
    return Post(
        id: var_id,
        tags: var_tags,
        createdAt: var_createdAt,
        updatedAt: var_updatedAt,
        creatorId: var_creatorId,
        author: var_author,
        change: var_change,
        source: var_source,
        score: var_score,
        md5: var_md5,
        fileSize: var_fileSize,
        fileExt: var_fileExt,
        fileUrl: var_fileUrl,
        isShownInIndex: var_isShownInIndex,
        previewUrl: var_previewUrl,
        previewWidth: var_previewWidth,
        previewHeight: var_previewHeight,
        actualPreviewWidth: var_actualPreviewWidth,
        actualPreviewHeight: var_actualPreviewHeight,
        sampleUrl: var_sampleUrl,
        sampleWidth: var_sampleWidth,
        sampleHeight: var_sampleHeight,
        sampleFileSize: var_sampleFileSize,
        jpegUrl: var_jpegUrl,
        jpegWidth: var_jpegWidth,
        jpegHeight: var_jpegHeight,
        jpegFileSize: var_jpegFileSize,
        rating: var_rating,
        isRatingLocked: var_isRatingLocked,
        hasChildren: var_hasChildren,
        parentId: var_parentId,
        status: var_status,
        isPending: var_isPending,
        width: var_width,
        height: var_height,
        isHeld: var_isHeld,
        isNoteLocked: var_isNoteLocked);
  }

  @protected
  Similar sse_decode_similar(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_posts = sse_decode_list_post(deserializer);
    var var_source = sse_decode_post(deserializer);
    return Similar(posts: var_posts, source: var_source);
  }

  @protected
  int sse_decode_u_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint32();
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(self.message, serializer);
  }

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          YandeClient self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as YandeClientImpl).frbInternalSseEncode(move: true), serializer);
  }

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          YandeClient self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as YandeClientImpl).frbInternalSseEncode(move: false),
        serializer);
  }

  @protected
  void sse_encode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(
      FutureOr<void> Function(BigInt, BigInt) self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_DartOpaque(
        encode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(self),
        serializer);
  }

  @protected
  void sse_encode_DartOpaque(Object self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_isize(
        PlatformPointerUtil.ptrToPlatformInt64(encodeDartOpaque(
            self, portManager.dartHandlerPort, generalizedFrbRustBinding)),
        serializer);
  }

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerYandeClient(
          YandeClient self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as YandeClientImpl).frbInternalSseEncode(move: null), serializer);
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_String_array_3(StringArray3 self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_String(self.inner, serializer);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }

  @protected
  void sse_encode_box_autoadd_i_64(
      PlatformInt64 self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_64(self, serializer);
  }

  @protected
  void sse_encode_i_64(PlatformInt64 self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putPlatformInt64(self);
  }

  @protected
  void sse_encode_isize(PlatformInt64 self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putPlatformInt64(self);
  }

  @protected
  void sse_encode_list_String(List<String> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_String(item, serializer);
    }
  }

  @protected
  void sse_encode_list_post(List<Post> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_post(item, serializer);
    }
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_opt_String_array_3(
      StringArray3? self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    sse_encode_bool(self != null, serializer);
    if (self != null) {
      sse_encode_String_array_3(self, serializer);
    }
  }

  @protected
  void sse_encode_opt_box_autoadd_i_64(
      PlatformInt64? self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    sse_encode_bool(self != null, serializer);
    if (self != null) {
      sse_encode_box_autoadd_i_64(self, serializer);
    }
  }

  @protected
  void sse_encode_post(Post self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_64(self.id, serializer);
    sse_encode_String(self.tags, serializer);
    sse_encode_i_64(self.createdAt, serializer);
    sse_encode_i_64(self.updatedAt, serializer);
    sse_encode_i_64(self.creatorId, serializer);
    sse_encode_String(self.author, serializer);
    sse_encode_i_64(self.change, serializer);
    sse_encode_String(self.source, serializer);
    sse_encode_i_64(self.score, serializer);
    sse_encode_String(self.md5, serializer);
    sse_encode_i_64(self.fileSize, serializer);
    sse_encode_String(self.fileExt, serializer);
    sse_encode_String(self.fileUrl, serializer);
    sse_encode_bool(self.isShownInIndex, serializer);
    sse_encode_String(self.previewUrl, serializer);
    sse_encode_i_64(self.previewWidth, serializer);
    sse_encode_i_64(self.previewHeight, serializer);
    sse_encode_i_64(self.actualPreviewWidth, serializer);
    sse_encode_i_64(self.actualPreviewHeight, serializer);
    sse_encode_String(self.sampleUrl, serializer);
    sse_encode_i_64(self.sampleWidth, serializer);
    sse_encode_i_64(self.sampleHeight, serializer);
    sse_encode_i_64(self.sampleFileSize, serializer);
    sse_encode_String(self.jpegUrl, serializer);
    sse_encode_i_64(self.jpegWidth, serializer);
    sse_encode_i_64(self.jpegHeight, serializer);
    sse_encode_i_64(self.jpegFileSize, serializer);
    sse_encode_String(self.rating, serializer);
    sse_encode_bool(self.isRatingLocked, serializer);
    sse_encode_bool(self.hasChildren, serializer);
    sse_encode_opt_box_autoadd_i_64(self.parentId, serializer);
    sse_encode_String(self.status, serializer);
    sse_encode_bool(self.isPending, serializer);
    sse_encode_i_64(self.width, serializer);
    sse_encode_i_64(self.height, serializer);
    sse_encode_bool(self.isHeld, serializer);
    sse_encode_bool(self.isNoteLocked, serializer);
  }

  @protected
  void sse_encode_similar(Similar self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_post(self.posts, serializer);
    sse_encode_post(self.source, serializer);
  }

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint32(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }
}

@sealed
class YandeClientImpl extends RustOpaque implements YandeClient {
  // Not to be used by end users
  YandeClientImpl.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  YandeClientImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_YandeClient,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_YandeClient,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_YandeClientPtr,
  );

  Future<void> downloadToFile(
          {required String url,
          required String filePath,
          required FutureOr<void> Function(BigInt, BigInt) progressCallback}) =>
      RustLib.instance.api.crateApiYandeClientYandeClientDownloadToFile(
          that: this,
          url: url,
          filePath: filePath,
          progressCallback: progressCallback);

  Future<Uint8List> downloadToMemory(
          {required String url,
          required FutureOr<void> Function(BigInt, BigInt) progressCallback}) =>
      RustLib.instance.api.crateApiYandeClientYandeClientDownloadToMemory(
          that: this, url: url, progressCallback: progressCallback);

  Future<List<Post>> getPosts(
          {required List<String> tags,
          required int limit,
          required int page}) =>
      RustLib.instance.api.crateApiYandeClientYandeClientGetPosts(
          that: this, tags: tags, limit: limit, page: page);

  Future<Similar> getSimilar({required PlatformInt64 postId}) =>
      RustLib.instance.api
          .crateApiYandeClientYandeClientGetSimilar(that: this, postId: postId);
}
