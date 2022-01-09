import 'dart:convert';

import 'package:equatable/equatable.dart';

class Snow extends Equatable {
  final double n1h;
  const Snow({
    required this.n1h,
  });

  Snow copyWith({
    double? n1h,
  }) {
    return Snow(
      n1h: n1h ?? this.n1h,
    );
  }

  factory Snow.fromMap(Map<String, dynamic>? map) {
    return Snow(
      n1h: map?['1h']?.toDouble() ?? 0.0,
    );
  }

  factory Snow.fromJson(String source) => Snow.fromMap(json.decode(source));

  @override
  String toString() => 'Snow(n1h: $n1h)';

  @override
  List<Object> get props => [n1h];
}
