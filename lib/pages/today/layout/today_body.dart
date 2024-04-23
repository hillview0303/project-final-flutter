import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_app/pages/today/components/changes_chart.dart';
import 'package:project_app/pages/today/components/composition_box2.dart';
import 'package:project_app/pages/today/components/mission_container_list.dart';
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
                SizedBox(height: gap_l),
                ChangesChart(
                  fatData: fatData,
                  muscleData: muscleData,
                  weightData: weightData,
                ),
                SizedBox(height: gap_l),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CompositionBox2(
                        name: "체지방",
                        textColor: Colors.red,
                        borderColor: Colors.red,
                        value: "14.2",
                      ),
                      SizedBox(
                        width: gap_s,
                      ),
                      CompositionBox2(
                        name: "골격근",
                        textColor: Colors.blue,
                        borderColor: Colors.blue,
                        value: "35.6",
                      ),
                      SizedBox(
                        width: gap_s,
                      ),
                      CompositionBox2(
                        name: "체중",
                        textColor: Colors.green,
                        borderColor: Colors.green,
                        value: "76.7",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        MissionContainerList(),
      ],
    );
  }
}
