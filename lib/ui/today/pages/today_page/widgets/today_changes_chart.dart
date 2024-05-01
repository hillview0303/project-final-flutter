import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TodayChangesChart extends StatelessWidget {
  const TodayChangesChart({
    super.key,
    required this.fatData,
    required this.muscleData,
    required this.weightData,
  });

  final List<FlSpot> fatData;
  final List<FlSpot> muscleData;
  final List<FlSpot> weightData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.white,
          gridData: FlGridData(show: false),
          // 그래프 설정
          lineBarsData: [
            LineChartBarData(
              spots: fatData,
              isCurved: true,
              color: Colors.red,
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: muscleData,
              isCurved: true,
              color: Colors.blue,
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: weightData,
              isCurved: true,
              color: Colors.green,
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 28)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                // getTitlesWidget: (values, meta) {
                //   switch (values.toInt()) {
                //     case 0:
                //       return Text("day 1");
                //     case 1:
                //       return Text("day 2");
                //     case 2:
                //       return Text("day 3");
                //     case 3:
                //       return Text("day 4");
                //     case 4:
                //       return Text("day 5");
                //   }
                //   return Text("");
                // },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          minX: 0,
          maxX: 4,
          maxY: 200,
          minY: 0,
        ),
      ),
    );
  }
}
