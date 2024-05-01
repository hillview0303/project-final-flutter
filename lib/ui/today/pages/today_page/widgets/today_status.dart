import 'package:flutter/material.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import 'today_goal.dart';

class TodayStatus extends StatelessWidget {
  final name;
  final weight;
  final goalWeight;

  TodayStatus(
      {required this.name, required this.weight, this.goalWeight = "-"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gap_m),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    "${name}",
                    style: subtitle2(mColor: Colors.grey[400]!),
                  ),
                  Spacer(),
                  Text("${weight}kg"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 130,
              child: Text(
                "${goalWeight}kg",
                style: h4(),
              ),
            ),
            Expanded(
              child: TodayGoal(),
            ),
          ],
        ),
      ),
    );
  }
}
