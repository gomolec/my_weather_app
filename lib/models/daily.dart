import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'feels__like.dart';
import 'temp.dart';
import 'weather.dart';

class Daily extends Equatable {
  final DateTime? dt;
  final DateTime? sunrise;
  final DateTime? sunset;
  final DateTime? moonrise;
  final DateTime? moonset;
  final double? moonPhase;
  final Temp temp;
  final FeelsLike feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final Weather weather;
  final int? clouds;
  final double? pop;
  final double? rain;
  final double? snow;
  final double? uvi;
  const Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.snow,
    required this.uvi,
  });

  Daily copyWith({
    DateTime? dt,
    DateTime? sunrise,
    DateTime? sunset,
    DateTime? moonrise,
    DateTime? moonset,
    double? moonPhase,
    Temp? temp,
    FeelsLike? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    Weather? weather,
    int? clouds,
    double? pop,
    double? rain,
    double? snow,
    double? uvi,
  }) {
    return Daily(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moonPhase: moonPhase ?? this.moonPhase,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
      uvi: uvi ?? this.uvi,
    );
  }

  factory Daily.fromMap(Map<String, dynamic>? map, int offset) {
    return Daily(
      dt: DateTime.fromMillisecondsSinceEpoch(
          (map?['dt']?.toInt() + offset) * 1000),
      sunrise: DateTime.fromMillisecondsSinceEpoch(
          (map?['sunrise']?.toInt() + offset) * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(
          (map?['sunset']?.toInt() + offset) * 1000),
      moonrise: DateTime.fromMillisecondsSinceEpoch(
          (map?['moonrise']?.toInt() + offset) * 1000),
      moonset: DateTime.fromMillisecondsSinceEpoch(
          (map?['moonset']?.toInt() + offset) * 1000),
      moonPhase: map?['moon_phase']?.toDouble(),
      temp: Temp.fromMap(map?['temp']),
      feelsLike: FeelsLike.fromMap(map?['feels_like']),
      pressure: map?['pressure']?.toInt(),
      humidity: map?['humidity']?.toInt(),
      dewPoint: map?['dew_point']?.toDouble(),
      windSpeed: map?['wind_speed']?.toDouble(),
      windDeg: map?['wind_deg']?.toInt(),
      windGust: map?['wind_gust']?.toDouble(),
      weather: List<Weather>.from(
          map?['weather']?.map((x) => Weather.fromMap(x)))[0],
      clouds: map?['clouds']?.toInt(),
      pop: map?['pop']?.toDouble(),
      rain: map?['rain']?.toDouble(),
      snow: map?['snow']?.toDouble(),
      uvi: map?['uvi']?.toDouble(),
    );
  }

  factory Daily.fromJson(String source) =>
      Daily.fromMap(json.decode(source), 0);

  @override
  String toString() {
    return 'Daily(dt: $dt, sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moonPhase: $moonPhase, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, dewPoint: $dewPoint, windSpeed: $windSpeed, windDeg: $windDeg, windGust: $windGust, weather: $weather, clouds: $clouds, pop: $pop, rain: $rain, snow: $snow, uvi: $uvi)';
  }

  @override
  List<Object?> get props {
    return [
      dt,
      sunrise,
      sunset,
      moonrise,
      moonset,
      moonPhase,
      temp,
      feelsLike,
      pressure,
      humidity,
      dewPoint,
      windSpeed,
      windDeg,
      windGust,
      weather,
      clouds,
      pop,
      rain,
      snow,
      uvi,
    ];
  }
}
