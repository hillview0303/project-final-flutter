import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Path path = Path();
    const double dashWidth = 5.0;
    const double dashSpace = 5.0;
    double current = 0.0;
    final double length = size.width;
    final double height = size.height;

    // Top border
    while (current < length) {
      path.moveTo(current, 0.0);
      path.lineTo(current + dashWidth, 0.0);
      current += dashWidth + dashSpace;
    }

    current = 0.0;

    // Bottom border
    while (current < length) {
      path.moveTo(current, height);
      path.lineTo(current + dashWidth, height);
      current += dashWidth + dashSpace;
    }

    current = 0.0;

    // Left border
    while (current < height) {
      path.moveTo(0.0, current);
      path.lineTo(0.0, current + dashWidth);
      current += dashWidth + dashSpace;
    }

    current = 0.0;

    // Right border
    while (current < height) {
      path.moveTo(length, current);
      path.lineTo(length, current + dashWidth);
      current += dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
