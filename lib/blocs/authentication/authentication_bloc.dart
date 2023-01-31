import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spotify_lite/models/authentication.dart';
import 'package:spotify_lite/services/spotify_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SpotifyService spotifyService;
  AuthenticationBloc(this.spotifyService) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      try {
        if (event is RetrieveAccessTokenEvent) {
          AuthenticationModel authenticationModel = await spotifyService
              .getUserAuthenticatedSpotifyApi(event.redirectUrl);
          if (authenticationModel != null) {
            emit(RetrieveAccessTokenSuccess(authenticationModel));
          }
        }
      } on Exception catch (e) {
        emit(AuthenticationError(e.toString()));
      }
    });
  }
}
