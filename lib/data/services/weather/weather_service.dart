import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WeatherService {
  Future<void> getWeater(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': 'b96b5677a01ba655a6a3761abceaf257',
    };

    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      queryParameters,
    );

    final response = await http.get(uri);

    debugPrint(response.body);
  }
}
