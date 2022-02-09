import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/models/current.dart';
import 'components/components.dart';

class DetailsPage extends StatelessWidget {
  final Current forecast;
  const DetailsPage({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32.0),
          DetailsMainText(
            feelsTemp: forecast.feelsLike ?? 0.0,
            sunrise:
                DateFormat('kk:mm').format(forecast.sunrise ?? DateTime.now()),
            sunset:
                DateFormat('kk:mm').format(forecast.sunset ?? DateTime.now()),
          ),
          const SizedBox(height: 16.0),
          DetailsTable(forecast: forecast),
        ],
      ),
    );
  }
}
