// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.2.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'post.dart';

class Similar {
  final List<Post> posts;
  final Post source;

  const Similar({
    required this.posts,
    required this.source,
  });

  @override
  int get hashCode => posts.hashCode ^ source.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Similar &&
          runtimeType == other.runtimeType &&
          posts == other.posts &&
          source == other.source;
}
