import 'package:flutter/material.dart';
import 'package:weather_app/data/data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    Future<void> _getWeatherData(String city) async {
      WeatherService service = WeatherService();
      WeatherResponse response = await service.getWeather(city);
      debugPrint(response.tempInfo.temperature.toString());
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Choose your city'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type your city...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _getWeatherData(controller.text),
                child: const Text('CHOOSE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
