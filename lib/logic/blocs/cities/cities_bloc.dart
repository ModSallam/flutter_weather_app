import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/data/data.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends HydratedBloc<CitiesEvent, CitiesState> {
  final WeatherRepository _weatherRepository;

  CitiesBloc({required WeatherRepository? weatherRepository})
      : _weatherRepository = weatherRepository ?? WeatherRepository(),
        super(const CitiesState(cities: [])) {
    on<AddCityEvent>(_onAddCityEvent);
    on<RemoveCityEvent>(_onRemoveCityEvent);
  }

  void _onRemoveCityEvent(RemoveCityEvent event, Emitter<CitiesState> emit) {
    emit(
      CitiesState(
        cities: state.cities..removeAt(event.index),
      ),
    );
  }

  Future<void> _onAddCityEvent(
      AddCityEvent event, Emitter<CitiesState> emit) async {
    final WeatherResponse city =
        await _weatherRepository.getWeather(event.city);
    emit(
      CitiesState(
        cities: state.cities..add(city),
      ),
    );
  }

  @override
  CitiesState? fromJson(Map<String, dynamic> json) {
    return CitiesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CitiesState state) {
    return state.toMap();
  }
}
