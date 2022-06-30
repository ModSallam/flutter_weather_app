class WeatherResponse {
  final String cityName;
  final double windSpeed;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'http://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({
    required this.cityName,
    required this.windSpeed,
    required this.tempInfo,
    required this.weatherInfo,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      cityName: json['name'],
      windSpeed: json['wind']['speed'],
      tempInfo: TemperatureInfo.fromJson(json['main']),
      weatherInfo: WeatherInfo.fromJson(json['weather'][0]),
    );
  }
}

class TemperatureInfo {
  final double temperature;
  final int humidity;

  TemperatureInfo({required this.temperature, required this.humidity});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    return TemperatureInfo(
        temperature: json['temp'], humidity: json['humidity']);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(description: json['description'], icon: json['icon']);
  }
}
