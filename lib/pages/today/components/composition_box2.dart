import 'package:flutter/material.dart';
import 'package:project_app/size.dart';
import 'package:project_app/style.dart';

class CompositionBox2 extends StatelessWidget {
  final textColor;
  final borderColor;
  final backgroundColor;
  final name;
  final value;

  CompositionBox2(
      {this.textColor = Colors.black,
      this.borderColor = Colors.black,
      this.backgroundColor = Colors.white,
      required this.name,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(gap_m),
          border: Border.all(color: borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(gap_sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${name}",
                style: subtitle1(mColor: textColor),
              ),
              Text(
                "${value}kg",
                style: h6(mColor: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
