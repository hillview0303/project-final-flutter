import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:intl/intl.dart';

import '../viewmodel/drink_water_viewmoddel..dart';


class WaterIntakeGraph extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DrinkWaterModel? model = ref.watch(DrinkWaterProvider);

    // model에서 날짜 데이터 추출
    List<DateTime>? dates = model?.weakWaterDTO?.map((e) => e.date).toList();

    // 중앙 날짜 계산
    DateTime? centralDate;
    if (dates != null && dates.isNotEmpty) {
      centralDate = dates[dates.length ~/ 2];
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: kAccentColor2,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            centralDate != null ? DateFormat('yyyy년 MM월').format(centralDate) : '날짜 없음',
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
                mainData(model),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(DrinkWaterModel? model) {
    List<FlSpot> spots = model?.weakWaterDTO?.asMap().entries.map((e) {
      int index = e.key; // 인덱스 번호
      double yValue = e.value.water.toDouble(); // y값을 double로 변환
      return FlSpot(index.toDouble(), yValue); // FlSpot 객체 생성
    })?.toList() ??
        [];
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.blueGrey[100],
          strokeWidth: 1,
        ),
        getDrawingVerticalLine: (value) => FlLine(
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
                DateTime(2024, 5, 5),
                DateTime(2024, 5, 6),
                DateTime(2024, 5, 7),
                DateTime(2024, 5, 8),
                DateTime(2024, 5, 9),
                DateTime(2024, 5, 10),
                DateTime(2024, 5, 11),
              ];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  DateFormat('dd').format(dates[value.toInt()]),
                  style: TextStyle(
                      color: TColor.white,
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
            getTitlesWidget: (value, meta) => Text(
              '${value.toInt()}',
              style: TextStyle(
                  color: TColor.white,
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
      maxY: 500,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
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
