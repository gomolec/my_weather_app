import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DetailsMainText extends StatelessWidget {
  final double feelsTemp;
  final String sunrise;
  final String sunset;

  const DetailsMainText({
    Key? key,
    required this.feelsTemp,
    required this.sunrise,
    required this.sunset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Details for Today:",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${feelsTemp.round()}°",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 52),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Feels Like",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Sunrise/Sunset",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(
                        LineAwesomeIcons.chevron_circle_up,
                        size: 24.0,
                      ),
                      Text(
                        sunrise,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(width: 16.0),
                      const Icon(
                        LineAwesomeIcons.chevron_circle_down,
                        size: 24.0,
                      ),
                      Text(
                        sunset,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
