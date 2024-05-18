import 'package:flutter/material.dart';

import 'activity_card_widget.dart';

class ActivityStatsRow extends StatelessWidget {
  final String calories;
  final String totalSteps;

  ActivityStatsRow({required this.calories, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ActivityCardWidget(data: calories, label: '칼로리'),
        ActivityCardWidget(data: totalSteps, label: '총 걸음수'),
      ],
    );
  }
}
