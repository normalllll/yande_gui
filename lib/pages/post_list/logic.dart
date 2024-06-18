import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yande_gui/data_list_source.dart';
import 'package:yande_gui/rust_lib.dart';
import 'package:yande_gui/src/rust/yande/model/post.dart';

part 'logic.g.dart';

class PostListState {
  final List<String> tags;

  final PostListSource source;

  final int rowMax;

  PostListState({
    required this.tags,
    required this.source,
    this.rowMax = 0,
  });

  PostListState copyWith({
    List<String>? tags,
    PostListSource? source,
    int? rowMax,
  }) {
    return PostListState(
      tags: tags ?? this.tags,
      source: source ?? this.source,
      rowMax: rowMax ?? this.rowMax,
    );
  }
}

class PostListSource extends DataListSource<Post> {
  final List<String> tags;

  PostListSource({
    this.tags = const [],
  });

  @override
  Future<List<Post>> fetchList(int page, int limit) {
    return YandeClient.getPosts(tags: tags, limit: limit, page: page);
  }
}

@riverpod
class PostList extends _$PostList {
  @override
  PostListState build(Type type, {required List<String> tags}) {
    return PostListState(
      tags: tags,
      source: PostListSource(tags: tags),
    );
  }

  void onTagsChanged(List<String> tags) {
    state.source.clear();
    state = state.copyWith(tags: tags, source: PostListSource(tags: tags));
    state.source.refresh(true);
  }

  void onRowMaxChanged(int rowMax) {
    state = state.copyWith(rowMax: rowMax);
  }
}
