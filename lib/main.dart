import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/bloc/bloc/search_bloc.dart';
import 'package:my_weather_app/repositories/location_repository.dart';
import 'package:my_weather_app/screens/search_screen/search_screen.dart';
import 'package:my_weather_app/screens/welcome_screen/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationRepository locationRepository = LocationRepository();
    return BlocProvider(
      create: (context) => SearchBloc(locationRepository),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.workSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/search_screen': (context) => const SearchScreen(),
        },
        title: 'Weather App',
      ),
    );
  }
}
