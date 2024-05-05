import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yande_gui/rust_lib.dart';
import 'package:yande_gui/src/rust/yande/model/similar.dart';

part 'logic.g.dart';

@riverpod
Future<Similar> getSimilar(GetSimilarRef ref, {required int id}) async {
  final similar = await YandeClient.getSimilar(id: id);
  return similar;
}
