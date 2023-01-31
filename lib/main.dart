import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/screens/introduction/introduction_screen.dart';
import 'package:spotify_lite/services/spotify_service.dart';
import 'package:injector/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Injector.appInstance
      .registerDependency<SpotifyService>(() => SpotifyService());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SpotifyService spotifyService = Injector.appInstance.get<SpotifyService>();

    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF1DB954),
          onPrimary: Color(0xFF1DB954),
          secondary: Color(0xFF191414),
          onSecondary: Color(0xFF191414),
          error: Colors.white,
          onError: Colors.white,
          background: Color(0xFF191414),
          onBackground: Color(0xFF191414),
          surface: Color(0xFF535353),
          onSurface: Color(0xFF535353),
          secondaryContainer: Colors.white,
          onSecondaryContainer: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color(0xFF121212),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            ),
            backgroundColor: const MaterialStatePropertyAll(
              Color(0xFF1DB954),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0),
              ),
            ),
          ),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc(spotifyService);
            },
          ),
        ],
        child: const IntroductionScreen(),
      ),
    );
  }
}
