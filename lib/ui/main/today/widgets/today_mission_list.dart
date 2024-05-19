import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../_core/constants/constants.dart';
import '../../activity/pages/change_weight_detail_page.dart';
import '../../activity/pages/diet_management_detail_page.dart';
import '../../activity/pages/drink_water_detail_page.dart';
import '../../activity/pages/step_count_detail_page.dart';
import '../../activity/viewmodel/drink_water_viewmodel.dart';
import '../viewmodel/step_timer_viewmodel.dart';
import 'today_mission.dart';

class TodayMissionList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepTimerState = ref.watch(StepTimerProvider);
    final int currentSteps = stepTimerState.currentSteps;

    final drinkWaterModel = ref.watch(DrinkWaterProvider);
    final int currentIntake = drinkWaterModel?.drinkWaterDTO.dayWater ?? 0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: TColor.white),
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
          children: [
            SizedBox(height: gap_sm),
            Row(
              children: [
                Text("오늘의 미션", style: subtitle1()),
              ],
            ),
            SizedBox(height: gap_l),
            TodayMission(
              title: "$currentSteps 걸음 ",
              title2: "걸었어요",
              subtitle: "목표 10,000 걸음",
              icons: Icons.directions_walk,
              page: StepCountDetailPage(),
            ),
            SizedBox(height: gap_s),
            TodayMission(
              title: "오늘 $currentIntake ml ",
              title2: "마셨어요",
              subtitle: "목표 8잔",
              icons: Icons.local_drink,
              page: DrinkWaterDetailPage(),
            ),
            SizedBox(height: gap_s),
            TodayMission(
              title: "식단 0개 ",
              title2: "기록했어요",
              subtitle: "목표 3개",
              icons: Icons.restaurant,
              page: DietManagementDetailPage(),
            ),
          ],
        ),
      ),
    );
  }
}
