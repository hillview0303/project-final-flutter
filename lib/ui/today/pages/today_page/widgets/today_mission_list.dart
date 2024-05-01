import 'package:flutter/material.dart';
import 'package:project_app/ui/activity/pages/change_weight_detail_page/change_weight_detail_page.dart';
import 'package:project_app/ui/activity/pages/diet_management_detail_page/diet_management_detail_page.dart';
import 'package:project_app/ui/activity/pages/drink_water_detail_page/drink_water_detail_page.dart';
import 'package:project_app/ui/activity/pages/step_count_detail_page/step_count_detail_page.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import 'today_mission.dart';

class TodayMissionList extends StatelessWidget {
  const TodayMissionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Padding(
        padding: const EdgeInsets.all(gap_sm),
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
            TodayMission(
              title: "나의 변화 ",
              title2: "기록해요",
              subtitle: "목표 1회",
              icons: Icons.add_chart,
              page: ChangeWeightDetailPage(),
            ),
            SizedBox(height: gap_s),
            TodayMission(
              title: "0 걸음 ",
              title2: "걸었어요",
              subtitle: "목표 10,000 걸음",
              icons: Icons.nordic_walking,
              page: StepCountDetailPage(),
            ),
            SizedBox(height: gap_s),
            TodayMission(
              title: "오늘 0잔 마셨어요",
              subtitle: "목표 8잔",
              icons: Icons.water_drop,
              page: DrinkWaterDetailPage(),
            ),
            SizedBox(height: gap_s),
            TodayMission(
              title: "식단 0개 기록했어요",
              subtitle: "목표 3개",
              icons: Icons.food_bank_outlined,
              page: DietManagementDetailPage(),
            ),
          ],
        ),
      ),
    );
  }
}
