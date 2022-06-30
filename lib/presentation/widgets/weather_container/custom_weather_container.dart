import 'package:flutter/material.dart';

class CustomWeatherContainer extends StatelessWidget {
  final String title;
  final String content;
  final String unit;

  const CustomWeatherContainer({
    Key? key,
    required this.title,
    required this.content,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          content,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          unit,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
