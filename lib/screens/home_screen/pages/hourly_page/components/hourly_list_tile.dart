import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HourlyListTile extends StatelessWidget {
  final String time;
  final double temp;
  final IconData icon;
  final int humidity;

  const HourlyListTile({
    Key? key,
    required this.time,
    required this.temp,
    required this.icon,
    required this.humidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      time,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "${temp.round()}°",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Icon(
                      icon,
                      size: 48.0,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Icon(
                        LineAwesomeIcons.water,
                        size: 24.0,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          "$humidity%",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
