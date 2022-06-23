import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/search_bloc/location_bloc.dart';
import 'package:my_weather_app/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is LocationLoaded) {
          Navigator.pushReplacementNamed(context, '/home_screen');
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(96),
        //   child: AppBar(
        //     systemOverlayStyle:
        //         const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        //     backgroundColor: Colors.transparent,
        //     elevation: 0,
        //   ),
        // ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: const WelcomeText(),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      context
                          .read<LocationBloc>()
                          .add(const GeolocationStarted());
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        color: Color(0xFF3C3A3A),
                        width: 3.0,
                      ),
                      fixedSize: const Size(200, 48),
                    ),
                    child: Text(
                      'Turn on Location',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search_screen');
                    },
                    style: TextButton.styleFrom(
                      fixedSize: const Size(200, 48),
                    ),
                    child: Text(
                      'Select a city',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

class CustomSun extends CustomPainter {
  final Color color;

  CustomSun({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final LinearGradient gradient = LinearGradient(
      colors: <Color>[color, const Color(0x00E0ACA3)],
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(0.0, 0.4),
    );
    final Offset offset = Offset(size.height / 2, size.width / 2);
    final double radius = size.height / 2;
    canvas.drawCircle(
      offset,
      radius,
      Paint()
        ..shader = gradient.createShader(
          Rect.fromCircle(
            center: offset,
            radius: radius,
          ),
        ),
    );
  }

  @override
  bool shouldRepaint(CustomSun oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(CustomSun oldDelegate) => false;
}
