import 'package:flutter/material.dart';
import 'package:spotify_lite/services/spotify_service.dart';

class Injector extends InheritedWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  final SpotifyService spotifyService = SpotifyService();

  Injector({
    Key? key,
    required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static Injector? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Injector>();
  }

  @override
  bool updateShouldNotify(Injector old) {
    return true;
  }
}
