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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cityName': cityName});
    result.addAll({'windSpeed': windSpeed});
    result.addAll({'tempInfo': tempInfo.toMap()});
    result.addAll({'weatherInfo': weatherInfo.toMap()});

    return result;
  }

  factory WeatherResponse.fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
      cityName: map['cityName'] ?? '',
      windSpeed: map['windSpeed']?.toDouble() ?? 0.0,
      tempInfo: TemperatureInfo.fromMap(map['tempInfo']),
      weatherInfo: WeatherInfo.fromMap(map['weatherInfo']),
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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'temperature': temperature});
    result.addAll({'humidity': humidity});

    return result;
  }

  factory TemperatureInfo.fromMap(Map<String, dynamic> map) {
    return TemperatureInfo(
      temperature: map['temperature']?.toDouble() ?? 0.0,
      humidity: map['humidity']?.toInt() ?? 0,
    );
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(description: json['description'], icon: json['icon']);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'description': description});
    result.addAll({'icon': icon});

    return result;
  }

  factory WeatherInfo.fromMap(Map<String, dynamic> map) {
    return WeatherInfo(
      description: map['description'] ?? '',
      icon: map['icon'] ?? '',
    );
  }
}
