import 'package:flutter/material.dart';
import 'package:project_app/pages/activity/components/diet_management.dart';
import 'package:project_app/pages/activity/components/drink_water.dart';
import 'package:project_app/pages/activity/components/step_count.dart';

import '../components/activity_body_title.dart';

class ActivityBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityBodyTitle(), // 타이틀 바
        StepCount(), // 걸음 수 측정 위젯
        DrinkWater(), // 물 마시기 위접
        DietManagement(), // 식단 관리 위젯
      ],
    );
  }
}