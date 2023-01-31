import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/widgets/buttons/circle_icon_button.dart';

class AuthenticationModal extends StatelessWidget {
  final AuthenticationBloc authenticationBloc;
  const AuthenticationModal({super.key, required this.authenticationBloc});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [buildInAppWebView(context), buildCloseButton(context)],
    );
  }

  Widget buildCloseButton(BuildContext context) {
    return Positioned(
      right: 0,
      top: 10,
      child: CircleIconButton(
        icon: Icons.close,
        onPress: () => Navigator.pop(context),
      ),
    );
  }

  Widget buildInAppWebView(context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: InAppWebView(
        onLoadStart: (controller, url) {
          if (url != null &&
              url.toString().contains("http://localhost:8888/?")) {
            authenticationBloc.add(RetrieveAccessTokenEvent(url));
          }
        },
        onLoadStop: (controller, url) {},
        onWebViewCreated: (controller) async {
          String url =
              "https://accounts.spotify.com/authorize?client_id=7da524d167a54367b2c3affe05efb59a&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A8888";
          controller.loadUrl(urlRequest: URLRequest(url: Uri.tryParse(url)));
        },
      ),
    );
  }
}
