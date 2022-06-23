import 'package:flutter/material.dart';

import 'sun_custom_painter.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomSun(color: Theme.of(context).colorScheme.secondary),
      child: SizedBox(
        height: 310,
        width: 310,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Welcome to your Weather App",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
              softWrap: true,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Turn on location to receive the weather forecast for your city",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
              softWrap: true,
            ),
            const SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
