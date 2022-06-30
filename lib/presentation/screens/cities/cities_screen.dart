import 'package:flutter/material.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/presentation/presentation.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  TextEditingController controller = TextEditingController();
  List<WeatherResponse> cities = [];

  Future<void> _getWeatherData(String city) async {
    WeatherService service = WeatherService();
    WeatherResponse response = await service.getWeather(city);
    debugPrint(response.cityName);
    setState(() => cities.add(response));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20.0),
            child: GestureDetector(
              onTap: () => _getWeatherData(controller.text),
              child: const Text(
                'ADD',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Type your city...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (BuildContext context, int index) =>
                    CustomWeatherCard(response: cities[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
