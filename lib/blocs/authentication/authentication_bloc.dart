import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_lite/services/spotify_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SpotifyService spotifyService;
  AuthenticationBloc(this.spotifyService) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is RetrieveAccessTokenEvent) {
        SpotifyApi? spotifyApi = await spotifyService
            .getUserAuthenticatedSpotifyApi(event.redirectUrl);
        if (spotifyApi != null) {
          emit(RetrieveAccessTokenSuccess(spotifyApi));
        }
      }
    });
  }
}
