import 'dart:io';

import 'package:spotify/spotify.dart';
import 'package:spotify_lite/models/authentication.dart';

class SpotifyService {
  final String clientId = "7da524d167a54367b2c3affe05efb59a";
  final String clientSecret = "3e337cef22064758b44c3286f9ec33dc";
  Future<AuthenticationModel> getUserAuthenticatedSpotifyApi(
      Uri redirectUrl) async {
    SpotifyApiCredentials credentials =
        SpotifyApiCredentials(clientId, clientSecret);

    var grant = SpotifyApi.authorizationCodeGrant(credentials);
    var authUri = grant.getAuthorizationUrl(Uri.parse("http://localhost:8888"));

    var client =
        await grant.handleAuthorizationResponse(redirectUrl.queryParameters);
    var newClient = SpotifyApi.fromClient(client);
    AuthenticationModel authenticationModel = AuthenticationModel(
        client.credentials.accessToken,
        client.credentials.refreshToken,
        client.credentials.expiration);
    return authenticationModel;
  }
}
