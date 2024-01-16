import 'package:flutter/material.dart';

class DetailsCart extends StatelessWidget {
  const DetailsCart({
    super.key,
    required this.time,
    required this.temp,
    required this.speed,
    required this.humidity,
    required this.pressure,
  });

  final String time;
  final String temp;
  final String speed;
  final String humidity;
  final String pressure;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$time h'),
        Text(temp),
        Text('$speed m/s'),
        Text('$humidity %'),
        Text('$pressure Pa'),
      ],
    );
  }
}
