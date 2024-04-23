import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_app/pages/today/components/mission_container.dart';
import 'package:project_app/style.dart';

import '../../../size.dart';

class TodayBody extends StatefulWidget {
  @override
  State<TodayBody> createState() => _TodayBodyState();
}

class _TodayBodyState extends State<TodayBody> {
  List<FlSpot> fatData = [
    FlSpot(0, 20),
    FlSpot(1, 18),
    FlSpot(2, 16),
    FlSpot(3, 14),
    FlSpot(4, 12),
  ];

  List<FlSpot> muscleData = [
    FlSpot(0, 27),
    FlSpot(1, 28),
    FlSpot(2, 29),
    FlSpot(3, 30),
    FlSpot(4, 31),
  ];

  List<FlSpot> weightData = [
    FlSpot(0, 80),
    FlSpot(1, 78),
    FlSpot(2, 78),
    FlSpot(3, 76),
    FlSpot(4, 75),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(gap_sm),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("나의 변화", style: subtitle1()),
                    Spacer(),
                    Text(
                      "자세히 보기",
                      style: subtitle2(),
                    ),
                  ],
                ),
                SizedBox(
                  height: gap_l,
                ),
                Container(
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
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(showTitles: true, reservedSize: 28)),
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
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: Padding(
            padding: const EdgeInsets.all(gap_sm),
            child: Column(
              children: [
                SizedBox(height: gap_l),
                Row(
                  children: [
                    Text("오늘의 미션이에요", style: subtitle1()),
                    Spacer(),
                    Text("나의 활동", style: subtitle2())
                  ],
                ),
                SizedBox(height: gap_s),
                MissionContainer(
                  title: "나의 변화 ",
                  title2: "기록해요",
                  subtitle: "목표 1회",
                  icons: Icons.add_chart,
                ),
                SizedBox(height: gap_s),
                MissionContainer(
                  title: "0 걸음 ",
                  title2: "걸었어요",
                  subtitle: "목표 10,000 걸음",
                  icons: Icons.nordic_walking,
                ),
                SizedBox(height: gap_s),
                MissionContainer(
                  title: "오늘 0잔 마셨어요",
                  subtitle: "목표 8잔",
                  icons: Icons.water_drop,
                ),
                SizedBox(height: gap_s),
                MissionContainer(
                  title: "식단 0개 기록했어요",
                  subtitle: "목표 3개",
                  icons: Icons.food_bank_outlined,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
