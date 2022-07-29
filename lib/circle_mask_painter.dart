import 'dart:math' as math;
import 'package:flutter/material.dart';

class CircleMaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final backgroundPath = Path()..addRect(Offset.zero & size);

    final maskPath = Path()
      ..addArc(
          Rect.fromCenter(
              center: Offset(size.width / 2, size.height / 2),
              width: size.width * 0.9,
              height: size.width * 0.9),
          0,
          math.pi * 2);

    final path =
        Path.combine(PathOperation.difference, backgroundPath, maskPath);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
