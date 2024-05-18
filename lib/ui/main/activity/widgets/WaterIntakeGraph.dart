import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:intl/intl.dart';

import '../viewmodel/drink_water_viewmodel.dart';


class WaterIntakeGraph extends StatelessWidget {

  DrinkWaterModel? model;

  WaterIntakeGraph(this.model);

  @override
  Widget build(BuildContext context) {

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
    List<DateTime> normalizedDates = dates.map((date) => DateTime(date.year, date.month, date.day)).toList();

    List<FlSpot> spots = [];
    if (model != null && model.weakWaterDTO != null) {
      for (var dto in model.weakWaterDTO!) {
        DateTime dtoDate = DateTime(dto.date.year, dto.date.month, dto.date.day);
        int index = normalizedDates.indexOf(dtoDate);
        if (index != -1) {
          double yValue = (dto.water.toDouble())/250;
          spots.add(FlSpot(index.toDouble(), yValue));
          print("Adding spot: ${dtoDate.toString()} at index $index with value $yValue");
        } else {
          print("No matching date for DTO date: ${dto.date.toString()}");
        }
      }
    }


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
      maxY: 8,
      lineBarsData: [
        LineChartBarData(spots: spots, isCurved: true, color: TColor.secondaryColor2),
      ],
    );
  }
}
