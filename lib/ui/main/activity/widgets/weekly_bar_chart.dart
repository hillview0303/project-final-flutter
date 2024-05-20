import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/activity/viewmodel/walking_detail.viewmodel.dart';
import 'package:project_app/ui/main/today/viewmodel/step_timer_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../../data/dtos/activity/activity_response.dart';

class WeeklyBarChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(WalkingDetailProvider);
    final stepTimerState = ref.watch(StepTimerProvider);
    final int currentSteps = stepTimerState.currentSteps;

    List<WeekWalkingDTO> weekWalkings = model?.weekWalkings ?? [];
    List<double> weeklyData = List.filled(7, 0.0);

    // 현재 요일을 기준으로 데이터를 맞춤
    DateTime now = DateTime.now();
    for (var walking in weekWalkings) {
      int dayDiff = now.difference(walking.date).inDays;
      if (dayDiff >= 0 && dayDiff < 7) {
        weeklyData[6 - dayDiff] = walking.walking.toDouble();
      }
    }

    // 오늘의 걸음 수를 현재 요일에 맞게 업데이트
    int todayIndex = (now.weekday % 7);  // 0은 일요일 6은 토요일
    weeklyData[todayIndex] = currentSteps.toDouble();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "주간 통계",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.7,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: BarChart(
                      mainBarData(weeklyData),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartData mainBarData(List<double> weeklyData) {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: EdgeInsets.all(8),
          tooltipMargin: 5,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${getWeekDay(group.x)}: ${rod.toY.toString()}',
              TextStyle(color: Colors.white),
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) => getWeekdayTitles(value, meta),
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(weeklyData),
      gridData: FlGridData(show: false),
      backgroundColor: Colors.transparent,
    );
  }

  List<BarChartGroupData> showingGroups(List<double> weeklyData) {
    return List.generate(7, (index) {
      double yValue = index < weeklyData.length ? weeklyData[index] : 0;
      return makeGroupData(index, yValue);
    });
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.greenAccent,
          width: 16,
        ),
      ],
    );
  }

  String getWeekDay(int index) {
    const weekDays = [
      'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
    ];
    return weekDays[index % weekDays.length];
  }

  Widget getWeekdayTitles(double value, TitleMeta meta) {
    final styles = TextStyle(
        color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14);
    final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(days[value.toInt()], style: styles),
    );
  }
}
