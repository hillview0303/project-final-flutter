import 'package:flutter/material.dart';
import 'activity_stats_row.dart';
import 'day_tab.dart';
import 'month_tab.dart';
import 'week_tab.dart';
import 'step_count_progress.dart';

class StepCountBody extends StatelessWidget {
  final int currentSteps;

  StepCountBody({required this.currentSteps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        StepCountProgress(currentSteps: currentSteps),
        ActivityStatsRow(),
        Expanded(
          flex: 3,
          child: TabBarView(
            children: [
              DayTab(),
              WeekTab(),
              MonthTab(),
            ],
          ),
        ),
      ],
    );
  }
}
