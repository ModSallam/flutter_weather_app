import 'package:flutter/material.dart';
import 'package:weather_app/presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.dark,
        fontFamily: 'futura',
        scaffoldBackgroundColor: Colors.black,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
