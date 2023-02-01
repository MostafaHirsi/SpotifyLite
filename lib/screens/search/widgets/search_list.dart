import 'package:flutter/material.dart';
import 'package:spotify_lite/models/spotify/item.dart';
import 'package:spotify_lite/models/spotify/search_result.dart';
import 'package:spotify_lite/models/spotify/image.dart' as model;
import 'package:spotify_lite/utils/string.dart';

class SearchList extends StatelessWidget {
  final List<Item> items;
  const SearchList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 22,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        Item searchItem = items[index];
        return Column(
          children: [
            ListTile(
              iconColor: Colors.white,
              leading: buildImage(searchItem),
              dense: true,
              horizontalTitleGap: 14,
              subtitle: Text(
                searchItem.type.capitalize(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              title: Text(
                searchItem.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),
            const Divider(
              color: Color(0xFF535353),
            )
          ],
        );
      },
    );
  }

  Widget buildImage(Item searchItem) {
    List<model.Image> images = searchItem.images;
    bool hasImage = searchItem.images.isNotEmpty;
    return SizedBox(
      height: 50,
      width: 50,
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: hasImage
            ? AspectRatio(
                aspectRatio: searchItem.images.first.height.toDouble() /
                    searchItem.images.first.width.toDouble(),
                child: Image.network(
                  searchItem.images.first.url,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(
                Icons.music_note,
              ),
      ),
    );
  }
}
