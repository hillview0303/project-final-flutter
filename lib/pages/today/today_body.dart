import 'package:flutter/material.dart';
import 'package:project_app/pages/today/components/mission_container.dart';
import 'package:project_app/style.dart';

import '../../size.dart';

class TodayBody extends StatelessWidget {
  const TodayBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: gap_l),
            Row(
              children: [
                Text("오늘의 미션이에요", style: subtitle1()),
                Spacer(),
                Text("나의 활동", style: subtitle2())
              ],
            ),
            SizedBox(height: gap_s),
            MissionContainer(
              title: "나의 변화 ",
              title2: "기록해요",
              subtitle: "목표 1회",
              icons: Icons.add_chart,
            ),
            SizedBox(height: gap_s),
            MissionContainer(
              title: "0 걸음 ",
              title2: "걸었어요",
              subtitle: "목표 10,000 걸음",
              icons: Icons.nordic_walking,
            ),
            SizedBox(height: gap_s),
            MissionContainer(
              title: "오늘 0잔 마셨어요",
              subtitle: "목표 8잔",
              icons: Icons.water_drop,
            ),
            SizedBox(height: gap_s),
            MissionContainer(
              title: "식단 0개 기록했어요",
              subtitle: "목표 3개",
              icons: Icons.food_bank_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
