import 'package:flutter/material.dart';
import 'package:tringconnect/controller/HomeScreen.dart';
import 'package:tringconnect/controller/MediaViewer.dart';

import 'app-constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.HOME:
        return MaterialPageRoute(builder: (_) => const HomeScreen(title: "Home"),settings: settings);
      case RoutePaths.MEDIA_VIEWER:
        return MaterialPageRoute(builder: (_) => const MediaViewer(),settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}