part of 'cities_bloc.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

class AddCityEvent extends CitiesEvent {
  final String city;

  const AddCityEvent({required this.city});

  @override
  List<Object> get props => [city];
}

class RemoveCityEvent extends CitiesEvent {
  final int index;

  const RemoveCityEvent({required this.index});

  @override
  List<Object> get props => [index];
}
