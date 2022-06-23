import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:hive/hive.dart';

part 'location.g.dart';

@HiveType(typeId: 1)
class Location extends Equatable {
   @HiveField(0)
  final String? name;
   @HiveField(1)
  final double? lat;
   @HiveField(2)
  final double? lon;
   @HiveField(3)
  final String? state;
   @HiveField(4)
  final String? country;
  const Location({
    required this.name,
    required this.lat,
    required this.lon,
    required this.state,
    required this.country,
  });

  Location copyWith({
    String? name,
    double? lat,
    double? lon,
    String? state,
    String? country,
  }) {
    return Location(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      state: state ?? this.state,
      country: country ?? this.country,
    );
  }

  factory Location.fromMap(Map<String, dynamic>? map, String lang) {
    return Location(
      name: map?['local_names']?[lang] ?? map?['name'].toString(),
      lat: map?['lat'].toDouble(),
      lon: map?['lon'].toDouble(),
      state: map?['state'].toString(),
      country: map?['country'].toString(),
    );
  }

  factory Location.fromJson(String source, String lang) =>
      Location.fromMap(json.decode(source), lang);

  @override
  String toString() {
    return 'Location(name: $name, lat: $lat, lon: $lon, state: $state, country: $country)';
  }

  @override
  List<Object?> get props {
    return [
      name,
      lat,
      lon,
      state,
      country,
    ];
  }
}
