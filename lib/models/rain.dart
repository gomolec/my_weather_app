import 'dart:convert';

import 'package:equatable/equatable.dart';

class Rain extends Equatable {
  final double n1h;
  const Rain({
    required this.n1h,
  });

  Rain copyWith({
    double? n1h,
  }) {
    return Rain(
      n1h: n1h ?? this.n1h,
    );
  }

  factory Rain.fromMap(Map<String, dynamic>? map) {
    return Rain(
      n1h: map?['1h']?.toDouble() ?? 0.0,
    );
  }

  factory Rain.fromJson(String source) => Rain.fromMap(json.decode(source));

  @override
  String toString() => 'Rain(n1h: $n1h)';

  @override
  List<Object> get props => [n1h];
}
