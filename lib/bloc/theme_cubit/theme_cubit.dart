import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:my_weather_app/bloc/forecast_cubit/forecast_cubit.dart';
import 'package:my_weather_app/theme.dart';

part 'theme_state.dart';

enum ThemeType {
  morning,
  noon,
  evening,
}

class ThemeCubit extends Cubit<ThemeState> {
  final CustomTheme theme;
  final ForecastCubit forecastCubit;
  late final StreamSubscription forecastCubitSubscription;

  ThemeCubit({
    required this.theme,
    required this.forecastCubit,
  }) : super(ThemeState(themeData: theme.noon, type: ThemeType.noon)) {
    forecastCubitSubscription = forecastCubit.stream.listen((event) {
      if (event is ForecastLoaded) {
        int hour = event.forecast.current.dt!.hour;
        if (hour >= 0 && hour < 10) {
          emit(ThemeState(themeData: theme.morning, type: ThemeType.morning));
        } else if (hour >= 10 && hour < 18) {
          emit(ThemeState(themeData: theme.noon, type: ThemeType.noon));
        } else {
          emit(ThemeState(themeData: theme.evening, type: ThemeType.evening));
        }
      }
    });
  }
}
