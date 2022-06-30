import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/presentation/presentation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherService service = WeatherService();
  late WeatherResponse response;
  late WeatherResponse response1;
  int currentIndex = 0;
  bool loading = true;

  Future<void> getWeatherData() async {
    response = await WeatherService().getWeather('Cairo');
    response1 = await WeatherService().getWeather('paris');
    setState(() => loading = false);
  }

  _onRefresh() {
    setState(() => loading = true);
    getWeatherData();
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator.adaptive(),
                    SizedBox(height: 10.0),
                    Text(
                      'Loading',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : DefaultTabController(
            length: 2,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 55.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          child: const Icon(Icons.search, size: 30),
                          onTap: () {},
                        ),
                        CustomIconButton(
                          onTap: _onRefresh,
                          child: const Icon(Icons.refresh, size: 30),
                        ),
                        CustomIconButton(
                          child: SvgPicture.asset(
                            'assets/menu.svg',
                            width: 30,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 36.0),
                      child: Row(
                        children: [
                          currentIndex == 0
                              ? const CustomDotIndicator(active: true)
                              : const CustomDotIndicator(active: false),
                          currentIndex == 1
                              ? const CustomDotIndicator(active: true)
                              : const CustomDotIndicator(active: false),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        onPageChanged: (index) =>
                            setState(() => currentIndex = index),
                        children: [
                          CustomPageViewContainer(
                            weatherResponse: response,
                          ),
                          CustomPageViewContainer(
                            weatherResponse: response1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
