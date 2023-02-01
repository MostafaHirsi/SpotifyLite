import 'package:json_annotation/json_annotation.dart';

import 'image.dart';
part 'item.g.dart';

@JsonSerializable()
class Item {
  final String id;
  final String name;
  final List<Image> images;

  Item(this.id, this.name, this.images);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
