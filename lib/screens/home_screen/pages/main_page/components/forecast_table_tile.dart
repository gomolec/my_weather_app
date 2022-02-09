import 'package:flutter/material.dart';
import 'package:my_weather_app/extensions.dart';

class ForecastTableTile extends StatelessWidget {
  final String weekDay;
  final IconData icon;
  final double maxTemp;
  final double minTemp;

  const ForecastTableTile({
    Key? key,
    required this.weekDay,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              weekDay.capitalize(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Icon(
            icon,
            size: 24.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 32.0,
                  child: Text(
                    "${maxTemp.round()}°",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                SizedBox(
                  width: 32.0,
                  child: Text(
                    "${minTemp.round()}°",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
