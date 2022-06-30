import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/logic.dart';
import 'package:weather_app/presentation/presentation.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesBloc, CitiesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Weather'),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 6.0),
              child: CustomIconButton(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pushReplacementNamed(context, '/'),
              ),
            ),
            actions: [
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, searchState) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        context.read<CitiesBloc>().add(
                              AddCityEvent(city: searchState.cityName),
                            );
                        context.read<SearchCubit>().onChanged('');
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: const Text(
                        'ADD',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Type your city...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onChanged: (value) =>
                      context.read<SearchCubit>().onChanged(value),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cities.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Dismissible(
                      key: ObjectKey(state.cities[index].cityName),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) => context
                          .read<CitiesBloc>()
                          .add(RemoveCityEvent(index: index)),
                      background: Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                        ),
                      ),
                      child: CustomWeatherCard(response: state.cities[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
