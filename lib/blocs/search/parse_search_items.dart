// import 'package:spotify/spotify.dart';
// import 'package:spotify_lite/models/searchItem.dart';

// import '../../models/types.dart';

// List<SearchItem> parseSearchItems(List<Page<dynamic>> rawSearchItems) {
//   List<SearchItem> searchItems = [];
//   for (Page<dynamic> category in rawSearchItems) {
//     List categoryItems = category.items?.toList() ?? [];
//     searchItems.addAll(categoryItems.map((rawSearchItemList) {
//       var rawSearchItem = rawSearchItemList.items.first;
//       ItemType type =
//           rawSearchItem is Artist ? ItemType.Artists : ItemType.Albums;
//       return SearchItem(rawSearchItem.name, rawSearchItem.images?.first?.url,
//           rawSearchItem.id, type);
//     }).toList());
//   }

//   return searchItems;
// }
