import 'dart:math';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'components/components.dart';

class HourlyPage extends StatelessWidget {
  const HourlyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Hourly Forecast:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            children: List.generate(
              24,
              (index) => Builder(
                builder: (context) {
                  Random random = Random();
                  double temp = (random.nextInt(45) - 15) + random.nextDouble();
                  int humidity = random.nextInt(100);
                  List<IconData> icons = [
                    LineAwesomeIcons.cloud_with_rain,
                    LineAwesomeIcons.sun,
                    LineAwesomeIcons.lightning_bolt
                  ];
                  return HourlyListTile(
                    time: (index == 0) ? "Now" : "$index:00",
                    temp: temp,
                    icon: icons[random.nextInt(3)],
                    humidity: humidity,
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
