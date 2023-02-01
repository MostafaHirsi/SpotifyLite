import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
part 'album.g.dart';

@JsonSerializable()
class Album {
  final List<Item> items;

  Album(this.items);

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
