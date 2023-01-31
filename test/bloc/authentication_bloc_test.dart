import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/models/authentication.dart';
import 'package:spotify_lite/services/spotify_service.dart';

import 'authentication_bloc.mocks.dart';

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
  when(
    mockSpotifyService.getUserAuthenticatedSpotifyApi(
      Uri.parse('example_redirect_url'),
    ),
  ).thenAnswer((_) async => successAuthenticationModel);

  group('AuthenticationBloc', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      "Empty State",
      build: () => AuthenticationBloc(mockSpotifyService),
      expect: () => [],
    );
    blocTest<AuthenticationBloc, AuthenticationState>(
      "RetrieveAccessTokenEvent",
      build: () => AuthenticationBloc(mockSpotifyService),
      act: (bloc) => bloc.add(
        RetrieveAccessTokenEvent(Uri.parse('example_redirect_url')),
      ),
      expect: () => [RetrieveAccessTokenSuccess(successAuthenticationModel)],
    );
  });
}
