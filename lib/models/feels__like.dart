import 'dart:convert';

import 'package:equatable/equatable.dart';

class FeelsLike extends Equatable {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;
  const FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  FeelsLike copyWith({
    double? day,
    double? night,
    double? eve,
    double? morn,
  }) {
    return FeelsLike(
      day: day ?? this.day,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  factory FeelsLike.fromMap(Map<String, dynamic>? map) {
    return FeelsLike(
      day: map?['day']?.toDouble(),
      night: map?['night']?.toDouble(),
      eve: map?['eve']?.toDouble(),
      morn: map?['morn']?.toDouble(),
    );
  }

  factory FeelsLike.fromJson(String source) =>
      FeelsLike.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FeelsLike(day: $day, night: $night, eve: $eve, morn: $morn)';
  }

  @override
  List<Object?> get props => [day, night, eve, morn];
}
