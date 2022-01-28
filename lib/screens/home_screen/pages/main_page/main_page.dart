import 'dart:math';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'components/components.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TimeButtons(
            timeAfter: '10:00',
            timeBefore: '18:00',
          ),
          const MainForecastText(
            weekDay: "monday",
            forecastText: "It's Sunny",
            temp: 24.3,
          ),
          Column(
            children: List.generate(
              6,
              (index) => Builder(
                builder: (context) {
                  Random random = Random();
                  double minTemp =
                      (random.nextInt(45) - 15) + random.nextDouble();
                  double maxTemp =
                      minTemp + random.nextInt(10) - random.nextDouble();
                  List<IconData> icons = [
                    LineAwesomeIcons.cloud_with_rain,
                    LineAwesomeIcons.sun,
                    LineAwesomeIcons.lightning_bolt
                  ];
                  return ForecastTableTile(
                    weekDay: "weekday ${index + 2}.",
                    icon: icons[random.nextInt(3)],
                    maxTemp: minTemp,
                    minTemp: maxTemp,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}
