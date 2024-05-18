import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/activity/viewmodel/walking_detail.viewmodel.dart';
import 'activity_stats_row.dart';
import 'day_tab.dart';
import 'month_tab.dart';
import 'week_tab.dart';
import 'step_count_progress.dart';

class StepCountBody extends ConsumerWidget {
  final int currentSteps;
  final String calories;
  final String totalSteps;

  StepCountBody({required this.currentSteps, required this.calories, required this.totalSteps});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(WalkingDetailProvider.notifier)..notifyInit();

    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        StepCountProgress(currentSteps: currentSteps),
        ActivityStatsRow(calories: calories, totalSteps: totalSteps),
        Expanded(
          flex: 3,
          child: TabBarView(
            children: [
              DayTab(currentSteps: currentSteps),
              WeekTab(),
              MonthTab(),
            ],
          ),
        ),
      ],
    );
  }
}
