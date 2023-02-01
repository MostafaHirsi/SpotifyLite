import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'artist.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  final Album albums;
  final Artist artists;

  SearchResult(this.albums, this.artists);

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
