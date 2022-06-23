import 'package:flutter/material.dart';
import 'package:my_weather_app/bloc/theme_cubit/theme_cubit.dart';

class CustomSun extends CustomPainter {
  final Color color;
  final ThemeType type;

  CustomSun({
    required this.color,
    required this.type,
  });

  @override
  void paint(Canvas canvas, Size size) {
    late Offset offset;

    if (type == ThemeType.morning) {
      offset = Offset(size.width / 2, size.height * 1.25); // morning
    } else if (type == ThemeType.noon) {
      offset = Offset(size.width / 2, size.height / 2); // noon
    } else {
      offset = Offset(size.width / 2, size.height * -0.5); // evening
    }

    final double radius = size.height / 2;
    canvas.drawCircle(
      offset,
      radius,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomSun oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(CustomSun oldDelegate) => false;
}
