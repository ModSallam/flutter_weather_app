import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/data.dart';

class WeatherService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': 'b96b5677a01ba655a6a3761abceaf257',
      'units': 'metric',
    };

    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      queryParameters,
    );

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final WeatherResponse data = WeatherResponse.fromJson(json);

    return data;
  }
}
