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

    // 현재 일주일 날짜 생성
    DateTime today = DateTime.now();
    List<DateTime> thisWeekDates = List.generate(7, (index) => today.subtract(Duration(days: 6 - index)));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: kAccentColor2,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateFormat('yyyy년 MM월').format(today),
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
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
              child: LineChart(
                mainData(model, thisWeekDates), // `thisWeekDates` 리스트를 파라미터로 전달
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(DrinkWaterModel? model, List<DateTime> dates) {
    // 데이터 매핑
    List<FlSpot> spots = model?.weakWaterDTO?.where((dto) => dates.contains(dto.date))
        .map((dto) {
      int index = dates.indexOf(dto.date);
      double yValue = dto.water.toDouble();
      return FlSpot(index.toDouble(), yValue);
    }).toList() ?? [];

    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: (value, meta) {
              if (value.toInt() < dates.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    DateFormat('dd').format(dates[value.toInt()]),
                    style: TextStyle(color: TColor.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                );
              }
              return Text('');
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) => Text(
              '${value.toInt()}',
              style: TextStyle(color: TColor.white, fontWeight: FontWeight.bold, fontSize: 15),
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
        LineChartBarData(spots: spots, isCurved: true, color: TColor.secondaryColor2),
      ],
    );
  }
}
