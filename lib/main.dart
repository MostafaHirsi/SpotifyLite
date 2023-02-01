import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/blocs/authentication/authentication_bloc.dart';
import 'package:spotify_lite/blocs/search/search_bloc.dart';
import 'package:spotify_lite/services/spotify_service.dart';
import 'package:spotify_lite/screens/introduction/introduction_screen.dart';
import 'package:spotify_lite/screens/search/search_screen.dart';
import 'package:injector/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Injector.appInstance
      .registerDependency<SpotifyService>(() => SpotifyService());
  Injector.appInstance.registerDependency<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SpotifyService spotifyService;
  late GlobalKey<NavigatorState> navigatorKey;
  late AuthenticationBloc authenticationBloc;
  late SearchBloc searchBloc;
  @override
  void initState() {
    super.initState();
    spotifyService = Injector.appInstance.get<SpotifyService>();
    navigatorKey = Injector.appInstance.get<GlobalKey<NavigatorState>>();
    authenticationBloc = AuthenticationBloc(spotifyService);
    searchBloc = SearchBloc(spotifyService);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return authenticationBloc;
          },
        ),
        BlocProvider<SearchBloc>(
          create: (context) {
            return searchBloc;
          },
        ),
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          if (state is RetrieveAccessTokenSuccess) {
            await navigatorKey.currentState?.pushNamedAndRemoveUntil(
              SearchScreen.routeName,
              ModalRoute.withName(
                IntroductionScreen.routeName,
              ),
            );
          }
          await navigatorKey.currentState
              ?.pushNamed(IntroductionScreen.routeName);
        },
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xFF1ed760),
              onPrimary: Color(0xFF1ed760),
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
                  Color(0xFF1ed760),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                ),
              ),
            ),
          ),
          routes: {
            '/': (context) =>
                authenticationBloc.state is RetrieveAccessTokenSuccess
                    ? SearchScreen()
                    : IntroductionScreen(),
            IntroductionScreen.routeName: (context) => IntroductionScreen(),
            SearchScreen.routeName: (context) => SearchScreen(),
          },
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case SearchScreen.routeName:
                return PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      SearchScreen(),
                );
              case IntroductionScreen.routeName:
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
