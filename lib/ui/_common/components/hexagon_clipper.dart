import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class HexagonClipper extends CustomClipper<Path> {
  final double radius; // 반지름을 직접 제어

  HexagonClipper({this.radius = 50.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    double angle = math.pi / 3; // 육각형 한 꼭지점의 각도
    Offset center = Offset(size.width / 2, size.height / 2);

    // 육각형의 첫 번째 꼭지점을 시작점으로 설정
    Offset startPoint = Offset(
        center.dx + radius * math.cos(0), center.dy + radius * math.sin(0));
    path.moveTo(startPoint.dx, startPoint.dy);

    // 6개의 꼭지점 생성
    for (int i = 1; i <= 6; i++) {
      double x = center.dx + radius * math.cos(angle * i);
      double y = center.dy + radius * math.sin(angle * i);
      path.lineTo(x, y);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return (oldClipper is HexagonClipper) && oldClipper.radius != this.radius;
  }
}