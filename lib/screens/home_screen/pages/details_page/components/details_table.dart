import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:math' as math;
import 'details_table_tile.dart';

class DetailsTable extends StatelessWidget {
  const DetailsTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DetailsTableTile(
          leadingIcon: LineAwesomeIcons.thermometer_full,
          title: "High/Low",
          value: "2°/-5°",
        ),
        DetailsTableTile(
          leadingIcon: LineAwesomeIcons.wind,
          title: "Wind",
          optionalWidget: Transform.rotate(
            angle: 45 * (math.pi / 180),
            child: const Icon(
              LineAwesomeIcons.location_arrow,
              size: 20.0,
            ),
          ),
          value: "5 km/h",
        ),
        const DetailsTableTile(
          leadingIcon: LineAwesomeIcons.water,
          title: "Humidity",
          value: "88%",
        ),
        const DetailsTableTile(
          leadingIcon: LineAwesomeIcons.tint,
          title: "Dew Point",
          value: "-3°",
        ),
        const DetailsTableTile(
          leadingIcon: LineAwesomeIcons.alternate_compress_arrows,
          title: "Pressure",
          optionalWidget: (false == true)
              ? Icon(LineAwesomeIcons.arrow_up, size: 20.0)
              : Icon(LineAwesomeIcons.arrow_down, size: 20.0),
          value: "1006.1 mb",
        ),
        const DetailsTableTile(
          leadingIcon: LineAwesomeIcons.sun,
          title: "UV Index",
          value: "0 of 10",
        ),
        const DetailsTableTile(
          leadingIcon: LineAwesomeIcons.eye,
          title: "Visibility",
          value: "4.67 km",
        ),
        const DetailsTableTile(
          leadingIcon: LineAwesomeIcons.moon,
          title: "Moon Phase",
          value: "Waxing Crescent",
        ),
      ],
    );
  }
}
