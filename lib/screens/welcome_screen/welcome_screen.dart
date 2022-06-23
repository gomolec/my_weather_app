import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/search_bloc/location_bloc.dart';
import 'widgets/welcome_text.dart';

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
