import 'package:flutter/material.dart';
import 'package:project_app/common/design/size.dart';
import 'package:project_app/pages/my/components/pysical_chart_input.dart';
import 'package:project_app/pages/my/components/pysical_data.dart';

class PysicalChartScrollView extends StatelessWidget {
  final dataName;
  final chartData;
  final dataValue;
  final chartColor;

  PysicalChartScrollView(
      {required this.dataName,
      required this.chartData,
      required this.dataValue,
      this.chartColor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(gap_sm),
        child: Column(
          children: [
            SizedBox(height: gap_m),
            PysicalChartInput(
              dataName: dataName,
              chartData: chartData,
              dataValue: dataValue,
              chartColor: chartColor,
            ),
            SizedBox(height: gap_m),
            PysicalData(),
          ],
        ),
      ),
    );
  }
}
