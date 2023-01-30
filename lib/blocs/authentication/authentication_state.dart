part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class RetrieveAccessTokenSuccess extends AuthenticationState {
  final SpotifyApi spotifyApi;

  RetrieveAccessTokenSuccess(this.spotifyApi);
}
