import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'rain.dart';
import 'snow.dart';
import 'weather.dart';

class Current extends Equatable {
  final DateTime? dt; //current time
  final DateTime? sunrise;
  final DateTime? sunset;
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
  final Weather weather;
  final Rain? rain;
  final Snow? snow; //optional
  const Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
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
    required this.weather,
    required this.rain,
    required this.snow,
  });

  Current copyWith({
    DateTime? dt,
    DateTime? sunrise,
    DateTime? sunset,
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
    Weather? weather,
    Rain? rain,
    Snow? snow,
  }) {
    return Current(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
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
      weather: weather ?? this.weather,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
    );
  }

  factory Current.fromMap(Map<String, dynamic>? map) {
    return Current(
      dt: DateTime.fromMillisecondsSinceEpoch(map?['dt']?.toInt() * 1000),
      sunrise:
          DateTime.fromMillisecondsSinceEpoch(map?['sunrise']?.toInt() * 1000),
      sunset:
          DateTime.fromMillisecondsSinceEpoch(map?['sunset']?.toInt() * 1000),
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
      weather: List<Weather>.from(
          map?['weather']?.map((x) => Weather.fromMap(x)))[0],
      rain: (map?['rain'] == null)
          ? (map?['rain'])
          : (Rain.fromMap(map?['rain'])),
      snow: (map?['snow'] == null)
          ? (map?['snow'])
          : (Snow.fromMap(map?['snow'])),
    );
  }

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Current(dt: $dt, sunrise: $sunrise, sunset: $sunset, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, dewPoint: $dewPoint, uvi: $uvi, clouds: $clouds, visibility: $visibility, windSpeed: $windSpeed, windDeg: $windDeg, windGust: $windGust, weather: $weather, rain: $rain, snow: $snow)';
  }

  @override
  List<Object?> get props {
    return [
      dt,
      sunrise,
      sunset,
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
      weather,
      rain,
      snow,
    ];
  }
}
