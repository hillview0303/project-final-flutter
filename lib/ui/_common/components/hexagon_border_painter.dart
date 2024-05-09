import 'dart:math' as math;
import 'package:flutter/material.dart';

class HexagonBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color strokeColor;
  final double rotationAngle;

  HexagonBorderPainter({this.strokeWidth = 3.0, this.strokeColor = Colors.black, this.rotationAngle = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path();
    double radius = size.width / 2;
    double angle = math.pi / 3;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.save(); // 기존 캔버스 상태 저장
    canvas.translate(center.dx, center.dy); // 중심으로 이동
    canvas.rotate(rotationAngle); // 회전

    path.moveTo(radius, 0); // 첫 번째 점
    for (int i = 1; i <= 6; i++) {
      double x = radius * math.cos(angle * i);
      double y = radius * math.sin(angle * i);
      path.lineTo(x, y);
    }
    path.close();

    canvas.drawPath(path, paint);

    canvas.restore(); // 기존 캔버스 상태 복원
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
