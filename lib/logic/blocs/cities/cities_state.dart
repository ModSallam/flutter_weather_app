part of 'cities_bloc.dart';

class CitiesState extends Equatable {
  final List<WeatherResponse> cities;

  const CitiesState({this.cities = const <WeatherResponse>[]});

  @override
  List<Object> get props => [cities];

  CitiesState copyWith({
    List<WeatherResponse>? cities,
  }) {
    return CitiesState(
      cities: cities ?? this.cities,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cities': cities.map((x) => x.toMap()).toList()});

    return result;
  }

  factory CitiesState.fromMap(Map<String, dynamic> map) {
    return CitiesState(
      cities: List<WeatherResponse>.from(
          map['cities']?.map((x) => WeatherResponse.fromMap(x))),
    );
  }
}
