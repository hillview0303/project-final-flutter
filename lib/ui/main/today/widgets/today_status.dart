import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../viewmodel/today_page_viewmodel.dart';
import 'today_goal.dart';

class TodayStatus extends StatelessWidget {
  final name;
  final bodydata;
  final goalData;
  TodayPageModel model;


  TodayStatus({required this.name,  this.bodydata="-", this.goalData ="-",required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gap_m),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    "${name}",
                    style: subtitle3(mColor: Colors.grey[400]!),
                  ),
                  Spacer(),

                  Text("현재:${bodydata}kg",
                    style: subtitle3(mColor: TColor.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              height: 25,
              child: Text(
                "목표(kg)",
                style: subtitle3(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Text(
                "${goalData}kg",
                style: h7(),
              ),
            ),
            Expanded(
              child: TodayGoal(name,model),
            ),
          ],
        ),
      ),
    );
  }
}
