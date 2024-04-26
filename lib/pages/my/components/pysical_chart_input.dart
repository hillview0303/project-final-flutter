import 'package:flutter/material.dart';
import 'package:project_app/common/components/single_chart.dart';
import 'package:project_app/common/design/size.dart';
import 'package:project_app/pages/my/components/input_pysical_stats.dart';

class PysicalChartInput extends StatelessWidget {
  final chartData;
  final dataName;
  final dataValue;
  final chartColor;

  PysicalChartInput(
      {required this.chartData,
      required this.dataName,
      required this.dataValue,
      this.chartColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(gap_sm),
            child: SingleChart(
              chartData: chartData,
              color: chartColor,
            ),
          ),
        ),
        SizedBox(height: gap_m),
        InputPysicalStat(dataName: dataName, value: dataValue),
      ],
    );
  }
}
