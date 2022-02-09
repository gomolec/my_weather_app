import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_weather_app/models/current.dart';
import 'dart:math' as math;
import 'details_table_tile.dart';

class DetailsTable extends StatelessWidget {
  final Current forecast;
  const DetailsTable({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const DetailsTableTile(
        //   leadingIcon: LineAwesomeIcons.thermometer_full,
        //   title: "High/Low",
        //   value: "2°/-5°",
        // ),
        DetailsTableTile(
          leadingIcon: LineAwesomeIcons.wind,
          title: "Wind",
          optionalWidget: Transform.rotate(
            angle: forecast.windDeg! * (math.pi / 180),
            child: const Icon(
              LineAwesomeIcons.location_arrow,
              size: 20.0,
            ),
          ),
          value: "${forecast.windSpeed.toString()} km/h",
        ),
        DetailsTableTile(
          leadingIcon: LineAwesomeIcons.water,
          title: "Humidity",
          value: "${forecast.humidity.toString()}%",
        ),
        DetailsTableTile(
          leadingIcon: LineAwesomeIcons.tint,
          title: "Dew Point",
          value: "${forecast.dewPoint!.round().toString()}°",
        ),
        DetailsTableTile(
          leadingIcon: LineAwesomeIcons.alternate_compress_arrows,
          title: "Pressure",
          optionalWidget: (forecast.pressure! >= 1000)
              ? const Icon(LineAwesomeIcons.arrow_up, size: 20.0)
              : const Icon(LineAwesomeIcons.arrow_down, size: 20.0),
          value: "${forecast.pressure.toString()} mb",
        ),
        DetailsTableTile(
          leadingIcon: LineAwesomeIcons.sun,
          title: "UV Index",
          value: "${forecast.uvi.toString()} of 10",
        ),
        DetailsTableTile(
          leadingIcon: LineAwesomeIcons.eye,
          title: "Visibility",
          value: "${forecast.visibility.toString()} km",
        ),
        // const DetailsTableTile(
        //   leadingIcon: LineAwesomeIcons.moon,
        //   title: "Moon Phase",
        //   value: "Waxing Crescent",
        // ),
      ],
    );
  }
}
