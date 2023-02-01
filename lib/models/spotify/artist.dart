import 'package:json_annotation/json_annotation.dart';
import 'package:spotify_lite/models/spotify/item.dart';
part 'artist.g.dart';

@JsonSerializable()
class Artist {
  final List<Item> items;

  Artist(this.items);

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}
