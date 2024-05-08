import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:intl/intl.dart';

class WaterIntakeGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = [
      DateTime(2024, 4, 25),
      DateTime(2024, 4, 26),
      DateTime(2024, 4, 27),
      DateTime(2024, 4, 28),
      DateTime(2024, 4, 29),
      DateTime(2024, 4, 30),
      DateTime(2024, 5, 1),
    ];
    // 중앙 날짜 계산
    DateTime centralDate = dates[dates.length ~/ 2];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: kAccentColor2,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateFormat('yyyy년 MM월').format(centralDate),
            style: TextStyle(
              color: TColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        AspectRatio(
          aspectRatio: 1.6,
          child: Container(
            decoration: BoxDecoration(
              color: kAccentColor2,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) =>
            FlLine(
              color: Colors.blueGrey[100],
              strokeWidth: 1,
            ),
        getDrawingVerticalLine: (value) =>
            FlLine(
              color: Colors.blueGrey[100],
              strokeWidth: 1,
            ),
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: (value, meta) {
              List<DateTime> dates = [
                DateTime(2021, 4, 25),
                DateTime(2021, 4, 26),
                DateTime(2021, 4, 27),
                DateTime(2021, 4, 28),
                DateTime(2021, 4, 29),
                DateTime(2021, 4, 30),
                DateTime(2021, 5, 1),
              ];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  DateFormat('dd').format(dates[value.toInt()]),
                  style: TextStyle(color: TColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              );
            },
          ),
        ),
        rightTitles: AxisTitles(),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) =>
                Text(
                  '${value.toInt()}',
                  style: TextStyle(color: TColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 5),
            FlSpot(3, 3.5),
            FlSpot(4, 4),
            FlSpot(5, 6),
            FlSpot(6, 3),
          ],
          isCurved: true,
          color: TColor.secondaryColor2,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: true, color: Colors.transparent),
        ),
      ],
    );
  }
}