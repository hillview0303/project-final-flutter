import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/style.dart';

import '../../../_core/constants/size.dart';

class CompositionBox2 extends StatelessWidget {
  final titleColor;
  final valueColor;
  final borderColor;
  final backgroundColor;
  final name;
  final value;

  CompositionBox2(
      {this.titleColor = Colors.black,
      this.valueColor = Colors.black,
      this.borderColor = Colors.black,
      this.backgroundColor = Colors.white,
      required this.name,
      this.value = "-"});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(gap_m),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7), // 그림자 색상 및 투명도
              blurRadius: 0, // 그림자 흐림 정도
              offset: Offset(3, 3), // 그림자 위치 (수평, 수직)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(gap_sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${name}",
                style: subtitle1(mColor: titleColor),
              ),
              Text(
                "${value}kg",
                style: h6(mColor: valueColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
