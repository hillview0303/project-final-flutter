import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';


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
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: TColor.secondaryColor1.withOpacity(0.2), width: 4),
              left: const BorderSide(color: Colors.transparent),
              right: const BorderSide(color: Colors.transparent),
              top: const BorderSide(color: Colors.transparent),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: fatData,
              isCurved: true,
              color: Colors.redAccent,
              barWidth: 8,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: false,
                color: Colors.amberAccent.withOpacity(0),
              ),
            ),
            LineChartBarData(
              spots: muscleData,
              isCurved: true,
              color: Colors.cyanAccent,
              barWidth: 8,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: weightData,
              isCurved: true,
              color: Colors.deepPurpleAccent,
              barWidth: 8,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text('${value.toInt()}kg', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('Day 1');
                    case 1:
                      return const Text('Day 2');
                    case 2:
                      return const Text('Day 3');
                    case 3:
                      return const Text('Day 4');
                    case 4:
                      return const Text('Day 5');
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          minX: 0,
          maxX: 4,
          minY: 0,
          maxY: 150,
        ),
      ),
    );
  }
}
