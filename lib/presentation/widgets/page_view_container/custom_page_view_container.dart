import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/presentation/presentation.dart';

class CustomPageViewContainer extends StatelessWidget {
  final WeatherResponse weatherResponse;

  const CustomPageViewContainer({
    Key? key,
    required this.weatherResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weatherResponse.cityName,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${DateFormat.jm().format(DateTime.now())} - ${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                '${weatherResponse.tempInfo.temperature}°',
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.cloud,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    weatherResponse.weatherInfo.description,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
        Column(
          children: [
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomWeatherContainer(
                  title: 'Wind',
                  content: '${weatherResponse.windSpeed}',
                  unit: 'km/h',
                ),
                CustomWeatherContainer(
                  title: 'Humidity',
                  content: '${weatherResponse.tempInfo.humidity}',
                  unit: '%',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
