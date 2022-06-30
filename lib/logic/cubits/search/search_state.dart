part of 'search_cubit.dart';

class SearchState extends Equatable {
  final String cityName;

  const SearchState({required this.cityName});

  @override
  List<Object> get props => [cityName];
}

class SearchInitial extends SearchState {
  const SearchInitial({required super.cityName});
}
