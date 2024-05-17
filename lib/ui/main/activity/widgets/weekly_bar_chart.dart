import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/ui/main/activity/viewmodel/walking_detail.viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';

class WeeklyBarChart extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WalkingDetailModel? model = ref.read(WalkingDetailProvider);
    List<double> weeklyData = model?.weakWalkings.map((e) => e.walking.toDouble()).toList() ?? [];

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
            child: Center( // Center widget to center the BarChart
              child: AspectRatio(
                aspectRatio: 1.7,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding to prevent overflow
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
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    return weekDays[index % weekDays.length];
  }

  Widget getWeekdayTitles(double value, TitleMeta meta) {
    final styles = TextStyle(
        color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14);
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(days[value.toInt()], style: styles),
    );
  }
}
