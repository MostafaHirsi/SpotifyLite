import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_lite/models/authentication.dart';
import 'package:spotify_lite/models/spotify/search_result.dart';
import 'package:spotify_lite/services/spotify_service.dart';
import 'package:spotify_lite/services/spotify_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SpotifyService spotifyService;
  SearchBloc(this.spotifyService) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      try {
        if (event is CommitSearchEvent) {
          SearchResult searchResult = await spotifyService.searchItems(
              event.authenticationModel, event.searchTerms);
          emit(SearchSuccess(searchResult));
        }
      } on Exception catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
