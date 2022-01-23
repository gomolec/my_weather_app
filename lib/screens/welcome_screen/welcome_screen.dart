import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/bloc/search_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9A8A1),
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
                        .read<SearchBloc>()
                        .add(const SearchGeolocationStarted());
                  },
                  child: const Text(
                    'Turn on Location',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3C3A3A),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      color: Color(0xFF3C3A3A),
                      width: 3.0,
                    ),
                    fixedSize: const Size(200, 48),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search_screen');
                  },
                  child: const Text(
                    'Select a city',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3C3A3A),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    fixedSize: const Size(200, 48),
                  ),
                ),
              ],
            ),
          )
        ],
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
      painter: CustomSun(color: const Color(0xFFE0ACA3)),
      child: SizedBox(
        height: 310,
        width: 310,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "Welcome to your Weather App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3C3A3A),
              ),
              softWrap: true,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Turn on location to receive the weather forecast for your city",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3C3A3A),
              ),
              softWrap: true,
            ),
            SizedBox(
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
