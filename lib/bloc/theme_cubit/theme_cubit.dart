import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:my_weather_app/bloc/forecast_cubit/forecast_cubit.dart';
import 'package:my_weather_app/bloc/search_bloc/location_bloc.dart';
import 'package:my_weather_app/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final CustomTheme theme;
  final ForecastCubit forecastCubit;
  late final StreamSubscription forecastCubitSubscription;

  ThemeCubit({
    required this.theme,
    required this.forecastCubit,
  }) : super(ThemeState(theme.moon)) {
    forecastCubitSubscription = forecastCubit.stream.listen((event) {
      print("new event");
      if (event is ForecastLoaded) {
        int hour = event.forecast.current.dt!.hour;
        print(hour);
        if (hour >= 0 && hour < 8) {
          emit(ThemeState(theme.morning));
        } else if ((hour >= 8 && hour < 16)) {
          emit(ThemeState(theme.moon));
        } else {
          emit(ThemeState(theme.evening));
        }
      }
    });
  }
}
