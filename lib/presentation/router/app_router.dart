import 'package:flutter/material.dart';
import 'package:weather_app/presentation/presentation.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('The Route is: ${settings.name}');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
        case '/search':
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
