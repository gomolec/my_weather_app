import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;
  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  factory Weather.fromMap(Map<String, dynamic>? map) {
    return Weather(
      id: map?['id']?.toInt(),
      main: map?['main'],
      description: map?['description'],
      icon: map?['icon'],
    );
  }

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  List<Object?> get props => [id, main, description, icon];
}
