import 'dart:convert';

import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String? name;
  final double? lat;
  final double? lon;
  final String? country;
  const Location({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  Location copyWith({
    String? name,
    double? lat,
    double? lon,
    String? country,
    String? zipcode,
  }) {
    return Location(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
    );
  }

  factory Location.fromMap(Map<String, dynamic>? map, String lang) {
    return Location(
      name: map?['local_names'][lang] ?? map?['name'].toString(),
      lat: map?['lat'].toDouble(),
      lon: map?['lon'].toDouble(),
      country: map?['country'].toString(),
    );
  }

  factory Location.fromJson(String source, String lang) =>
      Location.fromMap(json.decode(source), lang);

  @override
  String toString() {
    return 'Location(name: $name, lat: $lat, lon: $lon, country: $country)';
  }

  @override
  List<Object?> get props {
    return [
      name,
      lat,
      lon,
      country,
    ];
  }
}
