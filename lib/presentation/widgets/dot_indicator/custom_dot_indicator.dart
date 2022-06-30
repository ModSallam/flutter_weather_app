import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  final bool active;

  const CustomDotIndicator({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: active ? 20 : 6,
      height: 4,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}