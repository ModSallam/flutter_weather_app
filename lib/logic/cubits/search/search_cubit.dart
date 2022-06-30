import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchInitial(cityName: ''));

  void onChanged(String cityName) {
    emit(SearchState(cityName: cityName));
  }
}
