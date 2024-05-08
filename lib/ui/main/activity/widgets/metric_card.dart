import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:project_app/_core/constants/constants.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final VoidCallback onTap;
  final double? percentage;
  final bool hasData;

  MetricCard({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
    this.percentage,
    this.hasData = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCaloriesCard = title == 'CALORIES' && percentage != null;
    final bool isWeightCard = title == 'WEIGHT';
    final bool isWaterCard = title == 'WATER';
    final bool isStepsCard = title == 'STEPS';
    final Color backgroundColor = kAccentColor2;

    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: hasData ? buildCardContent(isCaloriesCard, isWeightCard, isWaterCard, isStepsCard) : buildEmptyCardContent(),
        ),
      ),
    );
  }

  Widget buildCardContent(bool isCaloriesCard, bool isWeightCard, bool isWaterCard, bool isStepsCard) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        // 칼로리 차트
        if (isCaloriesCard)
          Flexible(
            flex: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    centerSpaceRadius: 40,
                    sectionsSpace: 0,
                    startDegreeOffset: 270,
                    sections: showingSections(TColor.secondaryColor2, Colors.white24),
                  ),
                ),
                Text(
                  '${percentage!.toInt()}%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        // 몸무게 차트
        if (isWeightCard) ...[
          Flexible(
            flex: 5,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 7,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 2),
                      FlSpot(2, 5),
                      FlSpot(3, 3.5),
                      FlSpot(4, 4),
                      FlSpot(5, 3),
                      FlSpot(6, 4),
                    ],
                    isCurved: true,
                    color: TColor.primaryColor2,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
        // 물 섭취량
        if (isWaterCard) ...[
          Flexible(
            flex: 5,
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(TColor.primaryColor2, BlendMode.srcIn),
                child: Image.asset(
                  'assets/images/water.png',
                  width: 160,
                  height: 160,
                ),
              ),
            ),
          ),
        ],
        // 걸음수
        if (isStepsCard) ...[
          Flexible(
            flex: 5,
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(TColor.primaryColor2, BlendMode.srcIn),
                child: Image.asset(
                  'assets/images/walkman.png',
                  width: 160,
                  height: 160,
                ),
              ),
            ),
          ),
        ],
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          trailing,
          style: TextStyle(fontSize: 12, color: Colors.grey[200]),
        ),
      ],
    );
  }

  Widget buildEmptyCardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        SizedBox(height: 20),
        Text(
          "오늘의 기록을 측정해주세요",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(Color activeColor, Color inactiveColor) {
    return [
      PieChartSectionData(
        color: activeColor,
        value: percentage,
        radius: 20,
        title: '',
      ),
      PieChartSectionData(
        color: inactiveColor,
        value: 100 - percentage!,
        radius: 20,
        title: '',
      ),
    ];
  }
}
