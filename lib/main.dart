import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/logic/logic.dart';
import 'package:weather_app/presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  final WeatherRepository weatherRepository = WeatherRepository();
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(weatherRepository: weatherRepository)),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const MyApp({Key? key, required this.weatherRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CitiesBloc(weatherRepository: weatherRepository),
          ),
          BlocProvider(
            create: (context) => OnboardingCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            brightness: Brightness.dark,
            fontFamily: 'futura',
            scaffoldBackgroundColor: Colors.black,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
