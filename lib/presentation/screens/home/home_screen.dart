import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/logic/logic.dart';
import 'package:weather_app/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesBloc, CitiesState>(
      builder: (context, state) {
        return DefaultTabController(
          length: state.cities.length,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: const Text(
                'FIRE WEATHER',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 6.0),
                  child: CustomIconButton(
                    child: SvgPicture.asset(
                      'assets/menu.svg',
                      width: 30,
                      color: Colors.white,
                    ),
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/cities'),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: state.cities.isEmpty
                    ? const Center(
                        child: Text(
                        'Oops! No Cities yet, Please choose your favorite city.',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                        textAlign: TextAlign.center,
                      ))
                    : Column(
                        children: [
                          BlocBuilder<OnboardingCubit, OnboardingState>(
                            builder: (context, onboardingState) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 36.0),
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      state.cities.length,
                                      (index) => CustomDotIndicator(
                                        active: index == onboardingState.index
                                            ? true
                                            : false,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: PageView(
                              onPageChanged: (index) => context
                                  .read<OnboardingCubit>()
                                  .onPageChanged(index),
                              children: [
                                ...List.generate(
                                  state.cities.length,
                                  (index) => CustomPageViewContainer(
                                    weatherResponse: state.cities[index],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
