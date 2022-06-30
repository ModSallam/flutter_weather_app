import 'package:flutter/material.dart';
import 'package:weather_app/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService service = WeatherService();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Enter Your City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                service.getWeater(controller.text);
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
