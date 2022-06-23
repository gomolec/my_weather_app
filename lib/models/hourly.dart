import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'rain.dart';
import 'snow.dart';
import 'weather.dart';

class Hourly extends Equatable {
  final DateTime? dt;
  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final int? uvi;
  final int? clouds;
  final int? visibility;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final Rain? rain;
  final Snow? snow;
  final Weather weather;
  final double? pop;
  const Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.rain,
    required this.snow,
    required this.weather,
    required this.pop,
  });

  Hourly copyWith({
    DateTime? dt,
    double? temp,
    double? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    int? uvi,
    int? clouds,
    int? visibility,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    Rain? rain,
    Snow? snow,
    Weather? weather,
    double? pop,
  }) {
    return Hourly(
      dt: dt ?? this.dt,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      uvi: uvi ?? this.uvi,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
      weather: weather ?? this.weather,
      pop: pop ?? this.pop,
    );
  }

  factory Hourly.fromMap(Map<String, dynamic>? map, int offset) {
    return Hourly(
      dt: DateTime.fromMillisecondsSinceEpoch(
          (map?['dt']?.toInt() + offset) * 1000),
      temp: map?['temp']?.toDouble(),
      feelsLike: map?['feels_like']?.toDouble(),
      pressure: map?['pressure']?.toInt(),
      humidity: map?['humidity']?.toInt(),
      dewPoint: map?['dew_point']?.toDouble(),
      uvi: map?['uvi']?.toInt(),
      clouds: map?['clouds']?.toInt(),
      visibility: map?['visibility']?.toInt(),
      windSpeed: map?['wind_speed']?.toDouble(),
      windDeg: map?['wind_deg']?.toInt(),
      windGust: map?['wind_gust']?.toDouble(),
      rain: (map?['rain'] == null)
          ? (map?['rain'])
          : (Rain.fromMap(map?['rain'])),
      snow: (map?['snow'] == null)
          ? (map?['snow'])
          : (Snow.fromMap(map?['snow'])),
      weather: List<Weather>.from(
          map?['weather']?.map((x) => Weather.fromMap(x)))[0],
      pop: map?['pop']?.toDouble(),
    );
  }

  factory Hourly.fromJson(String source) =>
      Hourly.fromMap(json.decode(source), 0);

  @override
  String toString() {
    return 'Hourly(dt: $dt, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, dewPoint: $dewPoint, uvi: $uvi, clouds: $clouds, visibility: $visibility, windSpeed: $windSpeed, windDeg: $windDeg, windGust: $windGust, rain: $rain, snow: $snow, weather: $weather, pop: $pop)';
  }

  @override
  List<Object?> get props {
    return [
      dt,
      temp,
      feelsLike,
      pressure,
      humidity,
      dewPoint,
      uvi,
      clouds,
      visibility,
      windSpeed,
      windDeg,
      windGust,
      rain,
      snow,
      weather,
      pop,
    ];
  }
}
