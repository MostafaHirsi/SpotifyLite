import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/screens/introduction/authentication/authentication_modal.dart';
import 'package:spotify_lite/utils/assets.dart';

import '../../widgets/buttons/primary_button.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "IntroductionScreen";
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(
              flex: 6,
            ),
            buildLogo(),
            buildIntroText(context),
            const Spacer(
              flex: 4,
            ),
            PrimaryButton(
              label: 'Get started',
              onPress: () async {
                await showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return AuthenticationModal(
                      authenticationBloc: authenticationBloc,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLogo() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SvgPicture.asset(
        SvgAssets.spotifySmallLogo,
        color: Colors.white,
        width: 50,
      ),
    );
  }

  Widget buildIntroText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.headlineSmall,
          children: const [
            TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold),
              text: "Millions of songs.\n",
            ),
            TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold),
              text: "Free on Spotify.",
            ),
          ],
        ),
      ),
    );
  }
}
