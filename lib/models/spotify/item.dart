import 'package:json_annotation/json_annotation.dart';

import 'image.dart';
part 'item.g.dart';

@JsonSerializable()
class Item {
  final String id;
  final String name;
  final String type;
  final List<Image> images;

  Item(this.id, this.name, this.images, this.type);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
