import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'current.dart';
import 'daily.dart';
import 'hourly.dart';

class Forecast extends Equatable {
  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final Current current;
  final List<Hourly> hourly;
  final List<Daily> daily;
  const Forecast({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  Forecast copyWith({
    double? lat,
    double? lon,
    String? timezone,
    int? timezoneOffset,
    Current? current,
    List<Hourly>? hourly,
    List<Daily>? daily,
  }) {
    return Forecast(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
      timezoneOffset: timezoneOffset ?? this.timezoneOffset,
      current: current ?? this.current,
      hourly: hourly ?? this.hourly,
      daily: daily ?? this.daily,
    );
  }

  factory Forecast.fromMap(Map<String, dynamic>? map) {
    print(map?['timezone_offset']?.toInt());
    return Forecast(
      lat: map?['lat']?.toDouble(),
      lon: map?['lon']?.toDouble(),
      timezone: map?['timezone']?.toString(),
      timezoneOffset: map?['timezone_offset']?.toInt(),
      current:
          Current.fromMap(map?['current'], map?['timezone_offset']?.toInt()),
      hourly: List<Hourly>.from(map?['hourly']
          ?.map((x) => Hourly.fromMap(x, map['timezone_offset']?.toInt()))),
      daily: List<Daily>.from(map?['daily']
          ?.map((x) => Daily.fromMap(x, map['timezone_offset']?.toInt()))),
    );
  }

  factory Forecast.fromJson(String source) =>
      Forecast.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Forecast(lat: $lat, lon: $lon, timezone: $timezone, timezoneOffset: $timezoneOffset, current: $current, hourly: $hourly, daily: $daily)';
  }

  @override
  List<Object?> get props {
    return [
      lat,
      lon,
      timezone,
      timezoneOffset,
      current,
      hourly,
      daily,
    ];
  }
}
