import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/extensions.dart';
import 'package:my_weather_app/models/hourly.dart';
import 'components/components.dart';

class HourlyPage extends StatelessWidget {
  final List<Hourly> forecast;
  const HourlyPage({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Hourly Forecast:",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Column(
            children: List.generate(
              24,
              (index) => Builder(
                builder: (context) {
                  Hourly hourly = forecast[index];
                  return HourlyListTile(
                    time: (index == 0)
                        ? "Now"
                        : DateFormat('kk:mm')
                            .format(hourly.dt ?? DateTime.now()),
                    temp: hourly.temp ?? 0.0,
                    icon: getIcon(hourly.weather.icon ?? ""),
                    humidity: hourly.humidity ?? 0,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
