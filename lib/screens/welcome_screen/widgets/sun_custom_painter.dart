import 'package:flutter/material.dart';

class CustomSun extends CustomPainter {
  final Color color;

  CustomSun({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final LinearGradient gradient = LinearGradient(
      colors: <Color>[color, const Color(0x00E0ACA3)],
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(0.0, 0.4),
    );
    final Offset offset = Offset(size.height / 2, size.width / 2);
    final double radius = size.height / 2;
    canvas.drawCircle(
      offset,
      radius,
      Paint()
        ..shader = gradient.createShader(
          Rect.fromCircle(
            center: offset,
            radius: radius,
          ),
        ),
    );
  }

  @override
  bool shouldRepaint(CustomSun oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(CustomSun oldDelegate) => false;
}
