import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/blocs/search/search_bloc.dart';
import 'package:spotify_lite/models/authentication.dart';
import 'package:spotify_lite/models/spotify/album.dart';
import 'package:spotify_lite/models/spotify/artist.dart';
import 'package:spotify_lite/models/spotify/image.dart';
import 'package:spotify_lite/models/spotify/item.dart';
import 'package:spotify_lite/models/spotify/search_result.dart';
import 'package:spotify_lite/services/spotify_service.dart';

import 'search_bloc_test.mocks.dart';

@GenerateMocks([SpotifyService])
void main() {
  final MockSpotifyService mockSpotifyService = new MockSpotifyService();
  final AuthenticationModel successAuthenticationModel = AuthenticationModel(
    "ACCESS_TOKEN",
    "REFRESH_ACCESS_TOKEN",
    DateTime.now().add(
      const Duration(hours: 3),
    ),
  );
  Image sampleImage = Image(200, 200, 'image.jpeg');
  List<Item> artistItems = [
    Item('001', "Hello There", [sampleImage]),
  ];
  List<Item> albumItems = [
    Item('002', "Hello You", [sampleImage]),
  ];
  Album albums = Album(albumItems);
  Artist artists = Artist(artistItems);
  SearchResult searchResult = SearchResult(albums, artists);
  when(
    mockSpotifyService.searchItems(successAuthenticationModel, "abba"),
  ).thenAnswer((_) async => searchResult);

  group('SearchBloc', () {
    blocTest<SearchBloc, SearchState>(
      "Empty State",
      build: () => SearchBloc(mockSpotifyService),
      expect: () => [],
    );
    blocTest<SearchBloc, SearchState>(
      "CommitSearchEvent",
      build: () => SearchBloc(mockSpotifyService),
      act: (bloc) =>
          bloc.add(CommitSearchEvent("abba", successAuthenticationModel)),
      expect: () => [SearchSuccess(searchResult)],
    );
  });
}
