import 'package:flutter/material.dart';
import 'package:project_app/ui/main/today/widgets/today_bodydata.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_chart.dart';
import 'package:project_app/ui/main/today/widgets/today_changes_detail.dart';
import 'package:project_app/ui/main/today/widgets/today_user_data.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../data/models/chartDummy.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodayUserData(),
        Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Column(
            children: [
              TodayChangesDetail(),
              SizedBox(height: gap_l),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: gap_l),
                child: TodayChangesChart(
                  fatData: fatData,
                  muscleData: muscleData,
                  weightData: weightData,
                ),
              ),
              SizedBox(height: gap_m),
              TodayBodydata(),
            ],
          ),
        ),
      ],
    );
  }
}