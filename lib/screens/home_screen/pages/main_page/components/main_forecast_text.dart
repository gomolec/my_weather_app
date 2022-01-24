import 'package:flutter/material.dart';
import 'package:my_weather_app/extensions.dart';

class MainForecastText extends StatelessWidget {
  final String weekDay;
  final String forecastText;
  final double temp;

  const MainForecastText({
    Key? key,
    required this.weekDay,
    required this.forecastText,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        children: [
          Text(
            "${weekDay.capitalize()}. ${forecastText.capitalize()}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "${temp.round()}°",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 120,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
