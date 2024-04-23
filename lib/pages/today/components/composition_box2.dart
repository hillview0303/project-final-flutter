import 'package:flutter/material.dart';
import 'package:project_app/size.dart';
import 'package:project_app/style.dart';

class CompositionBox2 extends StatelessWidget {
  final color;
  final name;
  final value;

  CompositionBox2(
      {required this.color, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(gap_m),
          border: Border.all(color: color),
        ),
        child: Padding(
          padding: const EdgeInsets.all(gap_sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${name}",
                style: subtitle1(mColor: color),
              ),
              Text(
                "${value}kg",
                style: h6(mColor: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
