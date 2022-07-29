import 'dart:math' as math;

import 'package:flutter/material.dart';

class RetangleMaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final left = size.width * .1;
    final right = size.width * .9;
    final top = size.height * .15;
    final bottom = size.height * .85;

    final maskPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(left, top, right, bottom),
          const Radius.circular(8),
        ),
      );

    final backgroundPath = Path()..addRect(Offset.zero & size);

    final path =
        Path.combine(PathOperation.difference, backgroundPath, maskPath);

    canvas.drawPath(path, paint);

    final markPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    const padding = 15.0;
    const lineSize = 30.0;

    final markPath = Path();

    //top left
    markPath
      ..moveTo(left - padding, top + lineSize)
      ..lineTo(left - padding, top - padding)
      ..lineTo(left + lineSize, top - padding);

    //bottom Left
    markPath
      ..moveTo(right + padding, bottom - lineSize)
      ..lineTo(right + padding, bottom + padding)
      ..lineTo(right - lineSize, bottom + padding);
    canvas.drawPath(markPath, markPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
