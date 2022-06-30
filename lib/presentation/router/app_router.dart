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
        case '/cities':
        return MaterialPageRoute(
          builder: (context) => const CitiesScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
