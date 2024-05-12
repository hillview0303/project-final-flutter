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

    // 날짜 데이터 추출 및 정렬
    List<DateTime>? dates = model?.weakWaterDTO?.map((e) => e.date).toList();
    dates?.sort((a, b) => a.compareTo(b));

    // 최근 날짜 문자열 생성
    String recentDateString = dates != null && dates.isNotEmpty
        ? DateFormat('yyyy년 MM월').format(dates.last)
        : '날짜 없음';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: kAccentColor2,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            recentDateString,
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
            decoration: BoxDecoration(color: kAccentColor2),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 24.0, horizontal: 18.0),
              child: LineChart(
                mainData(model, dates ?? []), // null-aware 연산자로 빈 리스트 전달
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(DrinkWaterModel? model, List<DateTime> dates) {
    // FlSpot 데이터 생성
    List<FlSpot> spots = model?.weakWaterDTO
        ?.where((dto) => dates.contains(dto.date))
        ?.map((dto) {
      int index = dates.indexOf(dto.date);
      double yValue = dto.water.toDouble();
      return FlSpot(index.toDouble(), yValue);
    })?.toList() ?? [];


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
              if (dates.isNotEmpty && value.toInt() < dates.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    DateFormat('dd').format(dates[value.toInt()]),
                    style: TextStyle(color: TColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                );
              }
              return Text('');
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        // 오른쪽 레이블 숨기기
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        // 상단 레이블 숨기기
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
      maxX: dates.length.toDouble() - 1,
      minY: 0,
      maxY: 500,
      lineBarsData: [
        LineChartBarData(spots: spots,
            isCurved: true,
            color: TColor.secondaryColor2,
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: true, color: Colors.transparent)),
      ],
    );
  }
}
