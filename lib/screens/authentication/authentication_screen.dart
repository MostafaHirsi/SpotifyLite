import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:spotify_lite/services/spotify_service.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            InAppWebView(
              onLoadStart: (controller, url) {
                if (url != null &&
                    url.toString().contains("http://localhost:8888/?")) {
                  SpotifyService spotifyService = new SpotifyService();
                  // await spotifyService.getUserAuthenticatedSpotifyApi(url);
                }
              },
              onLoadStop: (controller, url) {},
              onWebViewCreated: (controller) async {
                String url =
                    "https://accounts.spotify.com/authorize?client_id=7da524d167a54367b2c3affe05efb59a&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A8888";
                controller.loadUrl(
                    urlRequest: URLRequest(url: Uri.tryParse(url)));
              },
            )
          ],
        ),
      ),
    );
  }
}
