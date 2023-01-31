import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_lite/utils/assets.dart';

import '../../widgets/buttons/primary_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(
              flex: 6,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: SvgPicture.asset(
                SvgAssets.spotifySmallLogo,
                color: Colors.white,
                width: 50,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleLarge,
                  children: [
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
            ),
            const Spacer(
              flex: 4,
            ),
            const PrimaryButton(
              label: 'Get started',
            ),
          ],
        ),
      ),
    );
  }
}
