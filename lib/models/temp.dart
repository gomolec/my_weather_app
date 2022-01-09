import 'dart:convert';

import 'package:equatable/equatable.dart';

class Temp extends Equatable {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;
  const Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Temp copyWith({
    double? day,
    double? min,
    double? max,
    double? night,
    double? eve,
    double? morn,
  }) {
    return Temp(
      day: day ?? this.day,
      min: min ?? this.min,
      max: max ?? this.max,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  factory Temp.fromMap(Map<String, dynamic>? map) {
    return Temp(
      day: map?['day']?.toDouble(),
      min: map?['min']?.toDouble(),
      max: map?['max']?.toDouble(),
      night: map?['night']?.toDouble(),
      eve: map?['eve']?.toDouble(),
      morn: map?['morn']?.toDouble(),
    );
  }

  factory Temp.fromJson(String source) => Temp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Temp(day: $day, min: $min, max: $max, night: $night, eve: $eve, morn: $morn)';
  }

  @override
  List<Object?> get props {
    return [
      day,
      min,
      max,
      night,
      eve,
      morn,
    ];
  }
}
